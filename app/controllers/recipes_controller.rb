class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    #Assign logged in user to the recipe being created
    @recipe.user = current_user

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: t('.created') }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: t('.updated') }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: t('.destroyed') }
      format.json { head :no_content }
    end
  end

  # PUT /recipes/like/1
  def like
    #Finding the recipe by its id
    @recipe = Recipe.find(params[:id])
    #Liking or unliking the recipe
    if params[:format] == 'like'
      @recipe.liked_by current_user
    elsif params[:format] == 'unlike'
      @recipe.unliked_by current_user
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # Ingredients and directions as nested attributes using cocoon gem
    def recipe_params
      params.require(:recipe).permit(:title, :description, :image, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
    end
end
