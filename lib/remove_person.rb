class RemovePerson < Action
    def execute
        name = @console.prompt('Enter the name of the person to remove')
        person = @people.named(name)
        @people.remove(person)
    end
end

