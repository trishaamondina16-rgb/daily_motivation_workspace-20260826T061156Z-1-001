import 'dart:io';

import 'package:daily_motivation_api/daily_motivation_api.dart';
import 'package:daily_motivation_cli/daily_motivation_cli.dart';
import 'package:http/http.dart' as http;
import 'package:terminal_colors/terminal_colors.dart';

Future<void> main() async {
  configureSystemTelemetry();

  final httpClient = http.Client();
  final apiClient = DailyMotivationApiClient(httpClient);

  final commands = <CliCommand>[MotivationCommand(), HelpCommand()];

  print('');
  print('========================================'.styleHeader);
  print('      DAILY MOTIVATION TERMINAL'.styleHeader);
  print('========================================'.styleHeader);
  print('Type "help" to see available commands.');
  print('Type "motivate" to receive motivation.');
  print('Type "exit" to close the application.');
  print('');

  try {
    while (true) {
      stdout.write('daily-motivation > ');

      final input = stdin.readLineSync();

      if (input == null) {
        break;
      }

      final trimmed = input.trim();

      if (trimmed.isEmpty) {
        continue;
      }

      if (trimmed.toLowerCase() == 'exit') {
        print('Exiting Daily Motivation Terminal...'.styleWarning);
        break;
      }

      final parts = trimmed.split(RegExp(r'\s+'));
      final commandName = parts.first.toLowerCase();
      final arguments = parts.sublist(1);

      CliCommand? selectedCommand;

      for (final command in commands) {
        if (command.name == commandName) {
          selectedCommand = command;
          break;
        }
      }

      if (selectedCommand == null) {
        print(
          'Unknown command. Type "help" for available commands.'.styleError,
        );
        continue;
      }

      await selectedCommand.execute(apiClient, arguments);
    }
  } finally {
    httpClient.close();

    print('System network socket disconnected successfully.'.styleSuccess);
  }
}
