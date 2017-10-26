class Profile < ActiveRecord::Base
  belongs_to :user

  validate :null_validator, :sue_validator
  validates :gender, inclusion: ["male", "female"]

  def null_validator 
    if first_name.nil? and last_name.nil?
      errors.add(:base, "Both names can't be null")
    end   
  end

  def sue_validator
    if gender == "male" and first_name == "Sue"
      errors.add(:base, "No boys named Sue pls")
    end
  end 

  def self.get_all_profiles(min, max)
    Profile.where("birth_year BETWEEN ? and ?", min, max).order(birth_year: :asc)
  end
end
