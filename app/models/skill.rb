class Skill < ActiveRecord::Base

  def self.tokens(query)
    skills = where("name iLIKE ?", "%#{query}%").select(:id, :name)

    if skills.empty?
      [ {id: "<<<#{query}>>>"}, {name: "New: \"#{query}\""} ]
    else
      skills
    end
  end

end
