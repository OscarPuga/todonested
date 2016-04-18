class Profile < ActiveRecord::Base
    belongs_to :user
    validates :gender, inclusion: { in: %w(male female) }
    validate :exist_one_name, :badnamed_male
    
    def self.get_all_profiles (min, max)
        return Profile.where('birth_year BETWEEN :min_year AND :max_year', min_year: min, max_year: max).order(:birth_year)
    end
    
    
    def exist_one_name
        errors.add(:first_name, "at last one of the names must be set") if !(first_name.present?) && !(last_name.present?)
    end
    
    def badnamed_male
        errors.add(:first_name, "bad name for given gender") if first_name.present? && first_name.start_with?("Sue")
    end
end
