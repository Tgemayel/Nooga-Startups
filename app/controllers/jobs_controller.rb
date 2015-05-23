class JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update, :destroy]

  def index
  	@jobs = Job.all.order("created_at DESC")
  end

  def show
  end

  def new

    # Make sure that a user session is active before creating a job.
    unless user_signed_in?
      store_location_for(:user, new_job_path)
      redirect_to new_user_session_path
    end

    @job = Job.new
  end

  def create
  	@job = Job.new(jobs_params)

  	if @job.save
  	  redirect_to @job
  	else
  	  render "New"
  	end
  end

  def edit
  end

  def update
    if @job.update(jobs_params)
      redirect_to @job
    else
      render "Edit"
    end
  end

  def destroy
    @job.destroy
    redirect_to root_path
  end

  private

  def jobs_params
  	params.require(:job).permit(:title, :location, :description, :company, :url, :category_id)
  end

  def find_job
  	@job = Job.find(params[:id])
  end
end
