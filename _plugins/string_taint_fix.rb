# Restore String#tainted? for Ruby versions that removed taint API
unless ''.respond_to?(:tainted?)
  class String
    # Liquid expects an object to respond to `tainted?`.
    # Provide a harmless fallback that returns false.
    def tainted?
      false
    end
  end
end
