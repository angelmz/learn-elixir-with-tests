# Hello, world

**[You can find all the code for this chapter here](https://github.com/angel/learn-elixir-with-tests/tree/Greetings/hello-world)**

It is traditional for your first program in a new language to be [Hello, world](https://en.m.wikipedia.org/wiki/%22Hello,_World!%22_program).

- Run `mix new hello` to create a new elixir app named hello.
- Cd into `hello` and put the following code inside `lib/hello.ex`

```elixir
defmodule Greetings do
  @spec say_hello :: :void
  def say_hello do
   IO.puts "Hello, world"
  end
end
```

- To run your program in iex type `iex -S mix hello.ex` at the root of your project in your termial.
- Now type in `Greetings.say_hello()`

## How it works

- When you write a program in Elixir, you will have an Elixir module defined with a function inside it. Modules are ways of grouping up related Elixir code together.

- The `defmodule` keyword is how you define a module with a name and a body.

- The `def` keyword is how you define a function with a name and a body.

- Functions in Elixir implicitly return the last expression the function without the need specify the `return` keyword like in other languages.

- The `@spec` keyword is used to specify the types of the arguments and the return value of a function.

  - We are expecting `say_hello/0` to return the `:ok` atom
    - The `/0` besides `say_hello` in the above sentence stands for the amount of argumens `say_hello` takes in.

- `IO.puts` prints a line to the console and returns an `:ok` atom when it has finished exectuting successfully.
  - Atoms are constants that represent a name or a string. They commonly used as message names in Elixir's process-oriented programming model. The `:ok` atom is a common convention in Elixir to indicate that a function or operation has completed successfully.

## How to test

How do you test this? It is good to separate your "domain" code from the outside world (side-effects). The `IO.puts` is a side effect (printing to stdout) and the string we send in is our domain.

So let's separate these concerns so it's easier to test

```elixir
defmodule Greetings do
  @spec hello :: String.t()
  def hello do
    "Hello, world"
  end

  @spec say_hello :: :ok
  def say_hello do
    IO.puts(hello())
  end
end
```

We have created a new function again with `def`. This time we've added a type spec of `String.t()` in the definition. This means this function returns a `string`.

Now create a new file called `hello_test.exs` where we are going to write a test for our `hello/0` function using ExUnit

```elixir
defmodule GreetingsTest do
  use ExUnit.Case

  test "say hello world" do
    assert Greetings.hello() == "Hello, world"
  end
end
```

Run `mix test` in your terminal. It should've passed! Just to check, try deliberately breaking the test by changing the `"Hello, world"` string.

Notice the file extensions `.exs` which `hello_test.exs` uses and the `.ex` our `hello.ex` file uses. Files that end in `.ex` are compiled while those that end in `.exs` run as scripts without the need to be compiled.

Notice how you have not had to pick between multiple testing frameworks and then figure out how to install. ExUnit is included as part of the Elixir standard library, which means that you don't have to install any additional packages or dependencies to use it.

### ExUnit

- ExUnit is a powerful unit testing framework for the Elixir programming language that enables developers to define and run automated tests to verify the correctness and reliability of their code. It provides a simple and flexible syntax for defining test functions that check specific behaviors or features of the code being tested, as well as a variety of assertion functions and utilities to facilitate the testing process.

### Writing tests

Writing a test is just like writing a function, with a few rules

- It needs to be in a file with a name like `xxx_test.exs`
- The test module must end with the word `Test`(ex. GreetingsTest)
- The test function must start with the word `test`
- `ExUnit.Case` needs to be imported and callbacks invoked using the keyword `use`

#### `ExUnit.Case`

- `ExUnit.Case` is a module for defining test cases. It provides various functions for defining and running tests, as well as for setting up and tearing down test fixtures. When a module uses the `ExUnit.Case` macro, ExUnit will treat the module as a container for test functions and make the test functions defined inside it available to the testing framework.

- In Elixir, a `case` is a control structure that allows you to match the value of an expression against a series of patterns, and execute different code depending on which pattern matches. The `ExUnit.Case` module is named after this control structure because it is used to define a series of test cases that can be run to verify that your code is working as expected.

#### macros

A macro in Elixir can be thought of as a special kind of function that operates at compile time, rather than at runtime. However, instead of returning a value, a macro generates code that is then inserted into the program at the point where the macro is called.

#### `test`

The `test` macro, which is defined in the ExUnit.Case module, defines a test function. A `test` function must be defined inside a module that uses the ExUnit.Case macro. It takes a string describing the test as an argument.

#### `assert`

The assert function is used to make assertions about the expected behavior of your code. When you write a test case, you typically specify the input to your code, the expected output, and any other conditions that should be met. The assert function allows you to check that the actual output of your code matches the expected output and that the other conditions are met.

### Hello, YOU

Now that we have a test we can iterate on our software safely.

In the last example we wrote the test _after_ the code had been written just so you could get an example of how to write a test and declare a function. From this point on we will be _writing tests first_.

Our next requirement is to let us specify the recipient of the greeting.

Let's start by capturing these requirements in a test. This is basic test driven development and allows us to make sure our test is _actually_ testing what we want. When you retrospectively write tests there is the risk that your test may continue to pass even if the code doesn't work as intended.

```elixir
defmodule GreetingsTest do
  use ExUnit.Case

  test "saying hello to people" do
    assert Greetings.hello("Chris") == "Hello, Chris"
  end
end
```

Now run `mix test`, ExUnit's test runner should give you an error

```text
  1) test hello (GreetingsTest)
     test/delete_test.exs:4
     ** (UndefinedFunctionError) function Greetings.hello/1 is undefined or private. Did you mean:

           * hello/0

     code: assert Greetings.hello("Chris") == "Hello, Chris"
     stacktrace:
       (delete 0.1.0) Greetings.hello("Chris")
       test/delete_test.exs:5: (test)
```

When a test fails, the ExUnit Test Runner will provide an error message that describes the problem and a stack trace, which shows the sequence of function calls that led to the error.

It is important to listen to the ExUnit Test Runner when running into errors because it provides valuable information about what went wrong with the tests and how to fix the issue.

Here, the test runner is telling you to change the function `hello/0` to accept an argument of one.

Edit the `hello/0` function to accept an argument of one.

Edit the type spec to reflect this. Since we know `name` will be a string, we'll add String.() to `hello/1`'s argument field

```elixir
@spec hello(String.t()) :: String.t()
def hello(name) do
  "Hello, world"
end
```

If you try and run your program again your `hello.ex` will fail to compile because you're not passing in an argument to the `say_hello/0` function.

It is still important to listen to the compiler in a dynamically typed language like Elixir. While Elixir does not require explicit type declarations, the compiler still performs various checks and optimizations on the code. Listening to it can help catch errors and improve the performance of your code.

Send in "world" to make `hello.ex` compile.

```elixir
@spec say_hello :: :ok
def say_hello do
  IO.puts(hello("world"))
end
```

Now when you run your tests you should see something like

```text
  1) test hello (GreetingsTest)
     test/hola_test.exs:4
     Assertion with == failed
     code:  assert Greetings.hello("Chris") == "Hello, Chris"
     left:  "Hello, world"
     right: "Hello, Chris"
     stacktrace:
       test/hola_test.exs:5: (test)
```

The `right:` represent want we are trying to assert, while `left:` represents the actual value returned by the function call.

Let's make the test pass by using the name argument and concatenate it with `"Hello, "`

```elixir
@spec hello(String.t()) :: String.t()
def hello(name) do
  "Hello, " <> name
end
```

When you run the tests they should now pass. Normally as part of the TDD cycle we should now _refactor_.

### A note on source control

At this point, if you are using source control (which you should!) I would
`commit` the code as it is. We have working software backed by a test.

I _wouldn't_ push to master though, because I plan to refactor next. It is nice
to commit at this point in case you somehow get into a mess with refactoring - you can always go back to the working version.

There's not a lot to refactor here, but we can introduce another language feature, _module attributes_.

### Module Attributes

Module attributes are variables that are associated with a specific module and can be accessed from anywhere within that module. They are defined using the "@" symbol, followed by the attribute name and value.

Module attributes are defined like so

```elixir
@english_hello_prefix "Hello, "
```

We can now refactor our code

```elixir
@english_hello_prefix "Hello, "

@spec hello(String.t()) :: String.t()
def hello(name) do
  @english_hello_prefix <> name
end

```

After refactoring, re-run your tests to make sure you haven't broken anything.

Module Attributes should improve performance of your application as it saves you creating the `"Hello, "` string instance every time `hello/1` is called.

To be clear, the performance boost is incredibly negligible for this example! But it's worth thinking about creating module attributes to capture the meaning of values and sometimes to aid performance.

## Hello, world... again

The next requirement is when our function is called with an empty string it defaults to printing "Hello, world", rather than "Hello, ".

Start by writing a new failing test

```elixir
describe "hello/1" do
  test "saying hello to people'" do
    assert Greetings.hello("Chris") == "Hello, Chris"
  end

  test "empty string defaults to 'world'" do
    assert Greetings.hello("") == "Hello, World"
  end
end
```

Here we are introducing another tool in our testing arsenal, the `describe` macro.

The `describe`, macro is used to define a test case in the ExUnit testing framework. It allows you to group related tests together and give them a descriptive name

Now that we have a well-written failing test, let's fix the code, using pattern matching.

```elixir
@english_hello_prefix "Hello, "

@spec hello(String.t()) :: String.t()
def hello(name) do
  @english_hello_prefix <> name_with_default(name)
end

@spec name_with_default(String.t()) :: String.t()
defp name_with_default(""), do: "World"
defp name_with_default(name), do: name
```

If we run our tests we should see it satisfies the new requirement and we haven't accidentally broken the other functionality.

#### Patttern Matching

In Elixir, pattern matching is a feature that allows you to specify patterns that data should conform to, and then check if the data matches those patterns. It can be used to analyze input and determine the behavior of a function based on the form of the input.

The `name_with_default/1` function is defined using two separate clauses, each with its own pattern in the function head. The first clause has an empty string pattern, and the second clause has a variable pattern.

When the `name_with_default/1` function up above is called, Elixir will attempt to match the argument passed to it against the patterns in the function head of each clause. If the argument is an empty string, the first clause will be selected and the body of that clause will be executed, returning the string `"world"`. If the argument is any other value, the second clause will be selected and the body of that clause will be executed, returning the value of the `name` argument.

#### Private Functions

The `defp` keyword is how you define a private function with a name and a body. They are functions that are defined and only visible within a module. They also help to reduce the complexity of the module's public API by hiding implementation details that are not relevant to external code.

### Back to source control

Now we are happy with the code I would amend the previous commit so we only
check in the lovely version of our code with its test.

### Discipline

Let's go over the cycle again

- Write a test
- Run the test, see that it fails and check the error message is meaningful
- Write enough code to make the test pass
- Refactor

On the face of it this may seem tedious but sticking to the feedback loop is important.

Not only does it ensure that you have _relevant tests_, it helps ensure _you design good software_ by refactoring with the safety of tests.

Seeing the test fail is an important check because it also lets you see what the error message looks like. As a developer it can be very hard to work with a codebase when failing tests do not give a clear idea as to what the problem is.

By ensuring your tests are _fast_ and setting up your tools so that running tests is simple you can get in to a state of flow when writing your code.

By not writing tests you are committing to manually checking your code by running your software which breaks your state of flow and you won't be saving yourself any time, especially in the long run.

## Keep going! More requirements

Goodness me, we have more requirements. We now need to support a second parameter, specifying the language of the greeting. If a language is passed in that we do not recognise, just default to English.

We should be confident that we can use TDD to flesh out this functionality easily!

Write a test for a user passing in Spanish. Add it to the existing suite.

# FLAG: Version that adds Spanish

```elixir
describe "hello/2" do
  test "saying hello in Spanish" do
    assert Greetings.hello("Elodie", :spanish) == "Hola, Elodie"
  end
end
```

Remember not to cheat! _Test first_. When you try and run the test, the test runner _should_ complain because you are calling `hello/1` with two arguments rather than one.

```text
  1) test hello/2 saying hello in Spanish (GreetingsTest)
     test/delete_test.exs:3
     ** (UndefinedFunctionError) function Greetings.hello/2 is undefined or private. Did you mean:

           * hello/1

     code: assert Greetings.hello("Elodie", :spanish) == "Hola, Elodie"
     stacktrace:
       (delete 0.1.0) Greetings.hello("Elodie", :spanish)
       test/delete_test.exs:4: (test)
```

Fix the test error by adding another string argument to `hello/1` and thus making it `hello/2`

```elixir

@spec hello(String.t(), String.t()) :: String.t()
def hello(name, language) do
  @english_hello_prefix <> name_with_default(name)
end

@spec name_with_default(String.t()) :: String.t()
defp name_with_default(""), do: "World"
defp name_with_default(name), do: name
```

When you try and run the test again it will complain about not passing through enough arguments to `hello/2` in your other tests and in `hello.exs`

```text
  1) test hello (GreetingsTest)
     test/delete_test.exs:4
     ** (UndefinedFunctionError) function Greetings.hello/1 is undefined or private. Did you mean:

           * hello/2

     code: assert Greetings.hello("Elodie") == "Hello, Elodie"
     stacktrace:
       (delete 0.1.0) Greetings.hello("Elodie")
       test/delete_test.exs:5: (test)
```

Fix them by passing through empty strings. Now all your tests should pass, apart from our new scenario
#FLAG: Make sure .exs:the the correct line in example code

```text
  1) test hello (GreetingsTest)
     test/delete_test.exs:4
     Assertion with == failed
     code:  assert Greetings.hello("", "") == "Hola, Elodie"
     left:  "Hello, world"
     right: "Hola, Elodie"
     stacktrace:
       test/delete_test.exs:5: (test)
```

We can use pattern matching here to check the language is equal to :spanish and if so change the message

```elixir

@english_hello_prefix "Hello, "

@spec hello(String.t(), String.t()) :: String.t()
def hello(name, language) do
  language_prefix(language) <> name_with_default(name)
end

@spec name_with_default(String.t()) :: String.t()
defp name_with_default(""), do: "World"
defp name_with_default(name), do: name

@spec language_prefix(String.t()) :: String.t()
defp language_prefix(:spanish), do: "Hola, "
defp language_prefix(""), do: @english_hello_prefix
```

The tests should now pass.

Now it is time to _refactor_. You should see some problems in the code, "magic" strings, some of which are repeated. Try and refactor it yourself, with every change make sure you re-run the tests to make sure your refactoring isn't breaking anything.

```elixir

@english_hello_prefix "Hello, "
@spanish_hello_prefix "Hola, "

@spec hello(String.t(), String.t()) :: String.t()
def hello(name, language) do
  language_prefix(language) <> name_with_default(name)
end

@spec name_with_default(String.t()) :: String.t()
defp name_with_default(""), do: "World"
defp name_with_default(name), do: name

@spec language_prefix(String.t()) :: String.t()
defp language_prefix(:spanish), do: @spanish_hello_prefix
defp language_prefix(""), do: @english_hello_prefix
```

### French

- Write a test asserting that if you pass in `:french` you get `"Bonjour, "`
- See it fail, check the error message is easy to read
- Do the smallest reasonable change in the code

You may have written something that looks roughly like this

```elixir

@english_hello_prefix "Hello, "
@spanish_hello_prefix "Hola, "
@french_hello_prefix "Bonjour, "

@spec hello(String.t(), String.t()) :: String.t()
def hello(name, language) do
    language_prefix(language) <> name_with_default(name)
end

@spec name_with_default(String.t()) :: String.t()
defp name_with_default(""), do: "World"
defp name_with_default(name), do: name

@spec language_prefix(String.t()) :: String.t()
defp language_prefix(:spanish), do: @spanish_hello_prefix
defp language_prefix(:french), do: @french_hello_prefix
defp language_prefix(""), do: @english_hello_prefix
```

## `case`

When you have lots of statements checking a particular value it is common to use a `case` statement instead. We can use `case` to refactor the code to make it easier to read and more extensible if we wish to add more language support later

- The case statement in Elixir is similar to the switch statement in other languages except that it can match against any expression, not just simple values like integers or strings.
- You can use the case statement to match against complex data structures, such as lists or maps, using pattern matching.
- In other languages, the switch statement will continue to execute the next case clause if you do not include a break statement, whereas in Elixir, the case statement will stop executing as soon as it finds a matching clause.

```elixir
@english_hello_prefix "Hello, "
@spanish_hello_prefix "Hola, "
@french_hello_prefix "Bonjour, "

@spec hello(String.t(), String.t()) :: String.t()
def hello(name, language) do

    prefix =
        case language do
            :spanish -> @spanish_hello_prefix
            "french" -> @french_hello_prefix
            _ -> @english_hello_prefix
        end

    prefix <> name_with_default(name)
end

@spec name_with_default(String.t()) :: String.t()
defp name_with_default(""), do: "World"
defp name_with_default(name), do: name
```

Write a test to now include a greeting in the language of your choice and you should see how simple it is to extend our _amazing_ function.

### one...last...refactor?

You could argue that maybe our function is getting a little big. The simplest refactor for this would be to extract out some functionality into another function.

```elixir
@english_hello_prefix "Hello, "
@spanish_hello_prefix "Hola, "
@french_hello_prefix "Bonjour, "

@spec hello(String.t(), String.t()) :: String.t()
def hello(name, language) do
    greeting_prefix(language) <> name_with_default(name)
end

@spec name_with_default(String.t()) :: String.t()
defp name_with_default(""), do: "World"
defp name_with_default(name), do: name

@spec greeting_prefix(String.t()) :: String.t(0)
defp greeting_prefix(language) do
    case language do
      :spanish -> @spanish_hello_prefix
      "french" -> @french_hello_prefix
      _ -> @english_hello_prefix
    end
end
```

A few new concepts:

- Functions in Elixir are first-class citizens. We can bind functions to variables, store them in other data types, pass them as arguments to other functions; such as we did with `prefix`.
  - Functions are just data as far as our programs are concerned. We can work with them like we would work with any data structure.
- The `_ ` symbol is used as a catch-all pattern in a `case` statement. In our code it is used as the final arm of the case statement, and it matches any value that is not matched by the previous arms.
- The `defp` keyword is used to define a private function. They are accessible and only visible internally within a module. They help to reduce the complexity of the module's public API by hiding implementation details that are not relevant to external code.

## Wrapping up

Who knew you could get so much out of `Hello, world`?

By now you should have some understanding of:

### Some of Elixir's syntax around

- Writing tests
- Declaring functions, with arguments and return types
- pattern matching and `case`
- Declaring variables and module attributes

### The TDD process and _why_ the steps are important

- _Write a failing test and see it fail_ so we know we have written a _relevant_ test for our requirements and seen that it produces an _easy to understand description of the failure_
- Writing the smallest amount of code to make it pass so we know we have working software
- _Then_ refactor, backed with the safety of our tests to ensure we have well-crafted code that is easy to work with

In our case we've gone from `hello()` to `hello("name")`, to `hello("name", :french)` in small, easy to understand steps.

This is of course trivial compared to "real world" software but the principles still stand. TDD is a skill that needs practice to develop, but by breaking problems down into smaller components that you can test, you will have a much easier time writing software.
