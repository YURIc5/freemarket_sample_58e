class PicturesController < ApplicationController

  def new

  end

  def cleate
    
  end

  def update
    
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
