class JobApplication < ActiveRecord::Base 
  belongs_to :entry 
  accepts_nested_attributes_for :entry

  delegate :user_id, to: :entry
  delegate :company, to: :entry

  enum nature_of_employment: {"internship" => 0, "apprenticeship" => 1, 
                              "freelance/contract" => 2, "part-time" => 3, 
                              "full-time" => 4, "self-employed" => 5}

  scope :timeline, -> do
    joins(entry: [:user, :company])
        .select("job_applications.id, job_applications.entry_id, job_applications.job_title, job_applications.posting_url, job_applications.created_at, companies.name AS company, users.image_url AS user_photo, users.name, users.id AS user_id")
        .order("job_applications.created_at DESC")
  end
end
