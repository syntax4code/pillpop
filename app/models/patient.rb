class Patient < ActiveRecord::Base
    has_many :medications
  end