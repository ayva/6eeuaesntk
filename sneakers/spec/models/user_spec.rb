require 'rails_helper'

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe User do
  let(:user){ build(:user) }

  it "doesn't allow a name shorter than 8 characters" do
    user.name="Om"
    expect(user).to_not be_valid
  end

  it "doesn't allow a name longer than 24 characters" do
    user.name="Omverylongnameverylongname"
    expect(user).to_not be_valid
  end

end
