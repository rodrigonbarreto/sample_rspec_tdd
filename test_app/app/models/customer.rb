class Customer < ApplicationRecord
    #validates :address, presence: true
    has_many :orders

    def full_name
        "Sr. #{name}"
    end    
end
