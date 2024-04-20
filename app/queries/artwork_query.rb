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
  end
end
