require 'spec_helper'
require 'menu'

describe Menu do
    before :each do
        @console = double()
        @title = 'Contacts manager'
        @menu = Menu.new(@console, @title)
    end

    it 'exits the application if there are no actions available' do
        allow(@console).to receive(:print).with(@title)
        allow(@console).to receive(:print).with(/Exit/)
        allow(@console).to receive(:prompt).and_return(1)
        expect(@console).to receive(:print).with(/Bye/)

        @menu.run
    end

    it 'executes 1 action and exits the application' do
        allow(@console).to receive(:print).with(@title)
        # Menu is shown twice
        allow(@console).to receive(:print).with(/1/).exactly(2).times
        allow(@console).to receive(:print).with(/Exit/).exactly(2).times
        # Choose first action, then exit
        allow(@console).to receive(:prompt).and_return(1, 2)
        allow(@console).to receive(:print).with(/Bye/)
        action = double()
        allow(action).to receive(:label)
        expect(action).to receive(:execute)
        @menu.add_action(action)

        @menu.run
    end

    it 'executes 1 action twice and exits the application' do
        allow(@console).to receive(:print).with(@title)
        # Menu is shown three times
        allow(@console).to receive(:print).with(/1/).exactly(3).times
        allow(@console).to receive(:print).with(/Exit/).exactly(3).times
        # Choose first action twice, then exit
        allow(@console).to receive(:prompt).and_return(1, 1, 2)
        allow(@console).to receive(:print).with(/Bye/)

        # Action should be printed 3 times and executed twice
        action = double()
        expect(action).to receive(:label).exactly(3).times
        expect(action).to receive(:execute).exactly(2).times

        @menu.add_action(action)

        @menu.run
    end


    it 'executes 2 actions and exits the application' do
        allow(@console).to receive(:print).with(@title)
        # Menu is shown three times
        allow(@console).to receive(:print).with(/1/).exactly(3).times
        allow(@console).to receive(:print).with(/2/).exactly(3).times
        allow(@console).to receive(:print).with(/Exit/).exactly(3).times
        # Choose first and second action, then exit
        allow(@console).to receive(:prompt).and_return(1, 2, 3)
        allow(@console).to receive(:print).with(/Bye/)

        action1 = double()
        allow(action1).to receive(:label)
        expect(action1).to receive(:execute)

        action2 = double()
        allow(action2).to receive(:label)
        expect(action2).to receive(:execute)

        @menu.add_action(action1)
        @menu.add_action(action2)

        @menu.run
    end
end

