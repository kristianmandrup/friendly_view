class User
  attr_accessor :user_name

  def initialize user_name
    @user_name = user_name
  end

  def agents
    @agents ||= rand(10).times.to_a
  end

  def favorites
    @favorites ||= rand(10).times.to_a
  end  

  def mails
    @mails ||= rand(10).times.to_a
  end  

  def cart_items
    @cart_items ||= ['10 days subscription']
  end
end