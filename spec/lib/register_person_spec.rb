require 'spec_helper'
require 'action'
require 'person'
require 'register_person'

describe RegisterPerson do
    before :each do
        @console = double('console')
        @people = double('people')
        @action = RegisterPerson.new('Register a person', @console, @people)
   end

    it 'registers a new person' do
        allow(@console).to receive(:prompt).and_return('Luis', 'Instructor', 'M', 37)
        expect(@people).to receive(:add).with(instance_of(Person))

        @action.execute
    end
end
