class CategoriesController < ApplicationController
    before_action :authentication_required
    def index
        #binding.pry
       @categorys = Category.all
    end
    
    def show
      
    end
end
