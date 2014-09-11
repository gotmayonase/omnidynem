class ItemsImportJob < ActiveJob::Base

  queue_as :items_import

  def perform(filepath)
    @unknown_fields = []
    json_data = File.read(filepath)
    json = JSON.parse(json_data).first
    pbar = ProgressBar.create(title: 'Items', total: json.count)
    puts "Count: #{json.count}"
    json.each do |id, data|
      if item = Item.find_by(id: id)
        update_item(item, data)
      else
        insert_item(id, data)
      end
      pbar.increment
    end
    pbar.finish
    puts "Unknown fields: #{@unknown_fields}"
  end

  private

    def insert_item(id, data)
      item = Item.new
      item.id = id
      update_item(item, data)
    end

    def update_item(item, data)
      data = Hash[data.map { |k,v| [k.to_s.underscore, v]}]
      # don't know what to do with these yet
      # constraints = data.delete("constraints")
      # flags = data.delete("flags")
      # character_scalars = data.delete("character_scalars")
      # tier = data.delete("tier")
      # certifications = data.delete("certifications")
      # item_type_id = data.delete("item_type_id")
      # icon_id = data.delete("icon_id")
      # resource_color = data.delete("resource_color")
      # stats = data.delete("stats")
      attrs = data.delete("attributes")
      # crafting_type_id = data.delete("crafting_type_id")
      # ui_category = data.delete("ui_category")
      # module_type = data.delete("module_type")
      # end unused data
      
      data.each do |k,v|
        if item.respond_to? "#{k}="
          item.send("#{k}=", v)
        else
          @unknown_fields << k unless @unknown_fields.include?(k)
        end
      end
      item.save
    end

end
