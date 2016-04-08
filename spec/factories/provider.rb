FactoryGirl.define do
  factory :provider do
    name "1232zlhsfg;ka"
    uid  "1234567890-"
    token "12ysdjkfgasdf"
  end

  trait :facebook do
    name  "facebook"
  end

  trait :twitter do
    name  "twitter"
  end
end
