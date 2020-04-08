class Sequence < ApplicationRecord
    belongs_to :user
    has_many :postures
    has_many :asanas, through: :postures
    validates_presence_of :name

    def duration
        self.postures.sum do |posture|
            posture.duration
        end
    end
end