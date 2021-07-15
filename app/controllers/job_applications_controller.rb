class JobApplicationsController < ApplicationController

    def index
        
        @job_applications = JobApplication.where(user_id: params[:user_id])

        render json: @job_applications
    end

    def create
        @new_job_application = JobApplication.create new_job_application_params

        if @new_job_application.valid?
            render json: @new_job_application, status: :created
        else
            render json: 'Missing field'
        end

    end

    def destroy
        @job_application_to_destroy = JobApplication.find(params[:id])
        @job_application_to_destroy.destroy
    end

    private

    def new_job_application_params
        params.require(:job_application).permit(
            [:company_name],
            [:position],
            [:date_applied],
            [:salary],
            [:follow_up],
            [:user_id]
        )
    end

end
