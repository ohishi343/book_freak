FactoryBot.define do
  factory :relationship do
    follower_id { create(:user).id }
    following_id { create(:user).id }
  end
end
