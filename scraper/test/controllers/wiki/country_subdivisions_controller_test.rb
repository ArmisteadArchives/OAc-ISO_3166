require 'test_helper'

class Wiki::CountrySubdivisionsControllerTest < ActionController::TestCase
  setup do
    @wiki_country_subdivision = wiki_country_subdivisions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wiki_country_subdivisions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wiki_country_subdivision" do
    assert_difference('Wiki::CountrySubdivision.count') do
      post :create, wiki_country_subdivision: { alpha: @wiki_country_subdivision.alpha, country_id: @wiki_country_subdivision.country_id, iso_name: @wiki_country_subdivision.iso_name, native_name: @wiki_country_subdivision.native_name }
    end

    assert_redirected_to wiki_country_subdivision_path(assigns(:wiki_country_subdivision))
  end

  test "should show wiki_country_subdivision" do
    get :show, id: @wiki_country_subdivision
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wiki_country_subdivision
    assert_response :success
  end

  test "should update wiki_country_subdivision" do
    patch :update, id: @wiki_country_subdivision, wiki_country_subdivision: { alpha: @wiki_country_subdivision.alpha, country_id: @wiki_country_subdivision.country_id, iso_name: @wiki_country_subdivision.iso_name, native_name: @wiki_country_subdivision.native_name }
    assert_redirected_to wiki_country_subdivision_path(assigns(:wiki_country_subdivision))
  end

  test "should destroy wiki_country_subdivision" do
    assert_difference('Wiki::CountrySubdivision.count', -1) do
      delete :destroy, id: @wiki_country_subdivision
    end

    assert_redirected_to wiki_country_subdivisions_path
  end
end
