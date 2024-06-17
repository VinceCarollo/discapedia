require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    User.create!(username: 'admin', password: 'password')
  end

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:password) }
  it { should have_secure_password }
end
