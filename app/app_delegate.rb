Queue1 = Dispatch::Queue.concurrent('com.testing.queue1')
Queue2 = Dispatch::Queue.concurrent('com.testing.queue2')

def fun
  Queue1.async do
    # Async block must create a pointer
    ptr = Pointer.new(:object) 

    # It also must return (even though this does nothing)
    return                     
  end
end

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    fun # Call function that calls async and returns
    
    Queue2.async do
      # Try to create obj that has a @ptr attribute
      obj = ClassWithPointer.new    

      # 'obj' will now be nil, and calling any methods on it
      # other than 'nil?' will result in an uncaught exception
      obj.speak

      # Interestingly, trying to 'raise' an exception after checking for nil will also cause a separate uncaught exception to be thrown
    end

    puts "Success!" # This line never gets called

    true
  end
end
