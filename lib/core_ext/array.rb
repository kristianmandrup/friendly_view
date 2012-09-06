class Array
	def allow? x
		self.map{|x| x.downcase.to_sym}.include?(x.downcase.to_sym)
	end
end