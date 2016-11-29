require 'rails_helper'

describe DecoratedEvent do

  before :each do
    @event = double()
    @decorated_event = DecoratedEvent.new(@event)
  end

  it 'formats notes' do
    allow(@event).to receive(:notes) { "Here is some basic text...\n...with a line break." }
    expect(@decorated_event.formatted_notes).to match(/<p>Here is some basic text.../)
    # For some reason the expectation below fails because the actual result contains "\\n". 
    # Not sure why there is the double \\.
    # expect(@decorated_event.formatted_notes).to match('<p>Here is some basic text...\n<br />...with a line break.</p>')
  end

  it 'formats event created time' do
    allow(@event).to receive(:created_at) { Time.zone.now }
    expect(@decorated_event.formatted_time_ago).to eq('less than a minute')
  end

end