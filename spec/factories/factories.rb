FactoryGirl.define do

  factory :user do

    username 'kasper'
    password 'repsak1'
    password_confirmation 'repsak1'

  end

  factory :rating, :class => Rating do

    score 10

  end

  factory :rating2, :class => Rating do

    score 20

  end

  factory :variety do

    name 'Green tea'

  end

  factory :brewery do

    name 'The Tea Brewery'
    year 2013

  end

  factory :tea do

    name 'Gyokuro'
    variety
    brewery

  end

end
