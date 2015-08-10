require 'rails_helper'

RSpec.describe Shoe, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe Show do
  let(:shoe){ build(:shoe) }

  # Happy
  it "is valid with default attributes" do
    expect(shoe).to be_valid
  end

  #Sad
  it "is invalid without a brand" do
    user.brand=nil
    expect(shoe).to_not be_valid
  end
  it "is invalid without a model" do
    user.model=nil
    expect(shoe).to_not be_valid
  end
  it "is invalid without a year" do
    user.year=nil
    expect(shoe).to_not be_valid
  end

  it "is invalid without a purchase_date" do
    user.purchase_date=nil
    expect(shoe).to_not be_valid
  end
end

