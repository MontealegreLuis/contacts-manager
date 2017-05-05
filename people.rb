#!/usr/bin/env ruby

require 'rubygems'
require 'sqlite3'
require_relative 'lib/people'
require_relative 'lib/console'
require_relative 'lib/search_person_by_name'
require_relative 'lib/add_person'

Person = Struct.new(:name, :job, :gender, :age)

def main
    connection = SQLite3::Database.new('database.sq3')
    connection.results_as_hash = true

    people = People.new(connection)
    console = Console.new
    search_by_name = SearchPersonByName.new(console, people)
    add_person = AddPerson.new(console, people)

    loop do
        option = console.prompt(%q{Please select an option:
1. Add a person
2. Look for a person
3. Quit})

        case option
            when '1'
                add_person.execute
            when '2'
                search_by_name.execute
            when '3'
                console.print('bye!')
                break;
        end
    end
    connection.close
end

main

