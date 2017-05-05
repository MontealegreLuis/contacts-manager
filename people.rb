#!/usr/bin/env ruby

require 'rubygems'
require 'sqlite3'
require_relative 'lib/People'
require_relative 'lib/Console'

Person = Struct.new(:name, :job, :gender, :age)

def disconnect_and_quit(connection, console)
    connection.close
    console.print('Bye!')
    exit
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

def find_person(people, console)
    name = console.prompt('Enter name of the person to find')

    person = people.named(name)

    unless person
        console.print('No result found')
        return
    end

    console.print(%Q{Name: #{person['name']}
Job: #{person['job']}
Gender: #{person['gender']}
Age: #{person['age']}})

end

def main
    connection = SQLite3::Database.new('dbfile.sq3')
    connection.results_as_hash = true

    people = People.new(connection)
    console = Console.new

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
                find_person(people, console)
            when '4'
                disconnect_and_quit(connection, console)
        end
    end
end

main

