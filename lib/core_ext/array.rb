class Array
	def allow? x
		self.map{|x| x.downcase.to_sym}.include?(x.downcase.to_sym)
	end

  def humanize_join last = 'or'
    return self.first if self.size == 1
    self[0..-2].join(', ') + " #{last} #{self.last}"
  end
end