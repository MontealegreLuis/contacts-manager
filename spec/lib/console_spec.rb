require 'spec_helper'
require 'console'

describe Console do
    before :each do
        @input = double()
        @output = double()
        @console = Console.new(@input, @output)
    end

    it 'prints a message' do
        message = 'Hello, World!'
        expect(@output).to receive(:puts).with(message)

        @console.print(message)
    end

    it "takes user's name and returns it" do
        message = "Enter your name"
        expect(@output).to receive(:puts).with(message)
        allow(@input).to receive(:gets).and_return('Joe')

        name = @console.prompt(message)

        expect(name).to eq 'Joe'
    end
end
