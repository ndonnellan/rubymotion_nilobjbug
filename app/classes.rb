class ClassWithPointer
  def initialize
    @ptr = Pointer.new(:object)
  end

  def speak
    puts "Hola"    
  end
end