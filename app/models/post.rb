class Post < ApplicationRecord
    validate :title_must_contain?
    validates :title, presence: true
    validates :content, length: { :minimum => 250}
    validates :summary, length: { :maximum => 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

    

    def title_must_contain?
        # byebug
       if title && !!title.match(/Won't Believe|Secret|Top \d*|Guess/)
        true 
       else 
        errors.add(:title, "Must be clickbate")
       end

    end
end
