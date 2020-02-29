class UsersController < ApplicationController

  def show
    skip_authorization
  end
end
