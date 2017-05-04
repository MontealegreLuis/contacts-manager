#!/usr/bin/env ruby

require 'rubygems'
require 'sqlite3'
require_relative 'lib/People'

Person = Struct.new(:name, :job, :gender, :age)

def disconnect_and_quit(connection)
    connection.close
    puts 'Bye!'
    exit
end

def create_table(connection)
    puts 'Creating people table'
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

def add_person(people)
    person = Person.new
    puts 'Enter name'
    person.name = gets.chomp
    puts 'Enter job'
    person.job = gets.chomp
    puts 'Enter gender'
    person.gender = gets.chomp
    puts 'Enter age'
    person.age = gets.chomp
    people.add(person)
end

def find_person(people)
    puts 'Enter name of the person to find:'
    name = gets.chomp

    person = people.named(name)

    unless person
        puts 'No result found'
        return
    end

    puts %Q{Name: #{person['name']}
Job: #{person['job']}
Gender: #{person['gender']}
Age: #{person['age']}}
end

def main
    connection = SQLite3::Database.new('dbfile.sq3')
    connection.results_as_hash = true

    people = People.new(connection)

    loop do
        puts %q{Please select an option:
1. Create people table
2. Add a person
3. Look for a person
4. Quit}

        case gets.chomp
            when '1'
                create_table(connection)
            when '2'
                add_person(people)
            when '3'
                find_person(people)
            when '4'
                disconnect_and_quit(connection)
        end
    end
end

main

