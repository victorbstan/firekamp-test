# frozen_string_literal: true

class Favorite < ActiveRecord::Base
    belongs_to :user
    belongs_to :artwork
end