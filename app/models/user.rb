class User < ActiveRecord::Base
has_many :evaluations, as: :source
end
