class User < ApplicationRecord
  has_many :posts, dependent: :delete_all

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save :downcase_email


  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false}

  validates :password, presence: true, 
                        length: { minimum: 6 }


  private

    def downcase_email
        self.email.downcase!
    end

end
