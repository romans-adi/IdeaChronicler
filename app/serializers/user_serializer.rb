class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :posts_counter
end
