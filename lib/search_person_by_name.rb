class SearchPersonByName < Action
    def execute()
        begin
            name = @console.prompt('Enter name of the person to find')
            person = @people.named(name)
            @console.print(person.format)
        rescue UnknownPerson
            @console.print("Cannot find person named #{name}")
        end
    end
end
