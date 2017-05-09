#!/usr/bin/env ruby

require 'rubygems'
require 'sqlite3'
require_relative 'lib/person'
require_relative 'lib/people'
require_relative 'lib/console'
require_relative 'lib/menu'
require_relative 'lib/search_person_by_name'
require_relative 'lib/add_person'
require_relative 'lib/show_all_people'

def main
    connection = SQLite3::Database.new('database.sq3')
    connection.results_as_hash = true

    people = People.new(connection)
    console = Console.new

    menu = Menu.new(console, 'Please select an option')
    menu.add_action(ShowAllPeople.new('Show all', console, people))
    menu.add_action(SearchPersonByName.new('Look for a person', console, people))
    menu.add_action(AddPerson.new('Add a person', console, people))

    menu.run

    connection.close
end

main

