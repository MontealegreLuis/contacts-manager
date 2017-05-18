require 'spec_helper'
require 'action'
require 'unknown_person'
require 'search_person_by_name'

describe SearchPersonByName do
    before :each do
        @a_registered_person_name = "A registered person's name"
        @an_unknown_person_name = "An unkown person's name"
        @console = double('console')
        @people = double('people')
        @action = SearchPersonByName.new('Search a person by name', @console, @people)
    end

    it 'finds a registered person' do
        person = double()
        allow(@console).to receive(:prompt).and_return(@a_registered_person_name)
        allow(@people).to receive(:named).with(@a_registered_person_name).and_return(person)
        expect(@console).to receive(:print)
        expect(person).to receive(:format)

        @action.execute
    end

    it 'does not find an unknown person' do
        allow(@console).to receive(:prompt).and_return(@an_unknown_person_name)
        allow(@people).to receive(:named).with(@an_unknown_person_name).and_raise(UnknownPerson)
        expect(@console).to receive(:print).with(/Cannot find/)

        @action.execute
    end
end

