# frozen_string_literal: true

class Artwork < ActiveRecord::Base
    belongs_to :image
    has_many :favorites
    has_many :users, through: :favorites

    validates :title, presence: true

    def self.ransackable_associations(auth_object = nil)
      ["favorites", "image", "users"]
    end

    def self.ransackable_attributes(auth_object = nil)
      ["artist_display", "created_at", "credit_line", "date_display", "date_end", "date_start", "description", "dimensions", "id", "id_value", "image_id", "medium_display", "place_of_origin", "short_description", "title", "updated_at"]
    end
end
