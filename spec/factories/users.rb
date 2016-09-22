salt = "asdasdastr4325234324sdfds"

FactoryGirl.define do
  factory :user do
    first_name 'Ryan'
    last_name 'Scott'
    sequence(:email) { |n| "test#{n}@example.com" }
    mobile_number '0233381828'
    password 'secret'
    password_confirmation 'secret'
    #salt salt
    #crypted_password Sorcery::CryptoProviders::BCrypt.encrypt("secret", salt)
  end
end
