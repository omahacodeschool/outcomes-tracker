module FormHelper
  def setup_entry(entry)
    entry.application ||= Application.new
    entry
  end
end