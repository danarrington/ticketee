class TicketsController < ApplicationController
  def new
     @project = Project.find(params[:project_id])
     @ticket = @project.tickets.build
  end

  def create
     @project = Project.find(params[:project_id])
     @ticket = @project.tickets.build(params[:ticket])
     if @ticket.save
        flash[:notice] = "Ticket has been created."
        redirect_to [@project, @ticket]
     else
        flash[:alert] = "Ticket has not been created."
        render :action => "new"
     end
  end

  def show
     @project = Project.find(params[:project_id])
     @ticket = @project.tickets.find(params[:id])
  end
  
private
   def ticket_params
      params.require(:ticket).permit(:title, :description)
   end
end
