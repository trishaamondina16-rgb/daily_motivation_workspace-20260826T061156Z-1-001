import 'package:daily_motivation_api/daily_motivation_api.dart';
import 'package:terminal_colors/terminal_colors.dart';

import 'command_base.dart';

class MotivationCommand extends CliCommand {
  MotivationCommand()
    : super('motivate', 'Fetches a motivational quote from the remote API.');

  @override
  Future<void> execute(
    DailyMotivationApiClient client,
    List<String> arguments,
  ) async {
    try {
      final result = await client.fetchMotivation();

      final buffer = StringBuffer()
        ..writeln()
        ..writeln('========================================'.styleHeader)
        ..writeln('        DAILY MOTIVATION'.styleHeader)
        ..writeln('========================================'.styleHeader)
        ..writeln()
        ..writeln('"${result.quote}"'.styleSuccess)
        ..writeln()
        ..writeln('— ${result.author}'.styleWarning)
        ..writeln()
        ..writeln('Quote ID: ${result.id}')
        ..writeln('========================================'.styleHeader)
        ..writeln();

      print(buffer.toString());
    } on DailyMotivationException catch (e) {
      print('Operation Failed: ${e.message}'.styleError);
    }
  }
}

class HelpCommand extends CliCommand {
  HelpCommand() : super('help', 'Displays available terminal commands.');

  @override
  Future<void> execute(
    DailyMotivationApiClient client,
    List<String> arguments,
  ) async {
    final buffer = StringBuffer()
      ..writeln()
      ..writeln('Available Commands'.styleHeader)
      ..writeln('  motivate  - Get a daily motivational quote')
      ..writeln('  help      - Display this help menu')
      ..writeln('  exit      - Close the application')
      ..writeln();

    print(buffer.toString());
  }
}
