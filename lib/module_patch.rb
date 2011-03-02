class Module
  def ah(*data)
    ActiveSupport::OrderedHash.[](*data)
  end
end
