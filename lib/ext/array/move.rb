class Array
  def move(from, to)
    from %= self.length
    to   %= self.length
    
    self.insert to, self.delete_at(from)
  end
end