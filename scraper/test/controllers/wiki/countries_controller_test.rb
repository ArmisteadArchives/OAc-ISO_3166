require 'test_helper'

class Wiki::CountriesControllerTest < ActionController::TestCase
  setup do
    @wiki_country = wiki_countries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wiki_countries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wiki_country" do
    assert_difference('Wiki::Country.count') do
      post :create, wiki_country: { alpha_2: @wiki_country.alpha_2, alpha_3: @wiki_country.alpha_3, domain: @wiki_country.domain, iso_name: @wiki_country.iso_name, numeric: @wiki_country.numeric, year_added: @wiki_country.year_added }
    end

    assert_redirected_to wiki_country_path(assigns(:wiki_country))
  end

  test "should show wiki_country" do
    get :show, id: @wiki_country
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wiki_country
    assert_response :success
  end

  test "should update wiki_country" do
    patch :update, id: @wiki_country, wiki_country: { alpha_2: @wiki_country.alpha_2, alpha_3: @wiki_country.alpha_3, domain: @wiki_country.domain, iso_name: @wiki_country.iso_name, numeric: @wiki_country.numeric, year_added: @wiki_country.year_added }
    assert_redirected_to wiki_country_path(assigns(:wiki_country))
  end

  test "should destroy wiki_country" do
    assert_difference('Wiki::Country.count', -1) do
      delete :destroy, id: @wiki_country
    end

    assert_redirected_to wiki_countries_path
  end
end
