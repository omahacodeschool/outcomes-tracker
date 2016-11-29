require 'rails_helper'

describe DecoratedOffer do

  before :each do
    @offer = double()
    @decorated_offer = DecoratedOffer.new(@offer)
  end

  it 'formats position salary amount' do
    allow(@offer).to receive_message_chain(:salary, :amount) { 25 }
    expect(@decorated_offer.formatted_amount).to eq('$25')
  end

  it 'formats position acceptance time' do
    allow(@offer).to receive(:created_at) { Time.zone.now }
    expect(@decorated_offer.formatted_acceptance_time).to eq('less than a minute')
  end

  it 'returns nil for remote message when position not remote' do
    allow(@offer).to receive(:remote) { false }
    expect(@decorated_offer.remote_message).to be_nil
  end

  it 'returns remote message when position is remote' do
    allow(@offer).to receive(:remote) { true }
    expect(@decorated_offer.remote_message).to eq('This is a remote position.')
  end

end