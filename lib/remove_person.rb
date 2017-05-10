class RemovePerson
    attr_reader :label

    def initialize(label, console, people)
        @label = label
        @console = console
        @people = people
    end

    def execute
        name = @console.prompt('Enter the name of the person to remove')
        person = @people.named(name)
        @people.remove(person)
    end
end

