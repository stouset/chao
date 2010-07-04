class Array
  def rotate(distance)
    self.push *self.shift(distance % self.length)
  end
end
