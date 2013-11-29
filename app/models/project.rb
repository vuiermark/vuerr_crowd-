class Project < ActiveRecord::Base
	validates :name, :title, :long_description, :city, :country, :video, presence: true
	validates :description, length: {minimum: 25}
	validates :funding_goal, :monthly_funding_goal, numericality: { greater_than: 0 }
	validates :image_file_name, allow_blank: true, format: { 
		with:     /\w+\.(gif|jpg|png|jpeg)\z/i,
		message:  "must reference a GIF, JPG, JPEG, or PNG image" 
	}
	validates :deadline, presence: true
	validates :featured, :inclusion => {:in => [true, false]}

	has_many :pledges, dependent: :destroy
    has_many :payment_statuses
	def pledging_expired?
		deadline < Date.today
	end

	def self.upcoming
		where("deadline >= ?", Time.now).order("deadline")
	end

	def total_amount_pledged
		pledges.sum(:amount) || 0
	end

	def total_monthly_amount_pledged
		pledges.sum(:monthly_amount) || 0
	end

	def amount_outstanding
		funding_goal - total_amount_pledged
	end

	def funded?
		amount_outstanding <= 0
	end

	def percentage_funded
    result = (total_amount_pledged.to_f / funding_goal.to_f) * 100
    return result.to_s + '%'
	end 

	def percentage_funded_monthly
		result = (total_monthly_amount_pledged.to_f / monthly_funding_goal.to_f) * 100
		return result.to_s + '%'
	end

	def self.featured_campaign
		where(featured: true)
	end
end

