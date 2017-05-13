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

    it 'can be rebuilt from stored data' do
        person = Person.from({
            'id' => 1,
            'name' => 'Luis',
            'job' => 'Instructor',
            'gender' => 'M',
            'age' => 37
        })

        expect(person.id).to be(1)
        expect(person.name).to eq('Luis')
        expect(person.job).to eq('Instructor')
        expect(person.gender).to eq('M')
        expect(person.age).to be(37)
    end

    it 'can has a string representation' do
        person = Person.register('Luis', 'Instructor', 'M', 37)

        format = person.format

        expect(format).to match(/Luis/)
        expect(format).to match(/Instructor/)
        expect(format).to match(/M/)
        expect(format).to match(/37/)
    end
end

