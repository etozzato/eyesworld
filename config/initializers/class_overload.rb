class String
  def pathify
    return self.gsub(/[@\.]/, '_').gsub(/[^a-zA-Z0-9_]/, '').strip.downcase
  end
end