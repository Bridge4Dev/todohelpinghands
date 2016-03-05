class User < ActiveRecord::Base
  has_secure_password
  has_many :todo_lists

  validates :email,   presence: true,   
                      uniqueness: true,
                      format: { with: /@/ }


  before_save :downcase_email

  def downcase_email
    self.email = email.downcase
  end

end
