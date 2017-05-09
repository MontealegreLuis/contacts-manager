class Person
    attr_accessor :id, :name, :job, :gender, :age

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

