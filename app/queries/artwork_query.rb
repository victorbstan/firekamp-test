# frozen_string_literal: true

class ArtworkQuery
  class << self
    def search(search_term)
      Artwork.where(
        'title LIKE ? OR artist_display LIKE ? OR short_description LIKE ?',
        "%#{search_term}%",
        "%#{search_term}%",
        "%#{search_term}%"
      )
    end

    def favorite(user_id:, artwork_id:)
      Favorite.new(user_id:, artwork_id:)
    end
  end
end
