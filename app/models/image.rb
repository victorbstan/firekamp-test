# frozen_string_literal: true

class Image < ActiveRecord::Base
    has_many :artworks

    validates :url, presence: true
    validates :thumbnail_url, presence: true
end