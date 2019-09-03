# frozen_string_literal: true

class AttendancesController < ApplicationController
  def create
    event = current_user.attendances.build(attendance_params)
    event.save
    redirect_back(fallback_location: root_path)
  end

  private

  def attendance_params
    params.require(:attendance).permit(:attended_event_id)
  end
end
