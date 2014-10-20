class ReportsController < ApplicationController
	# before_action :report_id

	def index
		@report = Report.new
		@reports = Report.all
	end
	
	def create
		@report = Report.new(report_params)
		if @report.save
			redirect_to reports_path
			flash[:success] = "Successfully created !"
		else
			render 'index'
		end
	end

private
	def report_params
		params.require(:report).permit(:user_name, :forest_name, :observation)
	end

	# def report_id
	# 	@report = Report.find(params[:id])
	# end
end
