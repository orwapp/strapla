class String

	def normalize
    self.gsub(/[^0-9a-z ]/i, '')
    self.gsub(/\s/, '')
    self.gsub(/\//, '')
	end

end
