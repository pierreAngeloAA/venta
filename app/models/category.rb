# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#
class Category < ApplicationRecord
    # include Rails.application.routes.url_helpers
    
    # belongs_to :parent, class_name: 'Category', optional: true, dependent: :destroy
    # has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy
    # has_many :labour, dependent: :destroy

    # validates :name, presence: true

    # scope :areas, -> { where(parent_id: nil) }
    # scope :categories,  -> { where.not(parent_id: nil).where(parent_id: areas) }
    # scope :subcategories, -> { where.not(parent_id: nil).where.not(parent_id: areas) }

    # def area?
    #     parent_id.nil?
    # end
    
    # def category?
    #     !area? && parent.area?
    # end

    # def subcategory?
    #     !area? && !category?
    # end

    # def self.categories_and_subcategories
    #     categories + subcategories
    # end

    # def build_back_path
    #     area? ? areas_path : category_path(parent_id)
    # end
    
end
