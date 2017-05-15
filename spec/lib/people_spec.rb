require 'spec_helper'
require 'sqlite3'
require 'unknown_person'
require 'person'
require 'people'

describe People do
    before :each do
        connection = SQLite3::Database.new(':memory:')
        connection.results_as_hash = true
        connection.execute(%q{
CREATE TABLE people (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    job VARCHAR(50),
    gender VARCHAR(6),
    age INTEGER
)
})
        @people = People.new(connection)
    end

    it 'finds a registered person' do
        person = build(:person)
        @people.add(person)

        expect(@people.named("John").name).to eq("John")
    end

    it 'does not find an unknown person' do
        expect{ @people.named("John") }.to raise_error(UnknownPerson)
    end

    it 'finds all the registered people' do
       expect(@people.all.size).to be(0)
       
       people = build_list(:person, 4)
       people.each { |person| @people.add(person) }

       expect(@people.all.size).to be(4)
    end

    it 'removes a registered person' do
        person = build(:person)
        @people.add(person)
        person_to_remove = @people.named("John")

        @people.remove(person_to_remove)

        expect{ @people.named("John") }.to raise_error(UnknownPerson)
    end
end

