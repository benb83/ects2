require 'test_helper'

class Course::MastersControllerTest < ActionController::TestCase
  setup do
    @course_master = course_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_master" do
    assert_difference('Course::Master.count') do
      post :create, course_master: { code: @course_master.code, duration: @course_master.duration, instructor_id: @course_master.instructor_id, max_candidate: @course_master.max_candidate, min_candidate: @course_master.min_candidate, title: @course_master.title }
    end

    assert_redirected_to course_master_path(assigns(:course_master))
  end

  test "should show course_master" do
    get :show, id: @course_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_master
    assert_response :success
  end

  test "should update course_master" do
    patch :update, id: @course_master, course_master: { code: @course_master.code, duration: @course_master.duration, instructor_id: @course_master.instructor_id, max_candidate: @course_master.max_candidate, min_candidate: @course_master.min_candidate, title: @course_master.title }
    assert_redirected_to course_master_path(assigns(:course_master))
  end

  test "should destroy course_master" do
    assert_difference('Course::Master.count', -1) do
      delete :destroy, id: @course_master
    end

    assert_redirected_to course_masters_path
  end
end
