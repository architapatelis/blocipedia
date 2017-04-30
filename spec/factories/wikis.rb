FactoryGirl.define do
  factory :wiki do
    title RandomData.random_sentence
    body RandomData.random_paragraph
    private false
    user
    #title "MyString"
    #body "MyText"
    #private false
    #user nil
  end
end
