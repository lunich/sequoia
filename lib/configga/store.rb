module Configga
  ##
  # Class: Simple container to store internal config
  #
  # It exists only to make a difference between hash value and internal data
  #
  class Store < ::Hash

    def deep_merge(store)
      store.each_pair do |key, value|
        if self[key].class == Store && value.class == Store
          self[key].deep_merge(value)
        else
          self[key] = value
        end
      end

      self
    end

  private

    ##
    # Private: Initialize new Store
    #
    # Params:
    # - hash {Hash} Hash object to convert
    #
    def initialize(hash={})
      super(nil)
      self.merge!(hash)
    end
  end
end