class StaticPagesController < ApplicationController

  def home
    if params[:user_id]
      user_id = params[:user_id]
      @person = Flickr.people.find(user_id)

      @person.get_info!
      @photos = @person.photos

      @photos.map! do |photo|
        photo.medium!(500)
      end

    else
      @photos = nil
    end
  end


end
