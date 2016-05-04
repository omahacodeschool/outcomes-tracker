FactoryGirl.define do
  factory :entry do
    user_id 1
    company "MyString"
  end
  factory :cohort do
    name "MyString"
    school_id 1
    start_date "2016-05-04"
    end_date "2016-05-04"
  end
  factory :school do
    name "MyString"
    institution_code 1
    campus_location 1
  end
  factory :user do
    name "MyString"
    github "MyString"
    email "MyString"
  end
end
