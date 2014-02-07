require 'test_helper'

class NotificationCategoriesControllerTest < ActionController::TestCase
  setup do
    @notification_category = notification_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notification_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notification_category" do
    assert_difference('NotificationCategory.count') do
      post :create, notification_category: { category: @notification_category.category, notification: @notification_category.notification }
    end

    assert_redirected_to notification_category_path(assigns(:notification_category))
  end

  test "should show notification_category" do
    get :show, id: @notification_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notification_category
    assert_response :success
  end

  test "should update notification_category" do
    patch :update, id: @notification_category, notification_category: { category: @notification_category.category, notification: @notification_category.notification }
    assert_redirected_to notification_category_path(assigns(:notification_category))
  end

  test "should destroy notification_category" do
    assert_difference('NotificationCategory.count', -1) do
      delete :destroy, id: @notification_category
    end

    assert_redirected_to notification_categories_path
  end
end
