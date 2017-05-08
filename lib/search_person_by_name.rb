class SearchPersonByName
    attr_accessor :label

    def initialize(label, console, people)
        @label = label
        @console = console
        @people = people
    end

    def execute()
        name = @console.prompt('Enter name of the person to find')

        person = @people.named(name)

        unless person
            @console.print('No result found')
            return
        end

        @console.print(person.format)
    end
end
