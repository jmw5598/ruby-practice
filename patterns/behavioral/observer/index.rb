class AbstractSubject
  def subscribe(observer)
    raise NotImplementedError.new "#{self.class} has not implemented method '#{__method__}'"
  end

  def unsubscribe(observer)
    raise NotImplementedError.new "#{self.class} has not implemented method '#{__method__}'"
  end

  def notify(value)
    raise NotImplementedError.new "#{self.class} has not implemented method '#{__method__}'"
  end
end


class Subject < AbstractSubject
  def initialize
    @observers = []
  end
  
  def subscribe(observer)
    @observers.push(observer)
  end

  def unsubscribe(observer)
    @observers.delete(observer)
  end

  def notify(value)
    puts "Emitting next value"
    @observers.each { |observer| observer.handle(value) }
  end
end


class BehaviorSubject < Subject
  def initialize(value)
    @value = value
    @observers = []
  end
  
  def subscribe(observer)
    @observers.push(observer)
    observer.handle(@value)
  end
end


class AbstractObserver 
  def handle(value)
    raise NotImplementedError.new "#{self.class} has not implemented method '#{__method__}'"
  end
end


class ConcreteAObserver < AbstractObserver
  def handle(value)
    puts "Concrete A received udpate #{value}"
  end
end


class ConcreteBObserver < AbstractObserver
  def handle(value)
    puts "Concrete B received udpate #{value}"
  end
end


############################################

subject = Subject.new

observerA = ConcreteAObserver.new
subject.subscribe(observerA)

observerB = ConcreteBObserver.new
subject.subscribe(observerB)

(1..10).each do |value|
  subject.notify("Update ##{value}")
  subject.unsubscribe(observerA) if value >= 5
  sleep(1)
end



behavior_subject = BehaviorSubject.new(10)

observerC = ConcreteAObserver.new
behavior_subject.subscribe(observerC)

observerD = ConcreteBObserver.new
behavior_subject.subscribe(observerD)

(1..10).each do |value|
  behavior_subject.notify("Update ##{value}")
  behavior_subject.unsubscribe(observerD) if value >= 5
  sleep(1)
end
