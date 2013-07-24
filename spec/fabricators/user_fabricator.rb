Fabricator(:user) do
  name  { Faker::Name.first_name }
  email { Faker::Internet.email }
  phone { Faker::PhoneNumber.phone_number }
  bio   { 'Most gifted' }
  password { 'supersecret' }
  password_confirmation { 'supersecret' }
end
