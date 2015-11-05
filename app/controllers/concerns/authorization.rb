module Authorization
  extend ActiveSupport::Concern

  def authorize_expert!
    redirect_to root_url unless current_expert == @expert
  end
end
