class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.valid?
      message_content = JSON.generate({ 'name' => params[:message][:name],
                    'email' => params[:message][:email],
                    'subject' => params[:message][:subject],
                    'content' => params[:message][:content] })
      PostmanWorker.perform_async(message_content)
      redirect_to new_message_path
      flash[:notice] = "Thank you for your message."
    else
      render :new
      flash[:error] = "Error sending your message. Please try again."
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :subject, :content)
  end
end