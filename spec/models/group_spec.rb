require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    User.create(id: 1, name: 'Raj', email: 'rg@gmail.com', password: '123456')
  end

  subject do
    Group.new(id: 1, name: 'Horrow', icon: 'pic.png', user_id: 1)
  end

  before { subject.save }

  it 'checks for the presence of "name"' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'checks for the presence of "icon"' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
