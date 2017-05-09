class People
    def initialize(connection)
        @connection = connection
    end

    def add(person)
        @connection.execute(
            'INSERT INTO people (name, job, gender, age) VALUES (?, ?, ?, ?)',
            person.name,
            person.job,
            person.gender,
            person.age
        )
    end

    def all
        rows = @connection.execute('SELECT * FROM people')
        people = []
        rows.each { |row| people << Person.from_storage(row) }
        people
    end

    def named(name)
        row = @connection.execute('SELECT * FROM people WHERE name = ?', name).first
        row == nil ? nil : Person.from_storage(row)
    end
end

