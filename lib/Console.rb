class Console
    def print(message)
        puts message
    end

    def prompt(message)
        puts message
        gets.chomp
    end
end

