class User < ApplicationRecord
  before_save :downcase_email
  validates :full_name, presence: true, length: { maximum: 50 }
  validates :mobile_number, presence: true, length: { maximum: 20 }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  
  private

    # Converts email to all lowercase.
    def downcase_email
      self.email = email.downcase
    end
end
