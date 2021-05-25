class AdminController < ApplicationController

  # before_action :require_login

  def home
    
  end

  def delete_collections_projects
    @image = ActiveStorage::Blob.find_signed(params[:id])
    @image.attachments.first.purge
    redirect_to edit_project_pic_path
  end

  def delete_collections_wood
    @image = ActiveStorage::Blob.find_signed(params[:id])
    @image.attachments.first.purge
    redirect_to edit_wood_pic_path
  end

  def index
    @admins = User.all
    @user = User.new
  end

end