class Content < ApplicationRecord

  include ApplicationHelper

  belongs_to :content_type

  serialize :properties, Hash

  validate :validate_properties

  def validate_properties
    content_type.content_fields.each do |field|
      if field.require? && properties[convert_to_snake_case(field.field_name)].blank?
        errors.add field.field_name, "must not be blank"
      end
    end
  end
end
