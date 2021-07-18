require 'rails_helper'

RSpec.describe Idea, type: :model do
  # 正常にテストデータが登録された事
  it "has a valid factory" do
    expect(build(:idea)).to be_valid
  end

  # bodyが無ければ無効
  it "is invalid without a body" do
    idea = build(:idea, body: nil)
    idea.valid?
    expect(idea.errors[:body]).to include("can't be blank")
  end
end
