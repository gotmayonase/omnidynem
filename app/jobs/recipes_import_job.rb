class RecipesImportJob < ActiveJob::Base

  queue_as :recipes_import

  def perform(filepath)
    json_data = File.read(filepath)
    json = JSON.parse(json_data)[0]
    pbar = ProgressBar.create(title: 'Recipes', total: json.count)
    json.each do |id, data|
      if recipe = Recipe.find_by(id: id)
        update_recipe(recipe, data)
      else
        insert_recipe(id, data)
      end
      pbar.increment
    end
    pbar.finish
  end

  private

    def insert_recipe(id, data)
      recipe = Recipe.new
      recipe.id = id
      update_recipe(recipe, data)
    end

    def update_recipe(recipe, data)
      inputs = data.delete("inputs")
      cert_outputs = data.delete("cert_outputs")
      outputs = data.delete("outputs")
      required_certs = data.delete("required_certs")

      blueprint_type_id = data.delete("blueprint_type")
      subtype_id = data.delete("item_subtype")

      recipe.attributes = data
      recipe.blueprint_type_id = blueprint_type_id
      recipe.subtype_id = blueprint_type_id

      inputs.each do |input|
        item_id = input.delete("item_type")
        mat_type_id = input.delete("material_type")
        resource_type_id = input.delete("resource_type")

        ri = recipe.recipe_inputs.find_or_initialize_by(item_id: item_id)
        ri.attributes = input
        ri.material_type_id = mat_type_id
        ri.resource_type_id = resource_type_id
      end

      cert_outputs.each do |cert_output|
        cert = Certification.find_or_create_by(id: cert_output)
        recipe.certification_outputs << cert unless recipe.certification_outputs.include?(cert)
      end if cert_outputs

      outputs.each do |output_id, output|
        item = Item.find_or_create_by(id: output["item_id"])
        recipe.outputs << item unless recipe.outputs.include?(item)
      end if outputs

      required_certs.each do |required_cert|
        cert = Certification.find_or_create_by(id: required_cert)
        recipe.required_certifications << cert unless recipe.required_certifications.include?(cert)
      end if required_certs

      recipe.save
    end

end
