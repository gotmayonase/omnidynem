class ItemsController < ApplicationController

  protect_from_forgery except: [:import]

  def import
    filepath = File.join(Rails.root,'tmp','items.json')
    File.open(filepath, 'wb') do |f|
      f.write(params['_json'].to_json)
    end
    ItemsImportJob.enqueue filepath
    render status: 201, nothing: true
  end

end
