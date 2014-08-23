json.array!(@members) do |member|
  json.extract! member, :id, :firstname, :lastname, :user_id, :dob
  json.url member_url(member, format: :json)
end
