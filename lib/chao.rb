require 'ext/array/move'
require 'ext/array/rotate'
require 'ext/string/normalize'

class Chao
  ALPHABET = ('A'..'Z').to_a
  
  ZENITH = 0
  NADIR  = ZENITH + (ALPHABET.length / 2)
    
  def self.encipher(key, plaintext)
    chao = self.new(*key)
    chao.encipher(plaintext)
  end
  
  def self.decipher(key, ciphertext)
    chao = self.new(*key)
    chao.decipher(plaintext)
  end
  
  def self.generate_key
    [ ALPHABET.shuffle.join, ALPHABET.shuffle.join ]
  end
  
  def initialize(*key)
    @key = key.map {|s| s.split(//) }
  end
  
  def plainwheel
    @key.first
  end
  
  def cipherwheel
    @key.last
  end
  
  def encipher(plaintext)
    plaintext.normalize(ALPHABET).each_char.map {|c| self + c }.join
  end
  
  def decipher(ciphertext)
    ciphertext.normalize(ALPHABET).each_char.map {|c| self - c }.join
  end
  
  protected
  
  def +(character)
    permute! self.plainwheel.index(character)
    self.cipherwheel.first
  end
  
  def -(character)
    permute! self.cipherwheel.index(character)
    self.plainwheel.last
  end
  
  private
  
  def permute!(index)
    permute_plainwheel!(index)
    permute_cipherwheel!(index)
  end
  
  def permute_plainwheel!(index)
    self.plainwheel.rotate(index - ZENITH + 1)
    self.plainwheel.move(ZENITH + 2, NADIR )
  end
  
  def permute_cipherwheel!(index)
    self.cipherwheel.rotate(index - ZENITH)
    self.cipherwheel.move(ZENITH + 1, NADIR)
  end
end
