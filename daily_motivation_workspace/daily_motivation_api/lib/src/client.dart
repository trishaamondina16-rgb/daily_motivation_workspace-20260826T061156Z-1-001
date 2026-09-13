import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import 'exceptions.dart';
import 'models.dart';

class DailyMotivationApiClient {
  final http.Client _client;

  final Logger _logger = Logger(
    'DailyMotivationApiClient',
  );

  static const String _authority = 'zenquotes.io';

  DailyMotivationApiClient(this._client);

  Future<Motivation> fetchMotivation() async {
    _logger.info(
      'Requesting a daily motivational quote.',
    );

    final uri = Uri.https(
      _authority,
      '/api/random',
    );

    try {
      _logger.info(
        'Connecting to ZenQuotes API...',
      );

      final response = await _client
          .get(
            uri,
            headers: {
              'Accept': 'application/json',
              'User-Agent':
                  'DailyMotivationTerminal/1.0',
            },
          )
          .timeout(
            const Duration(seconds: 10),
          );

      _logger.info(
        'API response received: HTTP ${response.statusCode}',
      );

      if (response.statusCode != 200) {
        throw DailyMotivationException(
          'Remote server returned HTTP '
          '${response.statusCode}.',
        );
      }

      final decoded = jsonDecode(response.body);

      if (decoded is! List) {
        throw DailyMotivationException(
          'Unexpected JSON response. '
          'Expected a list.',
        );
      }

      if (decoded.isEmpty) {
        throw DailyMotivationException(
          'The API returned an empty response.',
        );
      }

      final firstItem = decoded.first;

      if (firstItem is! Map<String, dynamic>) {
        throw DailyMotivationException(
          'Invalid motivation object returned by API.',
        );
      }

      final quote = firstItem['q'];
      final author = firstItem['a'];

      if (quote is! String || author is! String) {
        throw DailyMotivationException(
          'Quote or author has an invalid data type.',
        );
      }

      _logger.info(
        'Motivation successfully parsed.',
      );

      return Motivation(
        id: DateTime.now()
            .millisecondsSinceEpoch
            .toString(),
        quote: quote,
        author: author,
        category: 'Daily Motivation',
      );
    } on http.ClientException catch (e) {
      _logger.severe(
        'Network communication failed.',
        e,
      );

      throw DailyMotivationException(
        'Network communication failure occurred.',
        e,
      );
    } on FormatException catch (e) {
      _logger.severe(
        'Invalid JSON response received.',
        e,
      );

      throw DailyMotivationException(
        'The API returned invalid JSON data.',
        e,
      );
    } on DailyMotivationException {
      rethrow;
    } catch (e) {
      _logger.severe(
        'Unexpected processing failure was intercepted.',
        e,
      );

      throw DailyMotivationException(
        'Unexpected API processing failure occurred.',
        e,
      );
    }
  }
}
