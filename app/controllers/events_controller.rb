class EventsController < ApplicationController
  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event.entry, notice: "Added event to this job application."
    else
      redirect_to @event.entry, alert: "There was a problem."
    end
  end

  private

  def event_params
    params.require(:event).permit(:notes, :entry_id)
  end
end
