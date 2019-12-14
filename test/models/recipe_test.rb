require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
  end

  test 'should not save empty recipe' do
    recipe = Recipe.new

    recipe.save
    refute recipe.valid?
  end

  test 'should save valid recipe' do
    recipe = Recipe.new

    recipe.title = "Recipe One"
    recipe.description = "Recipe One is delicious.."
    recipe.user_id = @user.id
    recipe.image.attach(io: File.open('app/assets/images/vegan-chilli.jpg'),filename: 'vegan-chilli.jpg', content_type: 'image/jpg')
    recipe.ingredients_attributes = [{ name: "Ingredient 1" }, { name: "Ingredient 2" }]
    recipe.directions_attributes = [{ step: "Direction 1" }, { step: "Direction 2" }]

    recipe.save
    assert recipe.valid?
  end
end
