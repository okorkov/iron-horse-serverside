class HeaderController < ApplicationController

  def edit
    @info = Info.all.first
  end

end