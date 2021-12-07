class Register
  include ActiveModel::Model       # make it a model
  include ActiveModel::Validations # add validations

  attr_accessor :email, :password, :password_confirmation

  validates :email, :password, :password_confirmation, presence: true
end