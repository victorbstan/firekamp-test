ActiveAdmin.register Artwork do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :date_start, :date_end, :date_display, :artist_display, :place_of_origin, :description, :short_description, :dimensions, :medium_display, :credit_line, :image_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :date_start, :date_end, :date_display, :artist_display, :place_of_origin, :description, :short_description, :dimensions, :medium_display, :credit_line, :image_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :title
  filter :date_start
  filter :date_end
  filter :date_display
  filter :artist_display
  filter :place_of_origin
  filter :description
  filter :short_description
  filter :dimensions
  filter :medium_display
  filter :credit_line

  permit_params :title,
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

  form do |f|
    f.semantic_errors

    f.inputs 'Details' do
      f.input :title
      f.input :description
      f.input :date_start
      f.input :date_end
      f.input :date_display
      f.input :artist_display
      f.input :place_of_origin
      f.input :short_description
      f.input :dimensions
      f.input :medium_display
      f.input :credit_line
    end

    f.inputs 'Image' do
      f.input :image_url, as: :string
      f.input :image_thumbnail_url, as: :string
    end

    f.actions
  end
end
