class Build < ApplicationRecord 
    has_many :parts, dependent: :destroy

end