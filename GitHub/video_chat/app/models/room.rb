class Room
  include Mongoid::Document
  field :email, type: String
  field :sessionId, type: String
  field :status, type: Mongoid::Boolean
end
