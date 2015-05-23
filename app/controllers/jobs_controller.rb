class JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

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
    @job.user = current_user

    if @job.save
      redirect_to @job
    else
      render "New"
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to @job
    else
      render "Edit"
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :location, :description, :company, :url,
                                :email, :category_id)
  end

  def find_job
  	@job = Job.find(params[:id])
  end
end
