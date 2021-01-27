class ContentType < ApplicationRecord

  has_many :content_fields

  accepts_nested_attributes_for :content_fields, allow_destroy: true
end
