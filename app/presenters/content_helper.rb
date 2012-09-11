module ContentHelper
  def form form = nil
    return @form unless form
    @form = form
    self
  end

  # capture block of content and return as safe html
  def capture_content &block
    block_given? ? block.call.html_safe : "".html_safe
  end

  def s *args, &block
    output = args.flatten.inject("".html_safe) do |output, current_arg|      
      output << current_arg.html_safe
    end
    output << capture_content(&block) if block_given?
    output
  end
end