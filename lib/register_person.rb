class RegisterPerson < Action
    def execute
        person = Person.register(
            @console.prompt('Enter name'),
            @console.prompt('Enter job'),
            @console.prompt('Enter gender'),
            @console.prompt('Enter age')
        )
        @people.add(person)
    end
end

