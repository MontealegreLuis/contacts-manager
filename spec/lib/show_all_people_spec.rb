require 'spec_helper'
require 'action'
require 'person'
require 'show_all_people'

describe ShowAllPeople do
    before :each do
        @console = double('console')
        @people = double('people')
        @action = ShowAllPeople.new('Remove a person', @console, @people)
    end

    it 'shows nothing when there is no registered people' do
        allow(@people).to receive(:all).and_return([])
        expect(@console).to receive(:print).exactly(0).times

        @action.execute
    end

    it 'shows all the registered people' do
        all = build_list(:person, 10)
        allow(@people).to receive(:all).and_return(all)
        expect(@console).to receive(:print).exactly(all.size).times

        @action.execute
    end
end

