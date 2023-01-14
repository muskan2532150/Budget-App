require 'rails_helper'

RSpec.describe 'Entity', type: :request do
  before(:each) do
    user = User.create(name: 'Muskan', email: 'tom@example.com', password: '123456')
    post user_session_path, params: { user: { name: 'Muskan', email: user.email, password: user.password } }
    get root_path

    @group = Group.new(name: 'My group name', user_id: 1)
    @group.save

    @entity = Entity.new(name: 'My transaction', amount: 100, user_id: 1, group_id: @group.id)
    @entity.save
  end

  it 'returns a success response' do
    get groups_path
    expect(response).to be_successful
  end

  it 'should return http request' do
    new_group_path
    expect(response).to have_http_status(:success)
  end

  it 'returns a success response' do
    get new_group_path
    expect(response).to be_successful
  end
end
