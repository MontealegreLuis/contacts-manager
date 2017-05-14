# Contacts manager

Command line application written in Ruby +  SQLite.

## Setup

Before running the application you'll need to create a database.

```bash
$ sqlite3 database.sq3 < data/table.sql
```

Install the application dependencies.

```bash
$ bundle install
```

## Usage

Run the following command from your terminal.

```bash
$ ruby application.rb
```

## Tests

To run the tests, you'll need a different database.

```bash
$ sqlite3 database_test.sq3 < data/table.sql
```

You're now ready to run specs.

```bash
$ rspec --format documentation
```

