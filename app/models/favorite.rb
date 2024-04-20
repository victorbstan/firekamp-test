# frozen_string_literal: true

class Favorite < ActiveRecord::Base
    belongs_to :user
    belongs_to :artwork

    def self.ransackable_attributes(auth_object = nil)
      ["artwork_id", "created_at", "id", "id_value", "updated_at", "user_id"]
    end
end
