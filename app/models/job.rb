class Job < ApplicationRecord
    belongs_to :category
    validates_presence_of :title,:description,:company,:url,:category_id
    def self.desc_order
        self.all.order("created_at DESC")
 
     end
 
     def self.where_order(category_id)
         self.where(category_id: category_id).order("created_at DESC")
     end

end
