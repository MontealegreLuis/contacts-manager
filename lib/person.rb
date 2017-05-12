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

    def self.from_storage(data)
        person = Person.new
        person.id = data['id']
        person.name = data['name']
        person.job = data['job']
        person.gender = data['gender']
        person.age = data['age']
        person
    end

    def format
        %Q{** Name: #{@name} | Job: #{@job} | Gender: #{@gender} | Age: #{@age}}
    end
end

