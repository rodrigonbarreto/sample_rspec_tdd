class Customer < ApplicationRecord
    #validates :address, presence: true

    def full_name
        "Sr. #{name}"
    end    
end
