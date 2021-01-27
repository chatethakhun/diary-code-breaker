class Content < ApplicationRecord
  belongs_to :content_type

  serialize :properties, Hash
end
