# frozen_string_literal: true

class Sessions::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    @login = Login.new

    super
  end

  # POST /resource/sign_in
  def create
    @login = Login.new(login_params)

    if @login.valid?
      super
    else
      render :new
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    if resource.content_types.empty?
      content_types_path
    else
      content_type_path(resource.content_types.first)
    end

  end


  private

  def login_params
    params.require(:login).permit(:email, :password)
  end
end
