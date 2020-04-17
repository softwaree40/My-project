class JobsController < ApplicationController
    before_action :authentication_required
  
    def index
      @category = Category.find(params[:category_id])
      @jobs = @category.jobs
    end
    
    def new
      @category = Category.find_by(id: params[:category_id])
      @job = @category.jobs.build
    end

    def create
        #binding.pry
        
        @category = Category.find(params[:category_id])
        @job = @category.jobs.build(jobs_params)
       if @job.save 
        #binding.pry
          redirect_to category_jobs_path(@category), notice: "Created successfully"
        else
          
        render "new"
       end
    end
    
    def show
      #binding.pry
      @category = Category.find(params[:category_id])
      @job = Job.find_by(id: params[:id])
      
     
    end

    def edit 
      
      @category = Category.find(params[:category_id])
      @job = Job.find_by(id: params[:id])
    end

    def update
      
      @category = Category.find(params[:category_id])
      @job = Job.find_by(id: params[:id])
        if @job.update(jobs_params)
          redirect_to category_jobs_path(@job.category, @job) ,notice: "Information updated successful"
        else
          render "edit"
        end
      end

      def destroy 
      
        @job = Job.find_by(id: params[:id])
        @job.destroy
        
        flash.notice = "Job deleted successful"
        redirect_to category_jobs_path(@job.category, @job) 
      end

    private
    
  def jobs_params
      params.require(:job).permit(:title,:description,:url,:company,:category_id)
 end
  
  
end
