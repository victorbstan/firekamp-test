# frozen_string_literal: true

class Artwork < ActiveRecord::Base
    belongs_to :image
    has_many :favorites
    has_many :users, through: :favorites

    validates: :title, presense: true
end