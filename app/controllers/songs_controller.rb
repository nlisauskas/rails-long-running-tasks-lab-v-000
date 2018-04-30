class SongsController < ApplicationController

  require 'csv'

  def index
    @songs = Song.all
  end

  def upload
    CSV.foreach(params[:songs].path, headers: true) do |song|
      Customer.create(email: song[0], first_name: song[1], last_name: song[2])
    end
    redirect_to customers_path
  end
  
end