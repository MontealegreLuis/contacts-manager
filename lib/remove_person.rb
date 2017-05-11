class RemovePerson < Action
    def execute
        begin
            name = @console.prompt('Enter the name of the person to remove')
            person = @people.named(name)
            @people.remove(person)
        rescue UnknownPerson
            @console.print("Cannot find person named #{name}")
        end
    end
end

