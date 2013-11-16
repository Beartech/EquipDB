class UserSessionsController < ApplicationController
  skip_before_filter :require_login, :except => [:destroy]

  def new
    @user = User.new
  end

  def create
    respond_to do |format|
      if @user = login(params[:username],params[:password])
        format.html { gflash :success => 'Login successful.'; redirect_back_or_to(:users)  }
        format.xml { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { gflash :warning => "Login failed. Remember, both your user name and password are case sensitive"; render :action => "new" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    logout
    redirect_to("/")
    gflash :success => 'Logged out!'
  end
end
