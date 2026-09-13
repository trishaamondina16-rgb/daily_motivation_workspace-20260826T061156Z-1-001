import 'package:daily_motivation_api/daily_motivation_api.dart';
abstract class CliCommand {
  final String name;
  final String description;

  CliCommand(
    this.name,
    this.description,
  );

  Future<void> execute(
    DailyMotivationApiClient client,
    List<String> arguments,
  );
}