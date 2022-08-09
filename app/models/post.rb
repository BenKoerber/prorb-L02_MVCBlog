class Post < ApplicationRecord
  belongs_to :user

  def self.postfeed_items
    Post.order(created_at: :desc)
  end

end
