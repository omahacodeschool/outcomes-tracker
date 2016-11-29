require 'rails_helper'

describe DecoratedPosition do

  before :each do
    @position = double()
    @decorated_position = DecoratedPosition.new(@position)
  end

  it 'formats position salary amount' do
    allow(@position).to receive_message_chain(:salary, :amount) { 25 }
    expect(@decorated_position.formatted_amount).to eq('$25')
  end

  it 'formats position acceptance time' do
    allow(@position).to receive(:created_at) { Time.zone.now }
    expect(@decorated_position.formatted_acceptance_time).to eq('less than a minute')
  end

  it 'returns nil for remote message when position not remote' do
  	allow(@position).to receive(:remote) { false }
    expect(@decorated_position.remote_message).to be_nil
  end

  it 'returns remote message when position is remote' do
    allow(@position).to receive(:remote) { true }
    expect(@decorated_position.remote_message).to eq('This is a remote position.')
  end

end