module Pseudohash
   def self.hash_primes
   	   { 36 => [1,23,809,28837,1038073,37370269] }
   end

   def hashify(num, len = 5, base = 36)
       hp = hash_primes[base]
       maxlen = hp.count
       len = (len > (maxlen - 1)) ? (maxlen - 1) : len
       while (len < maxlen) && (base ** len < num)
           len += 1
       end
       
       if len >= maxlen
           raise Exception.new(num + 'out of range!')
       end
       
       ceil = base ** len
       prime = hp[len]
       dechash = (num * prime) % ceil
       hash = dechash.to_s(base)
       hash.rjust(len, '0')
   end
end