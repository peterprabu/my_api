class LinksController < ApplicationController
  before_action :authenticate_request

  def shorten
    link = Link.create(original_url: params[:original_url], short_url: generate_short_url)
    render json: { short_url: link.short_url }
  end

  def redirect
    link = Link.find_by(short_url: params[:short_url])
    redirect_to link.original_url
  end

  private

  def generate_short_url
    SecureRandom.urlsafe_base64(4)
  end
end
