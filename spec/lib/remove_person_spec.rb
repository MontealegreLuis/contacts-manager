require 'spec_helper'
require 'action'
require 'unknown_person'
require 'remove_person'

describe RemovePerson do
    before :each do
        @a_registered_person_name = "A registered person's name"
        @an_unknown_person_name = "An unkown person's name"
        @console = double('console')
        @people = double('people')
        @action = RemovePerson.new('Remove a person', @console, @people)
    end

    it 'removes an existing person' do
        allow(@console).to receive(:prompt).and_return(@a_registered_person_name)
        person = double()
        allow(@people).to receive(:named).with(@a_registered_person_name).and_return(person)
        expect(@people).to receive(:remove).with(person)

        @action.execute
    end

    it 'cannot remove an unknown person' do
        allow(@console).to receive(:prompt).and_return(@an_unknown_person_name)
        allow(@people).to receive(:named).with(@an_unknown_person_name).and_raise(UnknownPerson)
        expect(@people).not_to receive(:remove)
        expect(@console).to receive(:print).with(/#{@an_unknown_person_name}/)

        @action.execute
    end
end

