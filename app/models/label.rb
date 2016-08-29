class Label < ActiveRecord::Base
	has_many :products
	has_many :pages
end