require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  before(:each) do
    user = User.create(name:'Muskan', email: 'tom@example.com', password: '123456')
    post user_session_path, params: { user: { name: 'Muskan', email: user.email, password: user.password } }
    get root_path
  end

  describe 'GET index' do
    it 'should return http request' do
      expect(response).to have_http_status(:success)
    end
  end
end