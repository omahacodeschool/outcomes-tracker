class EmailController < ApplicationController
  def receive
    if email contains FW:
      forward email method
    else
      outgoing email method
    end
  end

  def forward email method
    find user by email, get all users entries
    go through entries to match job email to email
    if found, send email body as new event on the entry
  end

  def outgoing email method
    same as above, minus FW: stuff
  end
end