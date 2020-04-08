class Asana < ApplicationRecord
    has_many :postures
    has_many :sequences, through: :postures
    scope :balancing, -> { where(category: 'Balancing') }
    scope :inversion, -> { where(category: 'Inversion') }
    scope :backbending, -> { where(effect_on_spine: 'Backbend') }


end
