require 'rails_helper'

describe User, type: :model do
  # context 'contains valid data' do
  #   it { expect(subject).to validate_presence_of(:email) }
  #   it { expect(subject).to validate_presence_of(:password).on(:create) }
  #   it { expect(subject).to validate_length_of(:password).is_at_least(8).on(:create) }
  #   it { expect(FactoryGirl.build(:user)).to validate_presence_of(:email).on(:save) }
  # end

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