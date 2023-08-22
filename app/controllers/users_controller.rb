class UsersController < ApplicationController
    before_action :set_user, only: [:show, :send_friend_request, :accept_friend_request]
  
    def show
      @profile = @user.profile
    end
  
    def send_friend_request
      current_user.sent_friend_requests.create(receiver: @user)
      redirect_to user_path(@user), notice: 'Friend request sent!'
    end
  
    def accept_friend_request
      friend_request = current_user.received_friend_requests.find_by(sender: @user)
      if friend_request
        current_user.accept_friend_request(friend_request)
        redirect_to user_path(@user), notice: 'Friend request accepted!'
      else
        redirect_to user_path(@user), alert: 'Friend request not found.'
      end
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  end
  