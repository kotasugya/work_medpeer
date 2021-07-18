require 'rails_helper'

RSpec.describe Category, type: :model do
  # 正常にテストデータが登録された事
  it "has a valid factory" do
    expect(build(:category)).to be_valid
  end

  # 名前が無ければ無効
  it "is invalid without a name" do
    category = build(:category, name: nil)
    category.valid?
    expect(category.errors[:name]).to include("can't be blank")
  end

  # 重複し名前なら無効
  it "is invalid with a duplicate name" do
    category = create(:category)
    another_category = build(:category, name: "カテゴリー")
    another_category.valid?
    expect(another_category.errors[:name]).to include("has already been taken")
  end
end