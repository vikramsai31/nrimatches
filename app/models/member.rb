class Member < ActiveRecord::Base
 attr_accessible :firstname, :lastname, :user_id, :dob,:gender,:l_country_id,:age,
      :l_state_id,:l_city,:g_country_id,:residency_status,:marital_status,
      :community,:sub_community,:height,:weight,:complexion,:body_type,
      :diet,:smoke,:drink,:education,:working_as,:working_with,:mobile_no,:about_yourself,:disability,:photos_attributes


has_many :photos
belongs_to :country
belongs_to :user
belongs_to :state
accepts_nested_attributes_for :photos
after_validation do
  self.age = calculate_age(dob)
end
 
validates :firstname, :lastname,:gender,:residency_status,:marital_status,:community,:sub_community,
:height,:weight,:complexion,:body_type,:education,:mobile_no,:about_yourself, :presence=>true
validates :user_id, :uniqueness => true
validate :validate_fields,:validate_age


def validate_fields
   if l_country_id.blank?
     errors.add(:base,"Select your country living")
   end
    if l_city.blank?
      errors.add(:base,"Select living city")
    end
   
    if g_country_id.blank?
      errors.add(:base,"Select country where you grew")
    end
    
end


def validate_age
   if dob.blank?
     errors.add(:base, "Select Data of birth")
   end
age = calculate_age(dob)
  if age.blank?
    errors.add(:base, "Age not specified")
  end 
  if calculate_age(dob) < 18
  errors.add(:base, "You should be over 18 to signup")
  end
   
end

def self.search(params)
 members = all
 
 if params[:marital_status].present?
   members = members.where(marital_status: params[:marital_status])
 end
 
 if params[:age_from].present? && params[:age_to].present?
      cars = cars.where('age between ? and ?', params[:age_from], params[:age_to])
    end
   if params[:height].present?
   members = members.where('height >= ?', params[:height])
 end
 
  if params[:education].present?
   members = members.where(education: params[:education])
 end
 
  if params[:working_with].present?
   members = members.where(working_with: params[:working_with])
 end
 
 members
end


private 
def calculate_age(birthday)
  if !birthday.nil?
   Date.today.year - birthday.to_date.year
     
  end


  
end

  
end
