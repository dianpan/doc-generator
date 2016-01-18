require 'rails_helper'

describe User do
  it 'is valid with an email and pw' do
    user = User.new(email: "dian@example.com", password: "12345678")
    expect(user).to be_valid
  end
end