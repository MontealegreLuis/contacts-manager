# Contacts manager

[![Build Status](https://travis-ci.org/MontealegreLuis/contacts-manager.svg?branch=master)](https://travis-ci.org/MontealegreLuis/contacts-manager)

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

To run the specs execute the following command:

```bash
$ rspec --format documentation
```

