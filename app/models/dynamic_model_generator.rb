class DynamicModelGenerator
  def self.load
    class_name = "Book"
    klass = Object.const_get(class_name) rescue Object.const_set(class_name, Class.new(Product))

  end
end