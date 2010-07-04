class String
  def normalize(alphabet)
    self.upcase.gsub(/\s+/, '').gsub(/[^#{alphabet.join}]/, '')
  end
end
