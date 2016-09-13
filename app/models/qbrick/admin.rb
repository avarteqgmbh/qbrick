module Qbrick
  class Admin < ActiveRecord::Base
    include ::RailsSettings::Extend

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable,
           :recoverable, :rememberable, :trackable, :validatable

    def has_access_level?(access_lvl)
      self.access_level == access_lvl
    end
  end
end
