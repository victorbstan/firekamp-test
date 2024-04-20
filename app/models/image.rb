# frozen_string_literal: true

class Image < ActiveRecord::Base
    has_many :artworks

    validates :url, presence: true
    validates :thumbnail_url, presence: true

    def self.ransackable_attributes(auth_object = nil)
      ["artwork_id", "created_at", "id", "id_value", "thumbnail_url", "updated_at", "url"]
    end
end
