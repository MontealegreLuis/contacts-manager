class Person
    attr_accessor :id, :name, :job, :gender, :age

    def self.register(name, job, gender, age)
        person = self.new
        person.name = name
        person.job = job
        person.gender = gender
        person.age = age
        person
    end

    def self.from(stored_data)
        person = self.new
        person.id = stored_data['id']
        person.name = stored_data['name']
        person.job = stored_data['job']
        person.gender = stored_data['gender']
        person.age = stored_data['age']
        person
    end

    def format
        %Q{** Name: #{@name} | Job: #{@job} | Gender: #{@gender} | Age: #{@age}}
    end
end

