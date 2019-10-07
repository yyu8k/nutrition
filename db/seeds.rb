# テストユーザーを作成
User.create!(
  email: 'test@test.com',
  password: '123456',
  first_name: '将暉',
  first_name_kana: 'マサキ',
  last_name: '菅田',
  last_name_kana: 'スダ',
  phone_number: '09012345678',
  birthday: '1993-02-21', 
  sex: 'male',
  height: '176',
  weight: '65',
)
    