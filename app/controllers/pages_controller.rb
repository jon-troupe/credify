class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @credit_cards = CreditCard.last(6)
  end
end
