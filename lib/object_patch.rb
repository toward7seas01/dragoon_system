class Object
  def ah(*data)
    ActiveSupport::OrderedHash.[](*data)
  end
end
