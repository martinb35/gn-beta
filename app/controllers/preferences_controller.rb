class PreferencesController < ApplicationController
  before_action :set_preference, only: [:show, :edit, :update, :destroy]
  skip_authorization_check

  # GET /preferences
  # GET /preferences.json
  def index
    @preferences = Preference.all
  end

  # GET /preferences/1
  # GET /preferences/1.json
  def show
  end

  # GET /preferences/new
  def new
    @preference = Preference.new    
    @user = User.find(session[:user_id])
    @user.prefer = @user.prefer || 'oficios'
    @notification_categories = NotificationCategory.find_all_by_prefer(@user.prefer, :order => 'category')
  end

  # GET /preferences/1/edit
  def edit
  end

  # POST /preferences
  # POST /preferences.json
  def create

    params[:fields].each do |i, values|
      @preference = Preference.create(values)
    end

    User.find(params[:user_id]).update_attribute(:attach, params[:attach])

    respond_to do |format|
      if @preference.save
        format.html { redirect_to '/thank/index' }
        format.json { render action: 'show', status: :created, location: @preference }
      else
        format.html { render action: 'new' }
        format.json { render json: @preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preferences/1
  # PATCH/PUT /preferences/1.json
  def update
    respond_to do |format|
      if @preference.update(preference_params)
        format.html { redirect_to @preference, notice: 'Preference was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preferences/1
  # DELETE /preferences/1.json
  def destroy
    @preference.destroy
    respond_to do |format|
      format.html { redirect_to preferences_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preference
      @preference = Preference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def preference_params
      params.require(:preference).permit(:user_id, :notification_category_id, :check)
    end
end
