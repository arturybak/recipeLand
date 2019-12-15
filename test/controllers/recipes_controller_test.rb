require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
    @recipe = recipes(:one)
    @recipe_image = fixture_file_upload('app/assets/images/mojito.jpg', 'image/jpg')
  end

  test "should get index" do
    get recipes_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_url
    assert_response :success
  end

  test "should create recipe" do
    assert_difference('Recipe.count') do
      post recipes_url, params: {
        recipe: {
          description: @recipe.description, title: @recipe.title, user_id: @recipe.user_id,
          image: @recipe_image,
          ingredients_attributes: [ingredients(:one), ingredients(:two)],
          directions_attributes: [directions(:one), directions(:two)]
          }
        }
    end
    assert_redirected_to recipe_url(Recipe.last)
  end

  test "should show recipe" do
    get recipe_url(@recipe)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipe_url(@recipe)
    assert_response :success
  end

  test "should like and unlike recipe" do
    assert_difference('Recipe.find(8).get_likes.size', +1) do
      put like_recipe_url(@recipe), params: {
        format: 'like', id: 8
        }
    end
    assert_difference('Recipe.find(8).get_likes.size', -1) do
      put like_recipe_url(@recipe), params: {
        format: 'unlike', id: 8
        }
    end
  end

  test "should update recipe" do
    patch recipe_url(@recipe), params: { recipe: { description: @recipe.description, title: @recipe.title, user_id: @recipe.user_id } }
    assert_response :success
  end

  test "should destroy recipe" do
    assert_difference('Recipe.count', -1) do
      delete recipe_url(@recipe)
    end

    assert_redirected_to recipes_url
  end
end
