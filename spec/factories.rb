FactoryGirl.define do
  factory :application do
    location "MyString"
    job_title "MyString"
    remote false
    posting_url "MyString"
    company_contact "MyString"
    notes "MyText"
    date_due "2016-05-06"
  end

  factory :entry do
    user_id 1
    company "MyString"
  end
  factory :profile do
    user_id 1
    cohort_id 1
    gender "MyString"
    birthdate "2016-05-05"
    race "MyString"
    ethnicity "MyString"
    military false
    disability false
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
