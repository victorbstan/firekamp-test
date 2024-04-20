# frozen_string_literal: true

class ArtworkSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :date_start,
             :date_end,
             :date_display,
             :artist_display,
             :place_of_origin,
             :description,
             :short_description,
             :dimensions,
             :medium_display,
             :credit_line,
             :image_url,
             :image_thumbnail_url
end
