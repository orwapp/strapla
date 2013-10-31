class Skill < ActiveRecord::Base

  def self.tokens(query)
    skills = where("name iLIKE ?", "%#{query}%").select(:id, :name)
    if skills.empty?
      [ id: "<<<#{query}>>>", name: "New skill: #{query}" ]
    else
      skills
    end
  end

  def self.ids_from_tokens(tokens)
    puts "Skill#ids_from_tokens got: #{tokens}"
    r = tokens.split(',').collect { |name| 
      name.gsub!(/\s/,'')
      name.downcase!
      name.gsub!('newskill:', '')
      Skill.find_or_create_by!(name: name).id 
    }
    puts "Skill#ids_from_tokens returns: #{r}"
    r
  end

end
