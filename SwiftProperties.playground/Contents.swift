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

