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

    def named(name)
        @connection.execute('SELECT * FROM people WHERE name = ?', name).first
    end
end

