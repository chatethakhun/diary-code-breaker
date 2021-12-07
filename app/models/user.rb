class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_many :content_types

  with_options on: :login do
    validates :email, :password, presence: true
  end


  with_options on: :register do
    validates :email, :password, :password_confirmation , presence: true
  end
end
