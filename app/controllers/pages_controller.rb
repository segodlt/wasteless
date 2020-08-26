class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
  end

  def account
    @user = current_user
  end
end
