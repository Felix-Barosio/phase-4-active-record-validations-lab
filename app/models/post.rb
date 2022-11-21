class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: [ "Fiction", "Non-Fiction" ] 
    validate :clickbait?

    ALLOWED = [
        /Won't Believe/i,
        /New/i,
        /Nice \d/i,
        /Post /i
    ]


    def clickbait?
        if ALLOWED.none? { |click| click.match title}
            errors.add(:title, "invalid title")
        end
    end
    
end
