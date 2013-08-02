class Employee < ActiveRecord::Base
  attr_accessible :birthday, :comment, :email, :firstname, :lastname
end
