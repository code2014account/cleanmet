class RegisteredApplication < ActiveRecord::Base
    has_many :events
end
