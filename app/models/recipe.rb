class Recipe < ActiveRecord::Base
  self.primary_key = :id

  validates :id, presence: true, uniqueness: true
  validates :name, presence: true
  
  has_many :recipe_inputs
  has_many :input_items, through: :recipe_inputs, class_name: 'Item', source: :item
  has_and_belongs_to_many :required_certifications, class_name: 'Certification', join_table: :required_certifications
  has_and_belongs_to_many :certification_outputs, class_name: 'Certification', join_table: :certification_outputs
  has_and_belongs_to_many :outputs, class_name: 'Item', join_table: :recipe_outputs

end
