class UrlsController < ApplicationController
  def index
    @url = Url.new
    @urls = Url.all.order(created_at: :desc)
  end

  def create
    @url = Url.new(url_params)
    @url.shortURL = generate_short_url

    if @url.save
      redirect_to urls_path, notice: "Short URL created!"
    else
      @urls = Url.all.order(created_at: :desc)
      render :index, alert: "Failed to create Short URL"
    end
  end

  def redirect_short
    url = Url.find_by(shortURL: params[:shortURL])
    if url
      redirect_to url.longURL, allow_other_host: true
    else
      redirect_to urls_path, alert: "Short URL not found"
    end
  end

  private

  def url_params
    params.require(:url).permit(:longURL)
  end

  def generate_short_url
    loop do
      token = SecureRandom.urlsafe_base64(5)
      break token unless Url.exists?(shortURL: token)
    end
  end
end
