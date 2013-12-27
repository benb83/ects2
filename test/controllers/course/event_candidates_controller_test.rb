require 'test_helper'

class Course::EventCandidatesControllerTest < ActionController::TestCase
  setup do
    @course_event_candidate = course_event_candidates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_event_candidates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_event_candidate" do
    assert_difference('Course::EventCandidate.count') do
      post :create, course_event_candidate: { course_event_id: @course_event_candidate.course_event_id, person_candidate_id: @course_event_candidate.person_candidate_id }
    end

    assert_redirected_to course_event_candidate_path(assigns(:course_event_candidate))
  end

  test "should show course_event_candidate" do
    get :show, id: @course_event_candidate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_event_candidate
    assert_response :success
  end

  test "should update course_event_candidate" do
    patch :update, id: @course_event_candidate, course_event_candidate: { course_event_id: @course_event_candidate.course_event_id, person_candidate_id: @course_event_candidate.person_candidate_id }
    assert_redirected_to course_event_candidate_path(assigns(:course_event_candidate))
  end

  test "should destroy course_event_candidate" do
    assert_difference('Course::EventCandidate.count', -1) do
      delete :destroy, id: @course_event_candidate
    end

    assert_redirected_to course_event_candidates_path
  end
end
