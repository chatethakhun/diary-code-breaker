class ContentType < ApplicationRecord

  validates :name, presence: true

  has_many :content_fields, dependent: :destroy
  has_many :contents, dependent: :destroy

  accepts_nested_attributes_for :content_fields, allow_destroy: true

end
