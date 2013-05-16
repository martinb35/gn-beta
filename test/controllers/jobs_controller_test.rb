require 'test_helper'

class JobsControllerTest < ActionController::TestCase
  setup do
    @job = jobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job" do
    assert_difference('Job.count') do
      post :create, job: { address: @job.address, auto_assign: @job.auto_assign, bathroom: @job.bathroom, floor: @job.floor, level: @job.level, location_ref: @job.location_ref, map: @job.map, material: @job.material, notes: @job.notes, offer: @job.offer, private: @job.private, room: @job.room, second_address: @job.second_address, stored_address: @job.stored_address, title: @job.title, when: @job.when }
    end

    assert_redirected_to job_path(assigns(:job))
  end

  test "should show job" do
    get :show, id: @job
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job
    assert_response :success
  end

  test "should update job" do
    patch :update, id: @job, job: { address: @job.address, auto_assign: @job.auto_assign, bathroom: @job.bathroom, floor: @job.floor, level: @job.level, location_ref: @job.location_ref, map: @job.map, material: @job.material, notes: @job.notes, offer: @job.offer, private: @job.private, room: @job.room, second_address: @job.second_address, stored_address: @job.stored_address, title: @job.title, when: @job.when }
    assert_redirected_to job_path(assigns(:job))
  end

  test "should destroy job" do
    assert_difference('Job.count', -1) do
      delete :destroy, id: @job
    end

    assert_redirected_to jobs_path
  end
end
