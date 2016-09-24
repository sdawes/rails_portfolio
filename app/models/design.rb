class Design < ApplicationRecord
  attr_accessor :slug
  extend FriendlyId
  friendly_id :img_name, use: [:slugged, :finders]
  has_attached_file :image, styles: {
  :thumb    => ['100x100#',  :jpg, :quality => 70],
  :preview  => ['480>',      :jpg, :quality => 70],
  :large    => ['800>',      :jpg, :quality => 30],
  :retina   => ['1200>',     :jpg, :quality => 30]
},
:convert_options => {
  :thumb    => '-set colorspace sRGB -strip',
  :preview  => '-set colorspace sRGB -strip',
  :large    => '-set colorspace sRGB -strip',
  :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
