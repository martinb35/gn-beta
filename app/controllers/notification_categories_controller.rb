class NotificationCategoriesController < ApplicationController
  before_action :set_notification_category, only: [:show, :edit, :update, :destroy]
  skip_authorization_check

  # GET /notification_categories
  # GET /notification_categories.json
  def index
    @notification_categories = NotificationCategory.all
  end

  # GET /notification_categories/1
  # GET /notification_categories/1.json
  def show
  end

  # GET /notification_categories/new
  def new
    @notification_category = NotificationCategory.new
  end

  # GET /notification_categories/1/edit
  def edit
  end

  # POST /notification_categories
  # POST /notification_categories.json
  def create
    @notification_category = NotificationCategory.new(notification_category_params)

    respond_to do |format|
      if @notification_category.save
        format.html { redirect_to @notification_category, notice: 'Notification category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @notification_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @notification_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notification_categories/1
  # PATCH/PUT /notification_categories/1.json
  def update
    respond_to do |format|
      if @notification_category.update(notification_category_params)
        format.html { redirect_to @notification_category, notice: 'Notification category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @notification_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notification_categories/1
  # DELETE /notification_categories/1.json
  def destroy
    @notification_category.destroy
    respond_to do |format|
      format.html { redirect_to notification_categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification_category
      @notification_category = NotificationCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_category_params
      params.require(:notification_category).permit(:notification, :category)
    end
end
