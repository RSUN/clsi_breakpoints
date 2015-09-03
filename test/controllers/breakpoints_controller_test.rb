require 'test_helper'

class BreakpointsControllerTest < ActionController::TestCase
  setup do
    @breakpoint = breakpoints(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:breakpoints)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create breakpoint" do
    assert_difference('Breakpoint.count') do
      post :create, breakpoint: { delivery_mechanism: @breakpoint.delivery_mechanism, drug_id: @breakpoint.drug_id, footnote: @breakpoint.footnote, genus_exclude: @breakpoint.genus_exclude, genus_include: @breakpoint.genus_include, gram_include: @breakpoint.gram_include, infection_type: @breakpoint.infection_type, level_1_include: @breakpoint.level_1_include, level_3_exclude: @breakpoint.level_3_exclude, level_3_include: @breakpoint.level_3_include, master_group_include: @breakpoint.master_group_include, ni_if_surrogate_is: @breakpoint.ni_if_surrogate_is, organism_code_exclude: @breakpoint.organism_code_exclude, organism_code_include: @breakpoint.organism_code_include, organism_group_include: @breakpoint.organism_group_include, r_if_blt_is: @breakpoint.r_if_blt_is, r_if_surrogate_is: @breakpoint.r_if_surrogate_is, r_minimum: @breakpoint.r_minimum, s_maximum: @breakpoint.s_maximum, surrogate_drugs: @breakpoint.surrogate_drugs, viridans_group_include: @breakpoint.viridans_group_include }
    end

    assert_redirected_to breakpoint_path(assigns(:breakpoint))
  end

  test "should show breakpoint" do
    get :show, id: @breakpoint
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @breakpoint
    assert_response :success
  end

  test "should update breakpoint" do
    patch :update, id: @breakpoint, breakpoint: { delivery_mechanism: @breakpoint.delivery_mechanism, drug_id: @breakpoint.drug_id, footnote: @breakpoint.footnote, genus_exclude: @breakpoint.genus_exclude, genus_include: @breakpoint.genus_include, gram_include: @breakpoint.gram_include, infection_type: @breakpoint.infection_type, level_1_include: @breakpoint.level_1_include, level_3_exclude: @breakpoint.level_3_exclude, level_3_include: @breakpoint.level_3_include, master_group_include: @breakpoint.master_group_include, ni_if_surrogate_is: @breakpoint.ni_if_surrogate_is, organism_code_exclude: @breakpoint.organism_code_exclude, organism_code_include: @breakpoint.organism_code_include, organism_group_include: @breakpoint.organism_group_include, r_if_blt_is: @breakpoint.r_if_blt_is, r_if_surrogate_is: @breakpoint.r_if_surrogate_is, r_minimum: @breakpoint.r_minimum, s_maximum: @breakpoint.s_maximum, surrogate_drugs: @breakpoint.surrogate_drugs, viridans_group_include: @breakpoint.viridans_group_include }
    assert_redirected_to breakpoint_path(assigns(:breakpoint))
  end

  test "should destroy breakpoint" do
    assert_difference('Breakpoint.count', -1) do
      delete :destroy, id: @breakpoint
    end

    assert_redirected_to breakpoints_path
  end
end
