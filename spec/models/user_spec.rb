require 'rails_helper'

describe User do
  context 'contains valid data' do
    it 'is valid with an email and pw' do
      user = User.new(email: "dian@example.com", password: "12345678")
      user = FactoryGirl.build(:user)
      expect(user).to be_valid
    end
  end

  context 'contains invalid data' do
    it 'is invalid without an email' do
      user = FactoryGirl.build(:invalid_user)
      expect(user.valid?).to eq(false)
    end
  end
end