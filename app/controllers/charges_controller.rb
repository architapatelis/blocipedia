class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership - #{current_user.email}",
      amount: Amount.default
    }
  end

  def create
    # Creates a Stripe Customer object, for associating
    # with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id in your app
      amount: Amount.default,
      description: "Premium Membership - #{current_user.email}",
      currency: 'usd'
    )

    flash[:notice] = "Enjoy your premium membership, #{current_user.email}!"
    current_user.role = "premium"
    current_user.save
    redirect_to root_path

    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This `rescue block` catches and displays those errors.
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  def destroy

  current_user.update_attribute(:role, :standard)
  #Downgrades private wikis to public when a user downgrades their account status
  current_user.wiki.where(private: true).map{ |r| r.update_attributes(private: false) }

  flash[:notice] = "Sorry to see you leave premium, #{current_user.email}!"
  redirect_to root_path

    #Stripe.api_key = Rails.configuration.stripe[:secret_key]
    #customer = Stripe::Customer.retrieve(customer.id)
    #customer.subscriptions.retrieve(subscription_id)
    #flash[:notice] = "Please try our Premium services again in the future, #{current_user.username}!"
    #Downgrades private wikis to public when a user downgrades their account status
    #current_user.wiki.where(private: true).map { |r| r.update_attributes(private: false) }
    #Downgrades a users account to standard
    #current_user.standard!
    #redirect_to root_path
  end
end
