class UsersController < ApplicationController
def show
end

def new
end

def sms
  @user = User.new
end

def sms_input
  @user = User.new
end

def completed
end

end
