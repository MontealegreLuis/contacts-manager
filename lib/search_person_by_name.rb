class SearchPersonByName < Action
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
