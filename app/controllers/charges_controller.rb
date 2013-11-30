class ChargesController < ApplicationController

	def new
	end

	def create
		# Amount in cents
		
	   
	        @payment=PaymentStatus.new
	        @payment.email=params[:stripeEmail]
	        @payment.user_id=current_user.id
	        @payment.amount=session[:pledge_data][:monthly_amount].to_f
	        @payment.project_id=params[:project]
	        @payment.save
			customer = Stripe::Customer.create(:email => params[:stripeEmail],:card  => params[:stripeToken])
			
            @amount_val=(session[:pledge_data][:monthly_amount].to_f * 100)
			charge = Stripe::Charge.create(:customer=> customer.id,:amount => @amount_val.to_i,:description  => 'Rails Stripe customer',:currency     => 'usd')
	        
				
       
        
         @pledge = Pledge.new
         @pledge.name=session[:pledge_data][:name]
         @pledge.email=session[:pledge_data][:email]
         @pledge.amount=session[:pledge_data][:monthly_amount].to_f
         @pledge.comment=session[:pledge_data][:comment]
         @pledge.project_id=params[:project]
         @pledge.save
       	 session[:pledge_data]=nil
        redirect_to root_path
          
	end

end