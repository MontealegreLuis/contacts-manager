FactoryGirl.define do
    factory :person do
        sequence(:id) { |i| i }
        name "John"
        job  "Instructor"
        gender "M"
        age 25
    end
end

