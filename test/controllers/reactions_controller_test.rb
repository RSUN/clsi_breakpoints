require 'test_helper'

class ReactionsControllerTest < ActionController::TestCase
  setup do
    @reaction = reactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reaction" do
    assert_difference('Reaction.count') do
      post :create, reaction: { authority: @reaction.authority, delivery_mechanism: @reaction.delivery_mechanism, drug_id: @reaction.drug_id, eligible_interpretations: @reaction.eligible_interpretations, footnote: @reaction.footnote, infection_type: @reaction.infection_type, isolate_id: @reaction.isolate_id, publication: @reaction.publication, reaction: @reaction.reaction, rule_row_number: @reaction.rule_row_number, used_surrogate_drug_id: @reaction.used_surrogate_drug_id, used_surrogate_drug_ordinal: @reaction.used_surrogate_drug_ordinal, used_surrogate_rule_type: @reaction.used_surrogate_rule_type }
    end

    assert_redirected_to reaction_path(assigns(:reaction))
  end

  test "should show reaction" do
    get :show, id: @reaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reaction
    assert_response :success
  end

  test "should update reaction" do
    patch :update, id: @reaction, reaction: { authority: @reaction.authority, delivery_mechanism: @reaction.delivery_mechanism, drug_id: @reaction.drug_id, eligible_interpretations: @reaction.eligible_interpretations, footnote: @reaction.footnote, infection_type: @reaction.infection_type, isolate_id: @reaction.isolate_id, publication: @reaction.publication, reaction: @reaction.reaction, rule_row_number: @reaction.rule_row_number, used_surrogate_drug_id: @reaction.used_surrogate_drug_id, used_surrogate_drug_ordinal: @reaction.used_surrogate_drug_ordinal, used_surrogate_rule_type: @reaction.used_surrogate_rule_type }
    assert_redirected_to reaction_path(assigns(:reaction))
  end

  test "should destroy reaction" do
    assert_difference('Reaction.count', -1) do
      delete :destroy, id: @reaction
    end

    assert_redirected_to reactions_path
  end
end
