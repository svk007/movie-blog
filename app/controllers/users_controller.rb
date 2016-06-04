class UsersController < ApplicationController
  def favourites
    @a = current_user.votes.up
    @fav_posts = []
    @a.each do |a|
      @fav_posts << Post.find("#{a.votable_id}")
    end
  end
end
