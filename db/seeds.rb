5.times do |n|
	Category.create!(
		name: "カテゴリー#{n + 1}"
	)
end
