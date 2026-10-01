[README.md](https://github.com/user-attachments/files/32882887/README.md)
# Daily Motivation Terminal

An interactive command-line app, written in Dart, that fetches random motivational quotes from the [ZenQuotes](https://zenquotes.io) API and shows them in a colorized terminal prompt.

```
========================================
      DAILY MOTIVATION TERMINAL
========================================
Type "help" to see available commands.
Type "motivate" to receive motivation.
Type "exit" to close the application.

daily-motivation > motivate

========================================
        DAILY MOTIVATION
========================================

"Keep moving forward."

— Test Author

Quote ID: 1756190000000
========================================
```

## Features

- Fetch a random motivational quote with one command
- Colorized output (headers, quotes, authors, errors) using ANSI escape codes
- Friendly error messages for network failures, timeouts and bad responses
- Clean shutdown that closes the HTTP client
- Built-in logging for easier debugging

## Commands

| Command    | Description                              |
|------------|------------------------------------------|
| `motivate` | Fetch and display a motivational quote   |
| `help`     | Show the list of available commands      |
| `exit`     | Close the application (Ctrl+D also works) |

Unknown commands print a red error message and suggest typing `help`.

## Project Structure

This repository is a Dart [pub workspace](https://dart.dev/tools/pub/workspaces) made up of three packages:

```
daily_motivation_workspace/
├── pubspec.yaml               # Workspace definition
├── terminal_colors/           # ANSI color formatting library
├── daily_motivation_api/      # Async API client + models + exceptions
└── daily_motivation_cli/      # Interactive terminal application
```

| Package                | Purpose |
|------------------------|---------|
| `terminal_colors`      | `TerminalColor` enum and a `String` extension with `.styleHeader`, `.styleSuccess`, `.styleWarning`, `.styleError` and `.color()` |
| `daily_motivation_api` | `DailyMotivationApiClient`, the `Motivation` model and `DailyMotivationException` |
| `daily_motivation_cli` | The REPL loop, the `CliCommand` base class, `MotivationCommand`, `HelpCommand` and logging setup |

## Requirements

- [Dart SDK](https://dart.dev/get-dart) 3.8.1 or newer
- An internet connection (quotes are fetched live)

## Getting Started

```bash
# 1. Clone the repository and enter the workspace
cd daily_motivation_workspace

# 2. Install dependencies for all packages
dart pub get

# 3. Run the app
dart run daily_motivation_cli
```

## Running Tests

```bash
cd daily_motivation_api
dart test
```

The current tests cover `Motivation.fromJson` for valid and malformed input.

## How It Works

1. `bin/main.dart` starts a read-eval-print loop and reads a line from stdin.
2. The first word is matched against the registered `CliCommand` objects.
3. `MotivationCommand` calls `DailyMotivationApiClient.fetchMotivation()`.
4. The client sends a `GET` request to `https://zenquotes.io/api/random` (10-second timeout), validates the JSON, and returns a `Motivation`.
5. Any failure is wrapped in a `DailyMotivationException`, which the command prints as a readable error.

## Adding a New Command

1. Create a class that extends `CliCommand` in `daily_motivation_cli/lib/src/commands.dart`:

   ```dart
   class AboutCommand extends CliCommand {
     AboutCommand() : super('about', 'Shows information about the app.');

     @override
     Future<void> execute(
       DailyMotivationApiClient client,
       List<String> arguments,
     ) async {
       print('Daily Motivation Terminal v1.0.0'.styleHeader);
     }
   }
   ```

2. Register it in the `commands` list in `bin/main.dart`:

   ```dart
   final commands = <CliCommand>[MotivationCommand(), HelpCommand(), AboutCommand()];
   ```

3. Add a line for it in `HelpCommand`.

## Known Issues / To Do

- `Motivation.fromJson` expects `_id`, `content` and `author` fields, while the live client reads ZenQuotes' `q` and `a` fields. Align the two or remove one.
- Remove the leftover template `Awesome` classes in `terminal_colors_base.dart` and `daily_motivation_api_base.dart`.
- `bin/main.dart` and `bin/daily_motivation_cli.dart` are duplicates; keep only one.
- Add tests for the CLI and `terminal_colors` packages.
- Lower the log level (currently `Level.ALL`) so log lines don't clutter normal output.
- Add `.dart_tool/` to `.gitignore` at the workspace root.

## Credits

Quotes are provided by [ZenQuotes.io](https://zenquotes.io). Please review their terms and attribution requirements before publishing or distributing this app.

## License

No license has been specified yet. Add one (for example MIT) before sharing the project publicly.
