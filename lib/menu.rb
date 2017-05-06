class Menu
    def initialize(console, title)
        @console = console
        @title = title
        @actions = []
    end

    def add_action(action)
        @actions << action
    end

    def run
        loop do
            show_menu

            option = select_option

            if (option  == @actions.length + 1)
                @console.print('Bye!')
                break
            end

            @actions[option - 1].execute
        end
    end

    private

    def show_menu
        @console.print(@title)
        @actions.each_with_index do |action, i|
            @console.print("#{i + 1}. #{action.label}")
        end
        @console.print("#{@actions.length + 1}. Exit")
    end

    def select_option
        @console.prompt("Select an option (1-#{@actions.length + 1})").to_i
    end
end

