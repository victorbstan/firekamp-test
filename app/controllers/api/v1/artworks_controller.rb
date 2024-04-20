# frozen_string_literal: true

module Api
  module V1
    class ArtworksController < Api::V1::ApiController
      before_action :authorize_request

      def index
        # TODO: add pagination
        artworks = Artwork.all
        render json: artworks, each_serializer: ArtworkSerializer, status: :ok
      end

      def show
        artwork = Artwork.find(artwork_params[:id])
        render json: artwork, serializer: ArtworkSerializer, status: :ok
      end

      def search
        # TODO: add pagination
        search_term = params[:search_term]
        return render(json: [], status: :bad_request) if search_term.empty?

        artworks = ArtworkQuery.search(search_term)
        render json: artworks, each_serializer: ArtworkSerializer, status: :ok
      end

      # POST
      def favorite
        favorite = Favorite.new(user: @current_user, artwork_id: params[:artwork_id])
        if favorite.save
          render json: null, status: :ok
        else
          render json: { error: favorite.errors.full_messages }, status: :bad_request
        end
      end

      private

      def artwork_params
        params.permit(:id, :page, :search_term, artwork: {})
      end
    end
  end
end
