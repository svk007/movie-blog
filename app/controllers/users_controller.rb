class UsersController < ApplicationController
  def favourites
    @a = current_user.votes.up
    @fav_posts = []
    @a.each do |a|
      if Post.exists?("#{a.votable_id}")
        @fav_posts << Post.find("#{a.votable_id}")
      end
    end
  end
end
