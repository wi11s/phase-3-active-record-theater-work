class Role < ActiveRecord::Base
    has_many :auditions
    has_many :actors

    def locations
        locations_array = []
        self.auditions.each do |audition|
            locations_array << audition.location
        end
        
        locations_array
    end

    lead;

    def lead
        self.auditions.each do |audition|
            if audition.hired
                lead = audition
                return audition
            else
                return "no actor has been hired for this role"
            end
        end
    end

    def understudy
        self.audition.each do |audition|
            if audition.hired && audition!=lead
                return audition
            else
                return "no actor has been hired for understudy for this role"
            end
        end
    end
end