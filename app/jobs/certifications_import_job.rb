class CertificationsImportJob < ActiveJob::Base

  queue_as :certifications_import

  def perform(filepath)
    json_data = File.read(filepath)
    json = JSON.parse(json_data).first
    pbar = ProgressBar.create(title: 'Certifications', total: json.count)
    json.each do |id, data|
      if cert = Certification.find_by(id: id)
        update_cert(cert, data)
      else
        insert_cert(id, data)
      end
      pbar.increment
    end
    pbar.finish
  end

  private

    def insert_cert(id, data)
      cert = Certification.new
      cert.id = id
      update_cert(cert, data)
    end

    def update_cert(cert, data)
      data = Hash[data.map { |k,v| [k.to_s.underscore, v]}]

      yields = data.delete("yields")
      yields.each do |_yield|
        item = Item.find_or_create_by(id: _yield["itemTypeId"])
        cert.yields << item unless cert.yields.include?(item)
      end if yields

      cert_type_id = data.delete("cert_type")


      cert.attributes = data
      cert.cert_type_id = cert_type_id
      cert.save
    end

end
