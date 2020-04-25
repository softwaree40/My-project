class JobsController < ApplicationController
    before_action :authentication_required
    before_action :category_params, except: [:destroy]
    before_action :find_jobs, except: [:index,:new,:create]

  
    def index
      
      @jobs = @category.jobs
    end
    
    def new
      
      @job = @category.jobs.build
    end

    def create
        #binding.pry
        
        
        @job = @category.jobs.build(jobs_params)
        @job.user = current_user
       if @job.save 
        #binding.pry
          redirect_to category_jobs_path(@category), notice: "Created successfully"
        else
          
        render "new"
       end
    end
    
    def show
      #binding.pry
      
     
      
     
    end

    def edit
      if current_user != @job.user
        redirect_to category_jobs_path(@job.category, @job)
      end
     
    end

    def update
      if current_user != @job.user
        redirect_to category_jobs_path(@job.category, @job)
      end
      
      
        if @job.update(jobs_params)
          redirect_to category_jobs_path(@job.category, @job) ,notice: "Information updated successful"
        else
          render "edit"
        end
      end

      def destroy 
        if current_user != @job.user
          redirect_to category_jobs_path(@job.category, @job)
        else  
          @job.destroy
          redirect_to category_jobs_path(@job.category, @job)
          flash.notice = "Job deleted successful"
        end
        
        
      end







    private
    
  def jobs_params
      params.require(:job).permit(:title,:description,:url,:company,:category_id)
 end
  def category_params
    @category = Category.find_by(id: params[:category_id])

  end
  def find_jobs
    @job = Job.find_by(id: params[:id])
  end
  
end
