require 'test_helper'

class MicsControllerTest < ActionController::TestCase
  setup do
    @mic = mics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mic" do
    assert_difference('Mic.count') do
      post :create, mic: { drug_id: @mic.drug_id, edge: @mic.edge, isolate_id: @mic.isolate_id, value: @mic.value }
    end

    assert_redirected_to mic_path(assigns(:mic))
  end

  test "should show mic" do
    get :show, id: @mic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mic
    assert_response :success
  end

  test "should update mic" do
    patch :update, id: @mic, mic: { drug_id: @mic.drug_id, edge: @mic.edge, isolate_id: @mic.isolate_id, value: @mic.value }
    assert_redirected_to mic_path(assigns(:mic))
  end

  test "should destroy mic" do
    assert_difference('Mic.count', -1) do
      delete :destroy, id: @mic
    end

    assert_redirected_to mics_path
  end
end
