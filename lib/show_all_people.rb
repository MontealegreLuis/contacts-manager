class ShowAllPeople
    attr_accessor :label

    def initialize(label, console, people)
        @label = label
        @console = console
        @people = people
    end

    def execute
        people = @people.all
        people.each { |person| @console.print(person.format) }
    end
end

