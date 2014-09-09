class CertificationsController < ApplicationController

  protect_from_forgery except: [:import]

  def import
    filepath = File.join(Rails.root,'tmp','certifications.json')
    File.open(filepath, 'wb') do |f|
      f.write(params['_json'].to_json)
    end
    CertificationsImportJob.enqueue filepath
    render status: 201, nothing: true
  end

end
