#!/usr/bin/env ruby

require 'rubygems'
require 'sqlite3'
require_relative 'lib/People'
require_relative 'lib/Console'
require_relative 'lib/SearchPersonByName'
require_relative 'lib/AddPerson'

Person = Struct.new(:name, :job, :gender, :age)

def create_table(connection, console)
    console.print('Creating people table')
    connection.execute %{
        CREATE TABLE people (
            id INTEGER PRIMARY KEY,
            name VARCHAR(50),
            job VARCHAR(50),
            gender VARCHAR(6),
            age INTEGR
        )
    }
end

def main
    connection = SQLite3::Database.new('dbfile.sq3')
    connection.results_as_hash = true

    people = People.new(connection)
    console = Console.new
    search_by_name = SearchPersonByName.new(console, people)
    add_person = AddPerson.new(console, people)

    loop do
        option = console.prompt(%q{Please select an option:
1. Create people table
2. Add a person
3. Look for a person
4. Quit})

        case option
            when '1'
                create_table(connection, console)
            when '2'
                add_person.execute
            when '3'
                search_by_name.execute
            when '4'
                console.print('bye!')
                break;
        end
    end
    connection.close
end

main

