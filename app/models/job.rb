class Job < ApplicationRecord
    belongs_to :category
    belongs_to :user,:optional => true
    validates :title,:description,:url,:company, :presence => true 
    def self.desc_order
        self.all.order("created_at DESC")
 
     end
 
     def self.where_order(category_id)
         self.where(category_id: category_id).order("created_at DESC")
     end

end
