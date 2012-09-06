Fabricator :property, class_name: 'Property' do
  title       { Faker::Lorem.sentence 3   }
  description { Faker::Lorem.paragraph 2 }
end