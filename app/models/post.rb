class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction","Non-Fiction" ]}
    validate :is_clickbait
  

    def is_clickbait

        titles =  ["Won't Believe", "Secret", "Top [number]", "Guess" ]
        titles.each |title| do 
        

            unless titles.include? (title)
                errors.add( :title, "not clickbait" )
         
            end
        end
    end
 

end
