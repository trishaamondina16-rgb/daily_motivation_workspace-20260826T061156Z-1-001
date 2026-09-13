import 'package:daily_motivation_api/daily_motivation_api.dart';
import 'package:test/test.dart';

void main() {
  group('Daily Motivation Model Deserialisation Suite', () {
    test('Successfully parses a valid motivational quote', () {
      final mockJson = {
        '_id': 'test-1001',
        'content': 'Keep moving forward.',
        'author': 'Test Author',
      };

      final motivation = Motivation.fromJson(mockJson);

      expect(motivation.id, equals('test-1001'));
      expect(motivation.quote, equals('Keep moving forward.'));
      expect(motivation.author, equals('Test Author'));
    });

    test('Throws custom exception for malformed JSON', () {
      final malformedJson = {'_id': 'test-1002'};

      expect(
        () => Motivation.fromJson(malformedJson),
        throwsA(isA<DailyMotivationException>()),
      );
    });
  });
}
