#!/usr/bin/env ruby

require 'rubygems'
require 'sqlite3'
require_relative 'lib/People'
require_relative 'lib/Console'
require_relative 'lib/SearchPersonByName'

Person = Struct.new(:name, :job, :gender, :age)

def disconnect_and_quit(connection, console)
    connection.close
    console.print('Bye!')
end

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

def add_person(people, console)
    person = Person.new
    person.name = console.prompt('Enter name')
    person.job = console.prompt('Enter job')
    person.gender = console.prompt('Enter gender')
    person.age = console.prompt('Enter age')
    people.add(person)
end

def main
    connection = SQLite3::Database.new('dbfile.sq3')
    connection.results_as_hash = true

    people = People.new(connection)
    console = Console.new
    search_by_name = SearchPersonByName.new(console, people)

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
                add_person(people, console)
            when '3'
                search_by_name.execute
            when '4'
                disconnect_and_quit(connection, console)
                break;
        end
    end
end

main

