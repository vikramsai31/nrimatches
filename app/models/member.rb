class Member < ActiveRecord::Base
 attr_accessible :firstname, :lastname, :user_id, :dob,:gender,:country_id,
      :state_id,:city,:height,:weight,:complexion
has_many :photos
belongs_to :country
belongs_to :state
accepts_nested_attributes_for :photos
 
end
