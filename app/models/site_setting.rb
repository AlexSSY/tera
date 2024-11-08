class SiteSetting < ApplicationRecord
  # Ensure that the parameter names are unique
  validates :name, presence: true, uniqueness: true

  # Class method to fetch the value of a parameter by name
  def self.get(name)
    find_by(name: name)&.value
  end

  # Class method to set or update a parameter's value by name
  def self.set(name, value)
    setting = find_or_initialize_by(name: name)
    setting.value = value
    setting.save!
  end
end
