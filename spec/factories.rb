FactoryGirl.define do
  factory :hiding do
    user nil
    company nil
  end
  factory :company do
    name "MyString"
  end
  factory :event do
    entry nil
    notes "MyText"
  end
  factory :salary do
    amount 1
    rate 1
  end
  factory :position do
    job_title "MyString"
    location "MyString"
    remote false
    start_date "2016-07-12 12:50:24"
    end_date "2016-07-12 12:50:24"
  end
  factory :offer do
    job_title "MyString"
    location "MyString"
    remote false
  end
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
    github_username "MyString"
    email "MyString"
  end
end
