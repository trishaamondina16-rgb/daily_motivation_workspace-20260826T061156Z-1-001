# Daily Motivation Workspace

A Dart-based command-line application that retrieves and displays daily motivational messages using a REST API.

## Project Description

The **Daily Motivation Workspace** is a command-line application developed using Dart. It connects to a motivational API to retrieve motivational messages and presents the content through a simple command-line interface.

The project demonstrates API integration, JSON data processing, object-oriented programming, command-line interaction, error handling, logging, terminal styling, and automated testing.

## Objectives

The project aims to:

1. Retrieve motivational messages from a REST API.
2. Process and convert JSON responses into Dart objects.
3. Provide a command-line interface for retrieving daily motivation.
4. Implement error handling for network and API-related problems.
5. Use terminal colors to improve the command-line interface.
6. Implement logging for application activities and errors.
7. Organize the application using a Dart workspace with multiple packages.
8. Implement automated tests for the project components.

## Features

* Retrieve daily motivational messages from an API.
* Display motivational quotes and messages.
* Support command-line interaction.
* Handle API and network errors.
* Use terminal colors for improved output.
* Record application errors through logging.
* Convert API JSON data into Dart models.
* Include automated tests.

## Technologies Used

* **Dart**
* **REST API**
* **HTTP**
* **JSON**
* **Dart Testing Framework**
* **ANSI Terminal Colors**
* **Git**
* **GitHub**

## Project Structure

```text
daily_motivation_workspace/
│
├── terminal_colors/
│   ├── lib/
│   │   ├── src/
│   │   │   ├── ansi.dart
│   │   │   └── terminal_colors_base.dart
│   │   ├── terminal_colors.dart
│   │   └── ...
│   ├── test/
│   └── pubspec.yaml
│
├── daily_motivation_api/
│   ├── lib/
│   │   ├── src/
│   │   │   ├── client.dart
│   │   │   ├── exceptions.dart
│   │   │   ├── models.dart
│   │   │   └── daily_motivation_api_base.dart
│   │   ├── daily_motivation_api.dart
│   │   └── ...
│   ├── test/
│   ├── example/
│   └── pubspec.yaml
│
├── daily_motivation_cli/
│   ├── bin/
│   │   ├── main.dart
│   │   └── daily_motivation_cli.dart
│   ├── lib/
│   │   ├── src/
│   │   │   ├── motivation_command.dart
│   │   │   ├── command_base.dart
│   │   │   ├── help_command.dart
│   │   │   ├── logging_config.dart
│   │   │   └── quote_command.dart
│   │   └── daily_motivation_cli.dart
│   ├── test/
│   └── pubspec.yaml
│
├── pubspec.yaml
├── pubspec.lock
└── .gitignore
```

## Package Description

### terminal_colors

The `terminal_colors` package provides reusable terminal styling and ANSI color constants for the command-line interface.

### daily_motivation_api

The `daily_motivation_api` package handles communication with the motivational REST API. It also contains the motivational data models, API client, and exception handling.

### daily_motivation_cli

The `daily_motivation_cli` package provides the command-line interface of the application. It handles user commands, motivational queries, help commands, logging, and formatted output.

## Requirements

Before running the project, make sure the following are installed:

* Dart SDK 3.8.1 or later
* Git
* Internet connection

## Installation

Clone the repository:

```bash
git clone https://github.com/lacsoncherryrose-byte/daily_motivation_workspace.git
```

Navigate to the project directory:

```bash
cd daily_motivation_workspace
```

Get the project dependencies:

```bash
dart pub get
```

## How to Run

Navigate to the CLI package:

```bash
cd daily_motivation_cli
```

Run the application:

```bash
dart run
```

## Example Usage

The application can be used to retrieve motivational messages through the command-line interface.

Example command:

```text
daily_motivation > motivate
```

Example output:

```text
[INFO] Retrieving daily motivation...

"Believe in yourself and keep moving forward!"

Have a great and productive day!
```

The motivational message is retrieved from the API and displayed through the command-line interface.

## API

This project uses a **REST API** to retrieve motivational content.

The API response may contain information such as:

* Motivational message
* Quote
* Author
* Content ID

The application processes the JSON response and converts the relevant information into Dart objects before displaying it in the command-line interface.

## Error Handling

The application implements error handling for possible problems such as:

* Network connection failures
* API request failures
* Invalid API responses
* Invalid motivational data
* Timeout errors

Exceptions are handled using Dart exception-handling mechanisms.

## Logging

The CLI package includes logging functionality for recording application events and errors.

Logging helps identify problems during application execution and makes troubleshooting easier.

## Testing

The project contains automated tests for the application components.

To run the tests, use:

```bash
dart test
```

The tests verify important functionality of the API and command-line components.

## Screenshots

Screenshots of the application can be added to this section to demonstrate the actual output and functionality.

### Daily Motivation Command

Add a screenshot of the motivation command here.

### Motivation Results

Add a screenshot showing the motivational message returned by the application.

### Test Results

Add a screenshot showing the successful test execution.

## GitHub Repository

The source code and project documentation are available in the repository:

**Daily Motivation Workspace**

https://github.com/trishaamondina16@gmail.com-rgb/daily_motivation_workspace

## Developer

**Trisha Gail P. Amondina

BSIT 3
Palawan State University – Taytay Campus

## Course

**IT7/L – System Integration and Architecture 1**

## Conclusion

The **Daily Motivation Workspace** demonstrates how Dart can be used to build a modular command-line application that communicates with an external REST API. The project applies important software development concepts including API integration, JSON data processing, data modeling, error handling, logging, terminal styling, automated testing, and GitHub-based project management.

Through this project, the developer gained practical experience in organizing a multi-package Dart workspace and integrating different components into one functional application. It also demonstrates how external services can be integrated into a software application to provide useful and engaging functionality for users.
