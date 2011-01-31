class ActiveRecord::Base

  def self.hash_all(hash_key, *args)
    hash = {}
    collection = find(:all, *args)
    unless collection.empty?
      collection.each_with_index {|el, idx| hash[el.send(hash_key) || idx] = el}
    end
    hash
  end

end