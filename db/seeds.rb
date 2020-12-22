users = User.all
20.times do
  title = Faker::JapaneseMedia::OnePiece.character
  body  = Faker::JapaneseMedia::OnePiece.quote
  users.each { |user| user.boards.create!(title: title, body: body) }
end
