class EventsController < ApplicationController
  def create
    @event = current_user.events.build(event_params)

    if @event.save
      @event.notify
      redirect_to @event.entry, notice: "Added comment to this job application."
    else
      redirect_to @event.entry, alert: "You can't add a comment without a comment. (ಠ_ಠ)"
    end
  end

  private

  def event_params
    params.require(:event).permit(:notes, :entry_id)
  end
end
