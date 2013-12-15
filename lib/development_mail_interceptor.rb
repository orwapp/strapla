class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.to = "martin@stabenfeldt.net"
  end
end
