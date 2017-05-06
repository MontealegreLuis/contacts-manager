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

        @console.print(%Q{Name: #{person['name']}
Job: #{person['job']}
Gender: #{person['gender']}
Age: #{person['age']}})
    end
end
