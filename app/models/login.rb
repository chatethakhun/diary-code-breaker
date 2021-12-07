class Login
  include ActiveModel::Model       # make it a model
  include ActiveModel::Validations # add validations

  attr_accessor :email, :password

  validates :email, :password, presence: true
end