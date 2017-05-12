require 'spec_helper'
require 'person'

describe Person do
    it 'can be registered' do
        person = Person.register('Luis', 'Instructor', 'M', 37)

        expect(person.name).to eq('Luis')
        expect(person.job).to eq('Instructor')
        expect(person.gender).to eq('M')
        expect(person.age).to be(37)
    end
end

