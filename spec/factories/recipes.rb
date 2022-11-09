FactoryBot.define do
  factory :recipe do
    title { "MyString" }
    portion { 1 }
    time { 1 }
    content { "MyText" }
  end
end
