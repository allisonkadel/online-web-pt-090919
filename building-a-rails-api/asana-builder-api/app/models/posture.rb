class Posture < ApplicationRecord
    belongs_to :asana
    belongs_to :sequence
    validates_presence_of :duration
end