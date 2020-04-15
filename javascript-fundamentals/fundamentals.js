// JS FUNDAMENTALS

// Data Types
    // Primitive
        // Pass-by-value: when you declare a variable, or pass it as a parameter to a function, a copy of the data the variable is storing is stored or passed, rather than a reference to the data in memory
        // Immutable: can not be changed (mutated) after creation. When we change the value of the variable, a completely new value is created

        // Types
            // number => parseInt and parseFloat are notable methods. They are available as global functions and as methods on the Math object.
                Math.parseInt("3", 10) // The second arg, 10, specifies the numbering system. In this case, we set it to decimal (10). We could set it to binary (2), as well as other numbering systems. This arg determines how the conversion is calculated.
                let number3 = "3"
                console.log(typeof(number3))
            // boolean => falsey values: false, undefined, 0, "", null, NaN
            // string
                let rail = "rail";
                let newRail = rail.toUpperCase();
                console.log(rail); // does toUpperCase mutate `rail`?
                console.log(newRail);
                let rail2 = rail; // does `rail2` store a reference to the data `rail` is storing, or a copy of that data?
                console.log(rail2);
                rail = "off rails";
                console.log(rail2);
            // symbol => mostly used for object properties
            // null => an assignment value that represents emptiness
            // undefined => a variable that is declared but not assigned value - never set this yourself to allow the engine to help you debug
    // Non-primitive
        // Pass-by-reference: when you declare a variable, or pass it as a parameter to a function, a reference to the data itself is passed, rather than a copy of the data
        // Mutable: can be changed after creation. When we change the value of a variable, changes apply across all references to that variable
        // Types
            // object
                let object1 = {name: "frank"};
                let object2 = object1;
                console.log(object1, "---", object2);
                object1.name = "ben"; // mutation
                console.log(object2); // both variables reference the changed value
            // *array => actually just an Object with the element indices as the properties and the elements as the values
            // *function => actually just an Object. This is what we mean when we say functions are first class objects. We can add properties to them. This powers prototypal inheritance (like class inheritance in Ruby).

// Operators (Equality)
    // primitive data types will be compared by value
    // non-primitive data types will be compared by reference
        console.log("this string" === "this string"); // compares by value
        let object3 = {name: "frank"};
        let object4 = {name: "frank"};
        console.log(object3 === object4); // compares by reference
    // 1. Strict (===)
        let myNumber = 10;
        let myPsuedoNumber = "10";
        console.log("strict: ", myNumber === myPsuedoNumber);
    // 2. Non Strict (==) => if necessary and possible, does type conversion before comparing. If it can't convert, it will return false
        console.log("non-strict: ", myNumber == myPsuedoNumber);
        console.log(undefined == 6);

// Functions => "first class objects": functions are treated like (and are) objects. They can be assigned as values to other object properties, passed as arguments to other functions, and returned from functions

    // Function Declaration
        function sayHello(name){
            console.log("Hello, ", name)
        };
        sayHello("Frank");

    // Function Expression
        let sayGoodbye = function(name){
            console.log("Goodbye, ", name)
        };
        sayGoodbye("Frank");
    
    // Anonymous Function => often used as a callback
        setTimeout(function(){
            console.log("time is up")
        }, 2000)

    // IIFE => Immediately Invoked Function Expressions
        (function (){
            console.log("Hello, someone");
        })();

    // Higher Order Functions
        // 1. Accepts a function as an argument, and/or
        // 2. Returns a new function

        // example 1: JS built-in HOFs: map, reduce, find, filter, forEach, setTimeout

            // map

                const array1 = [1, 4, 9, 16];

                // pass a function to map
                const map1 = array1.map(x => x * 2);

                console.log(map1);
                // expected output: Array [2, 8, 18, 32]

            // forEach

                [1,2,3].forEach(function(element){
                    console.log(element + 5);
                });

            // filter

                let bigNumbers = [1,2,5,8,0,3,2,1].filter(function(element){
                    return element > 2;
                });

                console.log(bigNumbers);

        // example 2: returning a new function

            function sayGreeting(name){
                return function(greeting){
                    console.log(`${greeting}, ${name}`)
                }
            } // What does this suggest to us about scope in JS?

            let greetFrank = sayGreeting("Frank"); // we have used the HOF as a function template, building a new, unique function from it
            greetFrank("good afternoon");
            sayGreeting("Frank")("Top of the morning"); // another way to invoke it

// THIS
    // references the execution context of a function's call (owner of the function)
        // in a function, execution context (and therefore THIS) is the global object
        function printThis(){
            console.log("the global object is: ", this);
        };
        printThis();
    // in a method, execution context is the object that owns the method
        let myObject = {
            name: "frank",
            sayHello: function(){
                console.log("the method owner is: ", this)
                console.log(`Hello, ${this.name}`)
            }
        };
        myObject.sayHello();
    // in an event, THIS refers to the element that received the event
        // try this code in the developer console to see what `this` is:

        // let div = document.querySelector("div")
        // div.addEventListener('click', function(){
        //     console.log(this)
        // })

