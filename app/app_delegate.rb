Queue1 = Dispatch::Queue.concurrent('com.testing.queue1')
Queue2 = Dispatch::Queue.concurrent('com.testing.queue2')

def fun
  Queue1.async do
    ptr = Pointer.new(:object)
    return
  end
end

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    fun
    
    Queue2.async do
      obj = ClassWithPointer.new
      obj.speak
    end

    puts "Success!"

    true
  end
end
