class Photo < ActiveRecord::Base
  belongs_to :member
  attr_accessible photos_attributes: [:member,:data]
  has_attached_file :data, :styles => { :thumb => "100x100#",
:medium => "500x500#",
:large => "700x700>" },
:url => "/assets/member/:id/:style/:basename.:extension",
:path => ":rails_root/public/assets/member/:id/:style/:basename.:extension"

 validates_attachment_presence :data
 validates_attachment_content_type :data, :content_type => /\Aimage/
validates_attachment_size :data, :less_than => 5.megabytes
validates_attachment_content_type :data, :content_type => ['image/jpeg', 'image/png'] 
attr_accessible :member_id,:data

 
end
