module Util
  def self.symbolise_keys(hash)
    hash.inject({}){|h, (n,v)| h[n.to_sym] =v; h}
  end
end