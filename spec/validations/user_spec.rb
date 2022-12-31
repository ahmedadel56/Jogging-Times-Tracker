require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Test User', email: 'tuser@example.com', password: 'password') }
  before { subject.save }

  it 'try to test user creation validations' do
    expect(subject).to be_valid
  end
  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a name that is less than 3' do
    subject.name = 'He'
    expect(subject).to_not be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a password that is less than 3' do
    subject.password = '12'
    expect(subject).to_not be_valid
  end
end
