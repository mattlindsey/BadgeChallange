require 'rails_helper'

RSpec.describe Video, :type => :model do

  it "is valid with valid attributes" do
    expect(Video.new name: 'Anyname').to be_valid
  end

  it "is not valid without a name" do
    video = Video.new(name: nil)
    expect(video).to_not be_valid
  end
end
