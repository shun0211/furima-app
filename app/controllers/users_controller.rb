class UsersController < ApplicationController
def index
end

def new
end

def sms
  @user = User.new
end

end
