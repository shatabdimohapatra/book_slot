class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.where('start_at >= ? and end_at <= ?', parsed_date(params[:start]), parsed_date(params[:end]))
    data = @appointments.map(&:get_data)
    render :json => data, :status => :ok
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.save
    redirect_to root_path
  end

  def update
    @appointment = Appointment.find(params[:id])
    params.delete(:id)
    @appointment.attributes = appointment_params
    @appointment.save
    render nothing: true
  end

  def appointment_params
    params.permit(:title, :start_at, :end_at)
  end

  def parsed_date(date)
    Date.parse(date)
  end
end
