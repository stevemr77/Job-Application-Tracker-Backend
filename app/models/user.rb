class User < ApplicationRecord
    validates :name, uniqueness: true
    has_many :job_applications
end
