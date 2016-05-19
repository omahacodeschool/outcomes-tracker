module FormHelper
  def setup_entry(entry)
    entry.job_application ||= JobApplication.new
    entry.offer ||= Offer.new
    entry
  end
end