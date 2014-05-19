module MechanizeStore
  class Flag < ActiveRecord::Base
    validates :name, presence: true
  end
end
