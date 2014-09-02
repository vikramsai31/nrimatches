class Member < ActiveRecord::Base
 attr_accessible :firstname, :lastname, :user_id, :dob,:gender,:l_country_id,
      :l_state_id,:l_city,:g_country_id,:residency_status,:marital_status,
      :community,:sub_community,:height,:weight,:complexion,:body_type,
      :diet,:smoke,:drink,:education,:working_as,:working_with,:photos_attributes
has_many :photos
belongs_to :country
belongs_to :state
accepts_nested_attributes_for :photos
 
validates :firstname, :lastname,:dob, :presence=>true
validates :user_id, :uniqueness => true
end
