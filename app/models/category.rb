class Category < ApplicationRecord
    belongs_to :parent, class_name: 'Category', optional: true
    has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy
    has_many :labour

    validates :name, presence: true

    scope :areas, -> { where(parent_id: nil) }
    scope :categories,  -> { where.not(parent_id: nil).where(parent_id: areas) }
    scope :subcategories, -> { where.not(parent_id: nil).where.not(parent_id: areas) }

    def area?
        parent_id.nil?
    end
    
    def category?
        !area? && parent.area?
    end

    def subcategory?
        !area? && !category?
    end

    def self.categories_and_subcategories
        categories + subcategories
    end
    
end