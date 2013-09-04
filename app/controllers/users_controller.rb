class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @json = User.all.to_gmaps4rails do |user, marker|
    marker.infowindow render_to_string(:partial => "/users/popup", :locals => { :user => user }) # <-- from Anthony
    marker.json({ :id => user.id, :location_name => user.location_name })
    end

    @sort_direction = params[:sort] || 'asc'

    # { "search_term" => "Apollo 13; DROP TABLE MOVIES;"}
    if params[:search_term].present?
      # SELECT * FROM MOVIES WHERE TITLE LIKE 'Apollo13'; DROP TABLE MOVIES'
      @users = User.where("last_name LIKE ?", "%#{params[:search_term]}%")
      @users = @users.order("last_name #{@sort_direction}")
      @users = @users.page(params[:page]).per(25)
    else
      @users = User.order("last_name asc").page(params[:page]).per(25)
    end

    if @sort_direction == 'asc'
      @sort_direction = 'desc'
    else
      @sort_direction = 'asc'
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_name, :first_name, :last_name, :email, :adress, :latitude, :longitude, :phone_number, :github_id, :twiter_id, :fb_id, :password_confirmation, :password)
    end
end
