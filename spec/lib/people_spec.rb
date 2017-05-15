require 'spec_helper'
require 'sqlite3'
require 'unknown_person'
require 'person'
require 'people'

describe People do
    before :each do
        connection = SQLite3::Database.new('database_test.sq3')
        connection.results_as_hash = true
        @people = People.new(connection)
    end

    it 'finds a registered person' do
        person = build(:person)

        @people.add(person)

        expect(@people.named("John").name).to eq("John")
    end

    it 'does not find an unknown person' do
        expect{ @people.named("Luis") }.to raise_error(UnknownPerson)
    end
end

