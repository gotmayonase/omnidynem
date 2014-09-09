class RecipesController < ApplicationController

  protect_from_forgery except: [:import]

  def index
    @recipes = Recipe.includes(:recipe_inputs,:input_items,:required_certifications,:certification_outputs,:outputs).paginate(page: params[:page], per_page: params[:per_page])
  end

  def import
    filepath = File.join(Rails.root,'tmp','recipes.json')
    File.open(filepath, 'wb') do |f|
      f.write(params["_json"].to_json)
    end
    RecipesImportJob.enqueue filepath
    render status: 201, nothing: true
  end

end
