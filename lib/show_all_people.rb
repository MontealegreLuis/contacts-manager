class ShowAllPeople < Action
    def execute
        people = @people.all
        people.each { |person| @console.print(person.format) }
    end
end

