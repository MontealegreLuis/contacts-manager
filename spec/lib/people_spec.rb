require 'spec_helper'
require 'sqlite3'
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
end

