require 'test_helper'

class IsolatesControllerTest < ActionController::TestCase
  setup do
    @isolate = isolates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:isolates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create isolate" do
    assert_difference('Isolate.count') do
      post :create, isolate: { bank: @isolate.bank, collection: @isolate.collection, isolate_id: @isolate.isolate_id, organism_code: @isolate.organism_code, site: @isolate.site, study_year: @isolate.study_year }
    end

    assert_redirected_to isolate_path(assigns(:isolate))
  end

  test "should show isolate" do
    get :show, id: @isolate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @isolate
    assert_response :success
  end

  test "should update isolate" do
    patch :update, id: @isolate, isolate: { bank: @isolate.bank, collection: @isolate.collection, isolate_id: @isolate.isolate_id, organism_code: @isolate.organism_code, site: @isolate.site, study_year: @isolate.study_year }
    assert_redirected_to isolate_path(assigns(:isolate))
  end

  test "should destroy isolate" do
    assert_difference('Isolate.count', -1) do
      delete :destroy, id: @isolate
    end

    assert_redirected_to isolates_path
  end
end
