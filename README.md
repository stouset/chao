# Chao

A Ruby implementation of the [Chaocipher]. Not really intended for serious
use, but it's somewhat strong, simple, and functional.

[Chaocipher]: http://www.ciphermysteries.com/2010/07/03/the-chaocipher-revealed

## Usage

	require 'chao'
	
	key  = Chao.generate_key   # => ["RCGLKIWDAHSUVMFQZJPNBXTYEO", "ZIORTLCHJNWMDGQVAYBUXPKFSE"]
	chao = Chao.new(*key)      # => #<Chao:0x10187adc8>
	chao.encipher 'Some text.' # => 'WSFPBXVV'
	chao.encipher 'More text.' # => 'LVARDINW'     
	
	chao = Chao.new(*key)
	chao.decipher 'WSFPBXVV'   # => 'SOMETEXT'
	chao.decipher 'LVARDINW'   # => 'MORETEXT