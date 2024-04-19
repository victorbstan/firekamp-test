# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :token

  def token
    @instance_options[:token]
  end
end
