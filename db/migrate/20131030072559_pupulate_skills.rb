class PupulateSkills < ActiveRecord::Migration
  def change
    Skill.create(name: 'Webdevelopment')
    Skill.create(name: 'Java')
    Skill.create(name: 'HTML')
    Skill.create(name: 'CSS')
    Skill.create(name: '.NET')
    Skill.create(name: 'Ruby')
    Skill.create(name: 'Linux')
    Skill.create(name: 'Solaris')
  end
end
