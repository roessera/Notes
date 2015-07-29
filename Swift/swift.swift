//string
	
	var a = String(){ /*Accessor Methods*/}
	var a = String()
	var a = ""
	var a : String = ""
	var a : String? 									//optional, says "This value may be of type String, otherwise it's nil"
	var b : a!											//forced unwrapping of the optional
	var a : Character = "\u{E9}\u{20DD}"				//characters
	var a : String = b ?? c								//Default value. Says "If B is nil, use C"
	var a : String { get{} set{} } 						//Computed Property, Read and Write
	var a : String { get{} }	 						//Computed Property, Read Only
	var a : String { return "a" }						//Computed Property, Read Only
	var a : String = "a" {								//Observers
		willSet(val) {}										//called beforehand
		didSet {}											//called afterwards
	}

//array
	
	var a = [Int](); 
	var a : [Type] = [element1, element2]
	var a = [element1, element2] 						//shorthand
	var a = [Int]() 									//creates new empty array of type Int
	var a = [Double](count: 3, repeatedValue: 0.0) 		// a is of type [Double], and equals [0.0, 0.0, 0.0]
	var a = arrName1 + arrName2  						//joins arrays together

//Set - stores values of the same type, with no defined ordering

	var a : Set 		= ["a", "b", "c"];
	var a : Set<String> = ["a", "b", "c"];

//Dictionary

	var a : [KeyType, ValueType]();
	var a : Dictionary<KeyType, ValueType> = [Key : Value];
	var a = [Int: String]()
	var a = [:] 
	var a : [KeyType : ValueType] = [Key : Value , Key2 : Value2]; 
	var a : [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
	var a = ["YYZ": "Toronto Pearson", "DUB": "Dublin"] //shorthand
	var a	["LHR"] = "London" //subscripting for adding

//tuple

	var a 		 = (value1, value2)
	var (b , c ) = a 									//breaks apart into its own values
	var (b , _ ) = a									//when you only need the first value of tuple

//struct

	struct a {
		
		static  var a = 0	 						//Type(e.g. Constructor) Property for structures
				var a = 0						    //Instance Property
		
		static  func a(){} 	 						//Type Method
				func a(){}							//Instance method

		mutate func a(){}							//mutation method

		unowned let a								//unowned property,  "weak" reference but assumed to always have a value
	}

//class

	class a : Super, Protocol, Protocol2 {			//SuperClass, Protocol, Protocol2 are optional
		
		class 	var a = 0							//Type Property
				var a = 0							//Instance Property
		
		class   func a(){}							//Type Method
				func a(){}							//Instance method

		var a: Double { get{} set{} } 				//Computed Property, Read and Write
		var a: Double { get{} }	 					//Computed Property, Read Only
		var a: Double { return b }	 				//Computed Property, Read Only

		override func a(){}							//Override superclass func
		final	func a(){}							//Prevents overide

		init(){}									//init method

		var a: Int = 0 {							//observers
			willSet(val) {}								//called beforehand
			didSet {}									//called afterwards
		}
		
	}

//function
	func a(name:  String = "Aaron"){}	//Default Parameters
	func a(names: String...){}			//Variadic Parameters
	func a(inout names: String){}		//Inout Parameters
	func a <T> (inout names:T){}		//Generic Parameters
	func a (var name:String){}			//Variable Parameters
	func a (#name:String){}				//external parameter
	func a (name:String?){}				//Optional Parameter

//Casting
	
	!  //“this might (be a?) trap,” 
	?  //“this might be nil.”
	
	is //checks type. checks whether an instance is of a certain subclass type (Ex. item is Class)
	as? //Downcasts to subclass, but might be nil 
		(Ex. 
			//can <Optional> b be considered as a String ? 
			if b as? String { 
				//do string-only stuff ex b.uppercaseString;
		    }
		)
	as	//Downcasts to subclass

	AnyObject	//Must be a class
	Any			//Must be a structure

//Access Control

	
    internal //(default)	: available to the entire module that includes the definition (e.g. an app or framework target).
    private	//		: available only from within the source file where they are defined.
    public	//		: entities are intended for use as API, and can be accessed by any file that imports the module, e.g. as a framework used in several of your projects.
    


//Return Types
	
	[Void -> Void]	/*is the same as */ [ ()->() ]    //Void is simply a typealias to ()

//Placeholder
	func swapTwoValues<T>(inout a: T, inout b: T){}

//extension 
	extension a: Protocol1, Protocol2 {}			

//Type Aliases
	typealias AudioSample = UInt16		   //Type aliases define an alternative name for an existing type. 

	//Swift provides two special type aliases for working with non-specific types:
		AnyObject //can represent an instance of any class type.
		Any		 //can represent an instance of any type at all, apart from function types.”

//Sequences
	//range
	for i in 1...5 {} 

		//is the same as:

		var range = Range(start: 1, end: 5)
		for i in range { println(i) }

	//subscript
	arrName[4...6] //gets items 4-6

	//methods
	arrName.append("flour")
	arrName += ["flour"]

	//looping
		
	//array
	for i in arrName {
		println(i)
	}

	//array + index
	for (idx, val) in enumerate(arrName) {
		println(i)
	}

//Optionals 
	//variables that should have a default of nothing/nil, not say, 0 


    //Use ? if the value can become nil in the future, so that you test for this.
    //Use ! if it really shouldn't become nil in the future, but it needs to be nil initially.

	
	//these are the same
    var a: Int?									//holds an int, but may be nil
    var a: Optional<Int>

    //these are the same
    var height: Int? = 180
    var height: Optional<Int> = Optional<Int>(180)

	var a.b! 									//forced unwrapping of optional, 101% certain b has a value
	var a.b? 									//"Im not sure b has a value, but use it if there is one"

		//Ex.
		if let var c = a.b{ 
			/*code*/ 
		}else{

		}		
		//checks if theres a value, then perform stuff 
		//so you don't have to write: 
		a.b?.c = true
		a.b?.d = true
		a.b?.e = true

		let a as? Int								//returns nil if it's not an int
		let a as  Int								//101% 
			Ex.
				switch a {
					case let b as Int: 		println("a is a int")
					case let b as Double: 	println("a is a double")
					default: break
				}

//Dictionary
	//keyType must be the same 
	//valueType must be the same

	//empty dictionary
	var dictName = [Int: String]()
	var dictName = [:] 
	

	var dictName : [KeyType : ValueType] = [Key : Value , Key2 : Value2]; 
	var dictName : [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
	var dictName = ["YYZ": "Toronto Pearson", "DUB": "Dublin"] //shorthand
	var dictName["LHR"] = "London" //subscripting for adding

	//looping
	
	//keys / values
	for (airportCode, airportName) in airports {
		println("\(airportCode): \(airportName)")
	}
	//keys
	for airportCode in airports.keys {
		println("Airport code: \(airportCode)")
	}
	//values
	for airportName in airports.values {
		println("Airport name: \(airportName)")
	}

//Default values
	var a : String?
	var b : String = "hey"
	var c : String = a ?? b

	println(c) //"hey"

//Operators
	(a ?? b)		//which is the same as: (a != nil ? a! : b)

//Functions

	//syntax
		func funcName (argName : argType) -> (returnName : returnType , returnName1 : returnType1)  {
			return (var1 , var2) //tuple
		}

	//

	// ? == optional tuple//
		func minMax(array: [Int]) -> (min: Int, max: Int)? { 

		}

	// ? == optional arguments//
		func minMax(array: [Int]) -> (min: Int?, max: Int?) { 

		}

	// in-out 
		//An in-out parameter has a value that is passed *in* to the function, is modified by the function, and is passed back *out* of the function to replace the original value.
		func swapTwoInts(inout a: Int, inout b: Int) {

		}
		// & - tells function it can modify values passed in
		swapTwoInts(&someInt, &anotherInt)

	//external parameter name AKA NAMED PARAMETERS
		func funName(externalName localName: argType){

		}

		//example//
	    
	    //doesnt use external names
		    func join (s1: String, s2: String, joiner: String) -> String {
		    	return s1 + joiner + s2
		    }

		    //uses external names//
		    func join (string s1: String, toString s2: String, withJoiner joiner: String) -> String {
		    	return s1 + joiner + s2
		    }

		    //or use # if internal name is appropriate to use externally//
		    func join (#string : String, #toString : String, #withJoiner: String) -> String {
		    	return s1 + joiner + s2
		    }

		//call using external names//
	    join(string: "hello", toString: "world", withJoiner: ", ")



	//default values//
    func join(s1: String, s2: String, joiner: String = " ") -> String {
    	return s1 + joiner + s2
    }


	//Variadic Parameters//
	
		//A variadic parameter accepts zero or more values of a specified type


		func arithmeticMean(numbers: Double...) -> Double {
			var total: Double = 0
			for number in numbers {
				total += number
			}
			return total / Double(numbers.count)
		}

		arithmeticMean(1, 2, 3, 4, 5) //returns 3

	
	//Constant and Variable Parameters//

		//Function parameters are constants by default. 
		//Variable parameters can only be changed within the function itself

		func funcName(var string : String){}

		
	//In-Out Parameters//

		//If you want a function to modify a parameter’s value, and you want those changes to persist after the function call has ended, define that parameter as an in-out parameter instead.

	//Function types//

	    var mathFunction: (Int, Int) -> Int = addTwoInts

	    “Define a variable called mathFunction, which has a type of ‘a function that takes two Int values, and returns an Int value.’ Set this new variable to refer to the function called addTwoInts.”

	//Function Types as Return Types//

	    func stepForward(input: Int) -> Int {
	    	return input + 1
	    }
	    func stepBackward(input: Int) -> Int {
	    	return input - 1
	    }

		Here’s a function called chooseStepFunction, whose return type is “a function of type (Int) -> Int”. 
		chooseStepFunction returns the stepForward function or the stepBackward function based on a Boolean parameter called backwards: 

		    func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
		    	return backwards ? stepBackward : stepForward
		    }

	    You can now use chooseStepFunction to obtain a function that will step in one direction or the other: 

	    	var currentValue = 3

			let moveNearerToZero = chooseStepFunction(currentValue > 0)

	//Nested Functions

		func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
			func stepForward(input: Int) -> Int { return input + 1 }
			func stepBackward(input: Int) -> Int { return input - 1 }
			return backwards ? stepBackward : stepForward
		}

//Closures//
	
	//
	var completionHandler:(Float)->Void = { arg in }
	


	func backwards(s1: String, s2: String) -> Bool {
		return s1 > s2
	}

	sorted(names, backwards)
	

	//-is equal to: //


	sorted(names, { (s1: String, s2: String) -> Bool in
		return s1 > s2
	})

	

	Ex3
		/* 
			create a function called success() which accepts 0 arguments, 
			and returns a function that accepts 1 argument (Int), 
			which returns an Int 
		*/


		var success: ( (   )-> (Int)->Int) 
		
		var fail:    ( (Int)->  Int      )
			fail = { (Int) in
			    return 1
			}

		//**is the same as**//

		func fail(Int) -> Int {
			return 1
		}

		success = {
		    return fail
		}

		
	


//Ways to write a closure
	//syntax//
	{ 	(parameters) -> returntype in return
		
		closure body

	}
	
	//Note: the word 'in' introduces the start of the closure body
	
	sorted(names, backwards) 												// function outside
	sorted(names, { (s1: String, s2: String) -> Bool in return s1 > s2 } )
	sorted(names, { s1, s2 in return s1 > s2 } )
	sorted(names, { s1, s2 in s1 > s2 } ) 									//Single-Expression Closures
	sorted(names, { $0 > $1 } ) 											//Shorthand Argument Names
	sorted(names, >)
	sorted(names) { $0 > $1 }  												//trailing closure//


	let digitNames = [
		0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
		5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
	]

	let numbers = [16, 58, 510]


	let strings = numbers.map {
		(var number) -> String in
		var output = ""
		while number > 0 {
			output = digitNames[number % 10]! + output
			number /= 10
		}
		return output
	}

	//makeIncrementor returns a function, and that function returns an int : 
	func makeIncrementor(forIncrement amount: Int) -> () -> Int { }

	/*
	func map<U> 	(transform: (T) -> U) 	-> [U]

		//map accepts a function as a argument. This function (named transform), 
		//accepts type T as an argument, and returns type U.
		//Once executed, map() returns an array of U's. 
	*/

//enums//
	//An enumeration defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code. 

	enum Barcode {
	    case UPCA(Int, Int, Int, Int)
	    case QRCode(String)
	}

	/*
	This can be read as: 

		“Define an enumeration type called Barcode, which can take either 
		a value of UPCA with an associated value of type (Int, Int, Int, Int), 
		or a value of QRCode with an associated value of type String.”
	*/ 




//classes and structures//

	//Structures / Enumerations 	: Each instance has their own values, and are not shared.
	//Classes 						: Each instance shares it's values with other instances.


//Properties


	//lazy property 

		//avoids unnecessary initialization until used

		//Ex. lazy var importer = DataImporter()	

	 
	//Computed Properties 

		//don't store a values, but provide getter / setter functions to retrieve values indirectly
	
	
		Ex. 

		struct Rect {
			var origin = Point()
			var size = Size()
			var center: Point {
				
				get {
					let centerX = origin.x + (size.width / 2)
					let centerY = origin.y + (size.height / 2)
					return Point(x: centerX, y: centerY)
				}
				set(newCenter) {
					origin.x = newCenter.x - (size.width / 2)
					origin.y = newCenter.y - (size.height / 2)
				}
			}
		}


	//Read-Only Computed Properties

		A computed property with a getter but no setter is known as a read-only computed property. 
		A read-only computed property always returns a value, and can be accessed through dot syntax, but cannot be set to a different value. 


		Ex.

		struct Cuboid {
			var width = 0.0, height = 0.0, depth = 0.0
			var volume: Double {
				return width * height * depth
			}
		}

		let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
		println("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
		// prints "the volume of fourByFiveByTwo is 40.0"


	//Property Observers

		willSet - called just before the value is stored
		didSet - called immediately after the new value is stored

		Ex.

		class StepCounter {
			var totalSteps: Int = 0 {
				willSet(newTotalSteps) {
					println("About to set totalSteps to \(newTotalSteps)")
				}
				didSet {
					if totalSteps > oldValue {
						println("Added \(totalSteps - oldValue) steps")
					}
				}
			}
		}


	//Global and Local Variables


	////////

	struct/enum/string/array/dictionary : 
		value types, 
		stored properties, 
		computed properties
	class : 
		ref type, 
		stored properties

	//////


	//Instance properties - Unique to instance. 

		Every time you create a new instance of that type, it has its own set of property values.

	//Type Properties - Unique to class. Shared by all instances.

		Type properties are useful for defining values that are universal to all instances of a particular type, 
		such as a constant property that all instances can use (like a static constant in C), 
		or a variable property that stores a value that is global to all instances of that type (like a static variable in C). 

		For value types (that is, structures and enumerations), you can define stored and computed type properties. 
		For classes, you can define computed type properties only. 

		static - 	type properties for value types (enum / struct)
		class - 	type properties for reference types (class)

		ex

		struct SomeStructure {
		    static var storedTypeProperty = "Some value."
		    static var computedTypeProperty: Int {
		        // return an Int value here
		    }
		}
		enum SomeEnumeration {
		    static var storedTypeProperty = "Some value."
		    static var computedTypeProperty: Int {
		        // return an Int value here
		    }
		}
		class SomeClass {
		    class var computedTypeProperty: Int {
		        // return an Int value here
		    }
		}


		//if classes have properties by reference, why the need of type of properties ?

		 answer: classes share values, not properties. 


//Methods//	

	Swift gives the first parameter name in a method a local parameter name by default, and gives the second and subsequent parameter names both local and external parameter names by default.

		Ex.

	    class Counter {
	    	var count: Int = 0
	    	func incrementBy(amount: Int, numberOfTimes: Int) {
	    		count += amount * numberOfTimes
	    	}
	    }


    //self//

		The increment method in the example above could have been written like this:

		    func increment() {
		    	self.count++
		    }


	//Modifying Value Types from Within Instance Methods//

		Structures and enumerations are value types. By default, the properties of a value type cannot be modified from within its instance methods. 

		However, if you need to modify the properties of your structure or enumeration within a particular method, you can opt in to mutating behavior for that method. The method can then mutate (that is, change) its properties from within the method, and any changes that it makes are written back to the original structure when the method ends. 
		The method can also assign a completely new instance to its implicit self property, and this new instance will replace the existing one when the method ends. 

	//Assigning to self Within a Mutating Method//

	

		Ex.

		Mutating methods can assign an entirely new instance to the implicit self property. The Point example shown above could have been written in the following way instead:

		    struct Point {
		    	var x = 0.0, y = 0.0
	    		mutating func moveByX(deltaX: Double, y deltaY: Double) {
	    			self = Point(x: x + deltaX, y: y + deltaY)
	    		}
		    }






		Ex.

		Mutating methods for enumerations can set the implicit self parameter to be a different member from the same enumeration: 


		enum TriStateSwitch {
		    case Off, Low, High
		    mutating func next() {
		        switch self {
		            case Off:
		                self = Low
		            case Low:
		                self = High
		            case High:
		                self = Off
		        }
		    }
		}
		var ovenLight = TriStateSwitch.Low
		ovenLight.next()

	//Type Method//

		class SomeClass {
			class func someTypeMethod() {
				// type method implementation goes here
			}
		}

		struct LevelTracker {
		    static var highestUnlockedLevel = 1

		    static func unlockLevel(level: Int) {
		        if level > highestUnlockedLevel {
		            highestUnlockedLevel = level
		        }
		    }
		    static func levelIsUnlocked(level: Int) - > Bool {
		        return level <= highestUnlockedLevel
		    }
		    var currentLevel = 1
		    mutating func advanceToLevel(level: Int) - > Bool {
		        if LevelTracker.levelIsUnlocked(level) {
		            currentLevel = level
		            return true
		        } else {
		            return false
		        }
		    }
		}

		The LevelTracker structure keeps track of the highest level that any player has unlocked. This value is stored in a static property called highestUnlockedLevel. 







//Subscripts//

	Classes, structures, and enumerations can define subscripts, which are shortcuts for accessing the member elements of a collection, list, or sequence. 
	You use subscripts to set and retrieve values by index without needing separate methods for setting and retrieval. 
	For example, you access elements in an Array instance as someArray[index] and elements in a Dictionary instance as someDictionary[key].

	struct TimesTable {
	    let multiplier: Int
	    subscript(index: Int) - > Int {
	        return multiplier * index
	    }
	}
	let threeTimesTable = TimesTable(multiplier: 3)
	println("six times three is \(threeTimesTable[6])")

//@import vs #import vs #include vs import

	@import - (new style) safer, loads modules 

		/*
		Modules are an attempt to get around this. They are no longer a copy-and-paste into source code, 
		but a serialised representation of the included files that can be imported into your source code only when and where they’re needed. 
		By using modules, code will generally compile faster, and be safer than using either #include or #import.
		*/

	#include (C) - 
	#import (ObjC) -
	import  (swift)  - use to import modules from obj, c, and swift

//@autoreleasepool

//Type Casting//
	
	//is

		//check whether an instance is of a certain subclass type

		for item in library {
			if item is Movie {
				++movieCount
			} else if item is Song {
				++songCount
			}
		}

	//as / as?

		//A constant or variable of a certain class type may actually refer to an instance of a subclass behind the scenes.


//Extensions//

	//Extensions add new functionality to an existing class, structure, or enumeration type. 
	//This includes the ability to extend types for which you do not have access to the original source code (known as retroactive modeling). 
	//Extensions are similar to categories in Objective-C. (Unlike Objective-C categories, Swift extensions do not have names.) 

	/*
		Note: If you define an extension to add new functionality to an existing type, 
		the new functionality will be available on all existing instances of that type, even if they were created before the extension was defined.
	*/ 

	/*
		An extension can extend an existing type to make it adopt one or more protocols. 
		Where this is the case, the protocol names are written in exactly the same way as for a class or structure:
	*/
    

    extension SomeType: SomeProtocol, AnotherProtocol {
    	// implementation of protocol requirements goes here
    }


	//Ex1

    
	    extension Double {
		    var km: Double { return self * 1_000.0 }
		    var m: Double { return self }
		    var cm: Double { return self / 100.0 }
		    var mm: Double { return self / 1_000.0 }
		    var ft: Double { return self / 3.28084 }
	    }


    let oneInch = 25.4.mm
    	println("One inch is \(oneInch) meters")
    	// prints "One inch is 0.0254 meters"
    let threeFeet = 3.ft
    	println("Three feet is \(threeFeet) meters")
    	// prints "Three feet is 0.914399970739201 meters"


	//Ex2.
		extension Int {
			func repetitions(task: () -> ()) {
				for i in 0..<self {
					task()
				}
			}
		}

		3.repetitions({
			println("Hello!")
		})

//Properties

class Numbers {
    
    //class property
    static var numberofNumbers:Int = 0;
    
    //computed property for class
    static var computedTypeProperty: Int {
        
        return 27
    
    };
    
    //computed property for overable property
    class var overrideableComputedTypeProperty: Int {
        return 107
    };
    
}



//Generics//

	//Type Parameters

		//<T> is a placeholder, which means it can accept any type

		

		Ex1.

			struct Stack {
				var items = [Int]()
				mutating func push(item: Int) {
					items.append(item)
				}
				mutating func pop() -> Int {
					return items.removeLast()
				}
			}

			//rewritten with generics:

			struct Stack<T> {
				var items = [T]()
				mutating func push(item: T) {
					items.append(item)
				}
				mutating func pop() -> T {
					return items.removeLast()
				}
			}


			//and then called: 
			var stackofStrings 	= Stack <String> ()
			var stackofInts 	= Stack <Int>	 ()

	//extending a generic type

		extension Stack {
			var topItem: T? {
				return items.isEmpty ? nil : items[items.count - 1]
			}
		}


	//Type Constraint Syntax

		//it is sometimes useful to enforce certain type constraints on the types that can be used with generic functions and generic types. 
		//Type constraints specify that a type parameter must inherit from a specific class, or conform to a particular protocol or protocol composition.

		func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
			// function body goes here
		}


		Ex1.

		func findIndex<T>(array: [T], valueToFind: T) -> Int? {
			for (index, value) in enumerate(array) {
				if value == valueToFind {
					return index
				}
			}
			return nil
		}

		/*Note: 
			Since this is a generic, the statement:
				 if value == valueToFind {}  
			will not always work. 
			Use Equatable protocol like the following:
		*/ 

		func findIndex<T: Equatable>(array: [T], valueToFind: T) -> Int? {
			for (index, value) in enumerate(array) {
				if value == valueToFind {
					return index
				}
			}
			return nil
		}


		//The single type parameter for findIndex is written as T: Equatable, which means “any type T that conforms to the Equatable protocol.” 



//

//Ex

//*Share single struct (Config) between all instances of VideoMode */
	//ex1.
	struct Config {
	    static var name = "Aaron"
	}

	class VideoMode {
	    let c = Config.self  // <!--- the important part
	    var interlaced = false
	    var frameRate = 0.0
	}


	var a = VideoMode()
	    a.c.name = "butt"
	var b = VideoMode()

	println(b.c.name)



	println(a.c.name)


	//ex2.

	struct Config {
	    static  var name = "Aaron"
	    private	var name = "aaron"
	    
	    
	}

	var a = Config()
	var b = Config.self

	println(a.name)
	println(b.name)


//casting

class myClass{
    var name:String
    init(name:String){
        self.name = name
    }
}
class myClass2{
    var name:String
    init(name:String){
        self.name = name
    }
}

let library = [
    myClass(name:"hey"),
    myClass(name:"hey2"),
    myClass(name:"hey3")   
]

let library2 = [
    myClass(name:"hey"),
    myClass(name:"hey2"),
    myClass2(name:"hey3")   
]

for element in library{
    println(element.name) // "hey", "hey2", "hey3"
}

for element in library2{
    println(element.name) // "nil", "nil", "nil"   
}

//works
for element in library2{
	if let item = element as? myClass{
		println(item.name)
    }
    if let item2 = element as? myClass2{
		println(item.name)
    }
}

//also works 

var library2:[AnyObject] = []

library2.append(myClass(name:"hey"))
library2.append(myClass2(name:"hello"))
library2.append(myClass(name:"hey"))

for element in library2{
    
    switch element{
        case let item as myClass:   println(item.name)
        case let item as myClass2:  println(item.name)
        default:                    println("nope")
        //case let item2 as? myClass2: println(item2.name)
    }
  
   
}

//Ex3
class MediaItem {
	var name: String
	init(name: String) {
		self.name = name
	}
}
class Movie: MediaItem {
	var director: String
	init(name: String, director: String) {
		self.director = director
		super.init(name: name)
	}
}
class Song: MediaItem {
	var artist: String
	init(name: String, artist: String) {
		self.artist = artist
		super.init(name: name)
	}
}
class Book {
    var artist:String
    init(name: String, artist: String) {
		self.artist = artist
		
	}
}
let library = [
	Movie(name: "Casablanca", director: "Michael Curtiz"),
	Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
	Movie(name: "Citizen Kane", director: "Orson Welles"),
	Song(name: "The One And Only", artist: "Chesney Hawkes"),
	Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
	,Book(name:"Moby", artist:"Wells")
	
]


//
generic type 'Array' declared here


//KVO in Swift
The first options is to simply use the pre-existing Key-Value-Observing capability provided by NSObject. 
In order to make a Swift type observable it must inherit from NSObject, 
and any properties that you wish to observe need to be marked with the dynamic keyword:

class Car: NSObject {
  dynamic var miles = 0
  dynamic var name = "Turbo"
}
