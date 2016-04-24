class HomeController < ApplicationController
  def index
  end

  def upload
    link = url_params[:link][/(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix] || nil
    status = link.match(/status\/(?<id>\d+)/)
    @media = nil
    unless status.nil? or status[:id].nil?
      @media = extract_media tclient.status(status[:id])
    end
  end

  private
    def extract_media(tweet)
      urls = []
      if tweet.media?
        #raise tweet.media[0].video_info.variants[1].url.inspect
        tweet.media.each do |media|
          if media.class == Twitter::Media::Video or media.class == Twitter::Media::AnimatedGif
            type = media.class == Twitter::Media::Video ? "video" : "gif"
            url = {type: type}
            url[:thumb] = media.media_url.to_s.inspect unless media.media_url.nil?
            media.video_info.variants.map do |v|
              url[v.url.to_s.split(".").last.to_sym] = v.url.to_s
            end
            urls.push url
          elsif media.class == Twitter::Media::Photo
            url = {type: "photo"}
            image = media.media_url.to_s
            media.sizes.each {|s| url[s[0]] = "#{image}:#{s[0].to_s}" }
            urls.push url
          end
        end
        urls
      else
        nil
      end
    end

    def url_params
      params.permit(:link)
    end
end
