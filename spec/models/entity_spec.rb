require 'rails_helper'

RSpec.describe Entity, type: :model do
  before :each do
      User.create(id: 1,name: 'Raj',email: 'rg@gmail.com',password: '123456')
      Group.new(id: 1,name: 'Horrow',icon: 'pic.png',user_id: 1)
    end
  
  subject do
    Entity.new(user_id: 1,name: 'Big Book',amount: 165,group_id:1)
  end
  before { subject.save }
  
  it 'checks for the presence of "name"' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  
  it 'checks for the numericality of "amount"' do
    subject.amount = 'almost 165'
    expect(subject).to_not be_valid
  end
  
  it 'checks that "amount is not negative"' do
    subject.amount = -11
    expect(subject).to_not be_valid
  end
end
