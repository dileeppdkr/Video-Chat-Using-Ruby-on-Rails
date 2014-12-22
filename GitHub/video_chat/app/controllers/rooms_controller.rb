class RoomsController < ApplicationController
  before_filter :config_opentok,:except => [:index]
def index
@rooms = Room.order('created_at DESC')
@room = Room.new
end

def create
session = @opentok.create_session request.remote_addr
params[:room][:sessionId] = session.session_id

@room = Room.new(user_params)

respond_to do |format|
if @room.save
UserMailer.regisration_confirmation(@room).deliver
format.html { redirect_to('/party/'+@room.id.to_s) }
else
format.html { render :controller => 'rooms',
:action => 'index' }
end
end
end

def party
@room = Room.find(params[:id])

@tok_token = @opentok.generate_token :session_id =>@room.sessionId
end

private
def config_opentok
if @opentok.nil?
@opentok = OpenTok::OpenTokSDK.new '44676442', '002336d347154d528558e6428899b867be11c086'
end
end
def user_params
    params.require(:room).permit(:email, :sessionId, :status)
  end

end
