class Clearance::UsersController < ApplicationController
  if respond_to?(:before_action)
    before_action :redirect_signed_in_users, only: [:create, :new]
    skip_before_action :require_login, only: [:create, :new], raise: false
    skip_before_action :authorize, only: [:create, :new], raise: false
  else
    before_filter :redirect_signed_in_users, only: [:create, :new]
    skip_before_filter :require_login, only: [:create, :new], raise: false
    skip_before_filter :authorize, only: [:create, :new], raise: false
  end

  def new
    @user = user_from_params
    render template: "users/new"
  end

  def create
    @user = user_from_params


    if @user.save
      sign_in @user
      SignUpMailer.sample_email(@user).deliver
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end


  end

  def update
    @user = User.find(params[:id])
    @user.update(permit_params)
    redirect_to account_index_path
  end

  private

  def avoid_sign_in
    warn "[DEPRECATION] Clearance's `avoid_sign_in` before_filter is " +
      "deprecated. Use `redirect_signed_in_users` instead. " +
      "Be sure to update any instances of `skip_before_filter :avoid_sign_in`" +
      " or `skip_before_action :avoid_sign_in` as well"
    redirect_signed_in_users
  end

  def redirect_signed_in_users
    if signed_in?
      redirect_to Clearance.configuration.redirect_url
    end
  end

  def url_after_create
    Clearance.configuration.redirect_url
  end

  def user_from_params
    first_name = user_params.delete(:first_name)
    last_name = user_params.delete(:last_name)
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    time_preference = user_params.delete(:time_preference)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.first_name = first_name
      user.last_name = last_name
      user.email = email
      user.password = password
      user.time_preference = time_preference 
    end
  end

  def user_params
    params[Clearance.configuration.user_parameter] || Hash.new
  end

  def permit_params
    params.permit(:first_name, :last_name, :email, :password, :time_preference)
  end

end