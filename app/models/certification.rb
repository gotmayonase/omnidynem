class Certification < ActiveRecord::Base

  has_and_belongs_to_many :yields, class_name: 'Item', join_table: 'certifications_yields'

end
