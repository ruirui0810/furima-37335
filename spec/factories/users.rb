FactoryBot.define do
  factory :user do
    nickname {'test'}
    email {Faker::Internet.free_email}
    password {'asd000'}
    password_confirmation {password}
    last_name {'山田'}
    fast_name {'太郎'}
    last_name_kana {'ヤマダ'}
    fast_name_kana {'タロウ'}
    birth_date {'1930-01-01'}
  end
end
