class Console
    def initialize(input = $stdin, output = $stdout)
        @input = input
        @output = output
    end
    def print(message)
        @output.puts message
    end

    def prompt(message)
        @output.puts message
        @input.gets.chomp
    end
end

