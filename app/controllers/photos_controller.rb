class PhotosController < ApplicationController
  def new
    @member = Member.find(params[:member_id])
    #@photo = Photo.new()
    5.times { @member.photos.build }
  end

  def create
    @photo = Photo.new([:params])
   if  @photo.save
     format.html { redirect_to root_path, notice: 'Photo was successfully created.' }
    else
       format.html { render action: 'new' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
    end
  end

  def update
  end

  def edit
        @member = Member.find(params[:id])
 5.times { @member.photos.build }

  end
end
