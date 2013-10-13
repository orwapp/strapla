class DevelopmentMailInterceptor
  def self.delivering_email(message)
    #message.subject = message.subject
    login = %x{whoami}.strip
    message.to = "#{login}@make.as"
  end
end
