class AddPerson
    def initialize(console, people)
        @people = people
        @console = console
    end

    def execute
        person = Person.new
        person.name = @console.prompt('Enter name')
        person.job = @console.prompt('Enter job')
        person.gender = @console.prompt('Enter gender')
        person.age = @console.prompt('Enter age')
        @people.add(person)
    end
end
