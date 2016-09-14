class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  has_attached_file :image, styles: { medium: "600x", thumb: "100x" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
