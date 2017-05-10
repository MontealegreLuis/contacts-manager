class Action
    attr_reader :label

    def initialize(label, console, people)
        @label = label
        @console = console
        @people = people
    end
end

