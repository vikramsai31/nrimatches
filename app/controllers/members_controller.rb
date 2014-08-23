class MembersController < ApplicationController
  before_action :set_member, only: [:show,:edit, :update, :destroy]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
    5.times { @member.photos.build }
    
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
 5.times { @member.photos.build }
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to root_path, notice: 'Member was successfully created.' }
        format.js   {}
        format.json { render action: 'show', status: :created, location: @member }
      else
        format.html { render action: 'new' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end
  
   def update_select_state
   @states = State.where(:country_id => params[:id]).order(:name) unless params[:id].blank?
   @states.inspect
   render :partial => "members/states", :locals => {:states => @states}
   end 
   

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:firstname, :lastname, :user_id, :dob,:gender,:country_id,
      :state_id,:city,:height,:weight,:complexion,photos_attributes: [:member_id,:data_file_name,:data_content_type,:data_file_size])
    end
end
