require "open-uri"

class Coin < ApplicationRecord
  has_one_attached :icon

  validates_presence_of :name, :tag
  validates_uniqueness_of :name, :tag

  def attach_icon_from_url(url)
    downloaded_image = URI.open(url)
    icon.attach(io: downloaded_image, filename: "icon_#{id}.#{url.split('.').last}", content_type: downloaded_image.content_type)
  end
end
