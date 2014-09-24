class PhotosController < ApplicationController
before_action :authenticate_user!
  def new
    @member = Member.find(params[:member_id])
   @photo = @member.photos.build
  
 
    

  end

  def create
    @member = Member.find(params[:member_id])
    @photo = @member.photos.build(photo_params)
     respond_to do |format|
   if  @photo.save
     format.html { render action: 'new' } 
   else
     format.html { render action: 'new' }
     format.json { render json: @photo.errors, status: :unprocessable_entity }
   end
   end
    
   end

  

  
  def destroy
    @member = Member.find(params[:member_id])
    @photo = @member.photos.find(params[:id])
    if  @photo.destroy
   redirect_to :action => 'new'
    end
    
  end
  
  private
  def photo_params
  params.require(:photo).permit(:data)
end
end
