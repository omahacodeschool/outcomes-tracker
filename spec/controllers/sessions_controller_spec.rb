describe SessionsController, :omniauth do
  
  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
        provider: 'github',
        uid: '12345',
        info: {
          name: 'test robot',
          email: 'robot@robot.robot',
          nickname: 'testrobot',
          image: 'something.png'
        }
      })
  end

  describe '#create' do

    it "creates a new user" do
      expect {post :create, provider: :github}.to change{ User.count }.by(1)
    end

    it "creates a session" do
      expect(session[:user_id]).to be_nil
      post :create, provider: :github
      expect(session[:user_id]).not_to be_nil
    end
  end

  describe "#destroy" do

    before do
      post :create, provider: :github
    end

    it "resets the session" do
      expect(session[:user_id]).not_to be_nil
      delete :destroy
      expect(session[:user_id]).to be_nil
    end
  end

end