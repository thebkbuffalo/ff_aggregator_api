class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    @user = User.new(user_params)
    if @user.save
      register_success
    else
      register_failed
    end
  end



  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :team_name, :email, :password)
  end
  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: { message: 'Signed up sucessfully.' }
  end

  def register_failed
    render json: { message: "Something went wrong." }
  end
end