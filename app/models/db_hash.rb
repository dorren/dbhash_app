require 'yaml'

# This class acts almost like regular hash, but saves data into db.
#
# Sample Usage:
#   DbHash['key1']  --> nil
#   DbHash['key1'] = 123   --> # create new row in db.
#   DbHash['key1']         --> # returns 123
#   DbHash.delete('key1')  --> # delete the row
class DbHash < ActiveRecord::Base
  validates_uniqueness_of :hkey
  
  class << self  
    # retrieve hash value
    def [](key)
      key = key.to_s
      if cache_val = read_cache(key)
        return cache_val
      end
    
      if record = find_by_hkey(key) 
        value = decode_value(record.hvalue)
        save_cache(key, value)     # cache it
        return value
      end
    end

    # save key value pair
    def []=(key, value)
      key, val = key.to_s, encode_value(value)
      record = find_or_create_by_hkey(key)
      record.update_attribute("hvalue", val)
      save_cache(key, value)
    end

    # delete tuple
    def delete(key)
      val = send("[]", key)
      record = find_by_hkey(key.to_s)
      record.destroy
      return val
    end

    private
    def encode_value(val)  # factored out for future modification
      YAML::dump(val)
    end

    def decode_value(val)
      YAML::load(val)
    end
  
    def save_cache(key, value) # factored out for future modification
      Rails.cache.write(key, value) 
    end
  
    def read_cache(key)
      Rails.cache.read(key)
    end
  end  # class << self
end