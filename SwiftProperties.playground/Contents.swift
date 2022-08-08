import UIKit

//A Swift variable or constant defined inside a class or struct are called properties.

//Properties associate values with a particular class, structure, or enumeration. Stored properties store constant and variable values as part of an instance, whereas computed properties calculate (rather than store) a value. Computed properties are provided by classes, structures, and enumerations. Stored properties are provided only by classes and structures.


class Person {

 // define two properties
 var name: String = ""
 var age: Int = 0
}

var person1 = Person()

// assign values to properties
person1.name = "Kevin"
person1.age = 42

// access properties
print("Name:", person1.name)
print("Age:", person1.age)

//These properties defined above are also called stored properties as they store actual values for each instance of the Person class.



//There is another type of property called computed properties. Unlike stored property, a computed property calculates the value.
print("\n")
class Calculator {

  // define two stored properties
  var num1: Int = 0
  var num2: Int = 0

  // define one computed property
  var sum: Int {

    // calculate value
    num1 + num2
  }
}

var obj = Calculator()
obj.num1 = 11
obj.num2 = 12

// read value of computed property
print("Sum:", obj.sum)


//When an instance of a value type is marked as a constant, so are all of its properties.
//The same isn’t true for classes, which are reference types. If you assign an instance of a reference type to a constant, you can still change that instance’s variable properties.



//lazy Properties:
//A lazy stored property is a property whose initial value isn’t calculated until the first time it’s used. You indicate a lazy stored property by writing the lazy modifier before its declaration.

//The lazy property is marked as lazy var. You can't make it lazy let because lazy properties must always be variables.


//As an example, consider this FamilyTree struct:

//without lazy property
print("\n")
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}
//We might use that FamilyTree struct as a property inside a Person struct, like this:

struct Person2 {
    var name: String
    var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
        print(self.name)
    }
}

var ed = Person2(name: "Ed")



//with lazy property
print("\n")
struct FamilyTree2 {
    init() {
        print("Creating family tree!")
    }
}

struct Person3 {
    var name: String
    lazy var familyTree2 = FamilyTree2()

    init(name: String) {
        self.name = name
        print(self.name)
    }
}


var james = Person3(name: "James")
//But what if we didn’t always need the family tree for a particular person? If we add the lazy keyword to the familyTree property, then Swift will only create the FamilyTree struct when it’s first accessed:

//james.familyTree2

//Note: You must always declare a lazy property as a variable (with the var keyword), because its initial value might not be retrieved until after instance initialization completes. Constant properties must always have a value before initialization completes, and therefore can’t be declared as lazy.


var bond = Person3(name: "Bond")


//watch: https://www.youtube.com/watch?v=xKoua1Mi6qE&ab_channel=SeanAllen

struct CalculatorN {
  
  static func calculate() -> Int{
    
    var arr: [Int] = []
    for i in 1...4_000{
        arr.append(i)
    }
    return arr.last!
  }
}


struct PP {
  
  
  var name: String
  var age: Int
//  var a = CalculatorN.calculate()
    
   lazy var a = {
       CalculatorN.calculate()
   }()

  init(name: String, age: Int){
    self.name = name
    self.age = age

    print("Mr.\(self.name) of age \(self.age)")
  }
}
  

var x = PP(name: "Ahmed", age: 42)




//“Computed Properties
//In addition to stored properties, classes, structures, and enumerations can define computed properties, which don’t actually store a value. Instead, they provide a getter and an optional setter to retrieve and set other properties and values indirectly.
print("\n")
struct Sport {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

//As you can see, olympicStatus looks like a regular String, but it returns different values depending on the other properties.

//We can try it out by creating a new instance of Sport:

let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)


struct NewStruct {
    
    var rollNo: Int
    var marksObtained: Float
    var totalMarks: Float
    var verdict: String = ""
    
    var percentage: Float {
        
        get {
//            return  "\(rollNo) have secured \((marksObtained/totalMarks) * 100) in exams"
            return (marksObtained/totalMarks) * 100
        }
        
        set(newValue) {
            if newValue < 50.0 {
               verdict += "You have failed"
            }
            else {
                verdict += "Weldone! You have passed."
            }
        }
    }
}

var stu1 = NewStruct(rollNo: 120, marksObtained: 87.54, totalMarks: 100)

var score = stu1.percentage
//print(stu1.percentage)
print(score)

stu1.percentage = score
print(stu1.verdict)


//“If a computed property’s setter doesn’t define a name for the new value to be set, a default name of newValue is used”

//“If the entire body of a getter is a single expression, the getter implicitly returns that expression. ”



//Read-Only Computed Properties
//A computed property with a getter but no setter is known as a read-only computed property. A read-only computed property always returns a value, and can be accessed through dot syntax, but can’t be set to a different value.


//You can simplify the declaration of a read-only computed property by removing the get keyword and its braces:
print("\n")

struct Area {
    var length = 0.0
    var breadth = 0.0

    //getter
    var area: Double {
        return length * breadth
    }
}


let room1 = Area(length: 31, breadth: 20)
print("The area of the given room is: \(room1.area) meter-square.")



//encapsulation (accessing and updating private attributes with getter and setter)
print("\n")

struct linearExpansion {
    private var initial_Length: Double = 10.0
    
    var expansion: Double {
        get{
            return initial_Length
        }
        
        set {
            initial_Length = initial_Length + newValue
            
        }
    }
}

var nn = linearExpansion()

var s = nn.expansion
print("Initial length:", s)

//expansion is 5 in the original length
nn.expansion = 5 //setter

//it give total length( initial length + expansion)
print("Length after expansioin:",nn.expansion) //getter

//print(nn.length) //error beacuse length is private attribut, we can view and update private attributes by encapsulation(getter and setter).



//Property Observers
//Property observers observe and respond to changes in a property’s value. Property observers are called every time a property’s value is set, even if the new value is the same as the property’s current value.



//You have the option to define either or both of these observers on a property:

//willSet is called just before the value is stored.
//didSet is called immediately after the new value is stored.

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps.")
            }
        }
    }
}


var steps = StepCounter()

steps.totalSteps = 210

//Property Wrappers
//A property wrapper adds a layer of separation between code that manages how a property is stored and the code that defines a property.

@propertyWrapper
struct BagWeight{
    private var bagWeight: Double = 0.0
    
    var wrappedValue: Double {
        get { return bagWeight}
        
        set {
            bagWeight = min(newValue, 50.0) //bag weight should be either 50 pounds or less.
        }
    }
    
}

struct PassengerItems {
    @BagWeight var bags: Double
}

var passenger = PassengerItems()
passenger.bags


passenger.bags = 48.5
print(passenger.bags)

passenger.bags = 77.0
print(passenger.bags) //print 50 cuz if the weigth is more than 50 , then 50(the largest allowed value) is printed.



//the above can also be written as:

//After making struct BagWeight as above:
struct PassengerThings {
    private var bags = BagWeight()
    
    var weight: Double {
        
        get { return bags.wrappedValue }
        
        set { bags.wrappedValue = newValue }
    }
}

//The bags property store an instance of the property wrapper, BagWeight. The getter and setter for bags wrap access to the wrappedValue property.




//Setting Initial Values for Wrapped Properties
//The code in the examples above sets the initial value for the wrapped property by giving number an initial value in the definition of TwelveOrLess. Code that uses this property wrapper can’t specify a different initial value for a property that’s wrapped by TwelveOrLess—for example, the definition of SmallRectangle can’t give height or width initial values. To support setting an initial value or other customization, the property wrapper needs to add an initializer.

@propertyWrapper
struct SmallNumber {
    private var maximun: Int
    private var num: Int
    
    var wrappedValue: Int {
        get { return num }
        
        set { num = min(newValue, maximun) }
    }
    
    init() {
        maximun = 12
        num = 0
    }
    
    init(wrappedValue: Int) {
        maximun = 12
        num = min(wrappedValue, maximun)
    }
    
    init(wrappedValue: Int, maximum: Int) {
        self.maximun = maximum
        num = min(wrappedValue, maximum)
    }
}

//When you apply a wrapper to a property and you don’t specify an initial value, Swift uses the init() initializer to set up the wrapper.

struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRect = ZeroRectangle()
print("\nheight is:", zeroRect.height, "& width is:", zeroRect.width)


//When you specify an initial value for the property, Swift uses the init(wrappedValue:) initializer to set up the wrapper.
struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}

var unitRect = UnitRectangle()
print("\nheight is:", unitRect.height, "& width is:", unitRect.width)



//If you provide an initial value and a maximum value, Swift uses the init(wrappedValue:maximum:) initializer:
struct NarrowRectangle {
    @SmallNumber(wrappedValue: 15, maximum: 18) var height: Int
    @SmallNumber(wrappedValue: 11, maximum: 15) var width: Int
}

var narrowRect = NarrowRectangle()
print("\nheight is:", narrowRect.height, "& width is:", narrowRect.width)

narrowRect.height = 23
narrowRect.width = 19
print("\nheight is:", narrowRect.height, "& width is:", narrowRect.width)


//Swift treats the assignment like a wrappedValue argument and uses the initializer that accepts the arguments you include.

struct MixedRectangle {
    @SmallNumber(wrappedValue: 25, maximum: 50) var height: Int
    @SmallNumber var width: Int = 16
}

var mixedRect = MixedRectangle()
print("\nheight is:", mixedRect.height, "& width is:", mixedRect.width) //width will be printed 12 as 12 is minimum number in min(16, 12)





//Projecting a Value From a Property Wrapper
//In addition to the wrapped value, a property wrapper can expose additional functionality by defining a projected value—for example, a property wrapper that manages access to a database can expose a flushDatabaseConnection() method on its projected value. The name of the projected value is the same as the wrapped value, except it begins with a dollar sign ($).

@propertyWrapper
struct SmallNum {
    private var num: Int
    private(set) var projectedValue: Bool
    
    var wrappedValue: Int {
        get { return num}
        
        set {
            if newValue > 12 {
                num = 12
                projectedValue = true

            }
            else {
                num = newValue
                projectedValue = false
            }
        }
    }
    
    init() {
        self.num = 0
        self.projectedValue = false
    }
}

struct SomeStruct {
    @SmallNum var someNum: Int
}

var someStruct = SomeStruct()
someStruct.someNum = 10
print(someStruct.$someNum)
someStruct.someNum = 29
print(someStruct.$someNum)



//Global and Local Variables
//Both stored and computed variables/properties can be global or local.


//Global constants and variables are always computed lazily, in a similar manner to Lazy Stored Properties. Unlike lazy stored properties, global constants and variables don’t need to be marked with the lazy modifier.
//Local constants and variables are never computed lazily.

//You can apply a property wrapper to a local stored variable, but not to a global variable or a computed variable.



//Type Properties
//Whenever we create a new instance of a class, we can set the properties of that instance. These instances have their own properties and these are called instance properties. So if we want to create multiple instances of a class, we can set the properties of each instance individually. But it would not be a good practice to set the properties of each instance individually. Then comes type properties to the rescue. Type properties are shared among all instances of a class. Only one copy of the properties is created for all the instances of a type we create.

//Type properties are created using the static keyword. So we can access the properties of a type using the class name. But we cannot access the properties of an instance using the instance name.


// Ios is a type
struct Ios
{

    // Version is a type property
    static var version = "iOS 10"
    
    // getVersion is a type method
    static func getVersion()
    {
    
        // Printing the version
        print(version)
    }
}

// Printing the version
Ios.getVersion()

// Printing the version
print(Ios.version)


struct SomeStruct2 {
    
    static var a = "Hello" //storedTypeProperty
    
    static var b: Int {    //computedTypeProperty
        return 125
    }
}


//Type properties are queried and set with dot syntax, just like instance properties. However, type properties are queried and set on the type, not on an instance of that type. For example:
print(SomeStruct2.b)
