module FormHelper
  def setup_entry(entry)
    entry.job_application ||= JobApplication.new
    entry
  end
end