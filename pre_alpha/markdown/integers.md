# Integers and Mix

**[You can find all the code for this chapter here](https://github.com/quii/learn-go-with-tests/tree/main/integers)**

<!-- Flag: Introducing Mix, the folder structure,  -->

## Inroducing mix

- Run `mix new integers` to create a new elixir app named integers.

Mix is a build tool that ships with Elixir that automates tasks for creating, compiling, and testing your application.

Your project should have the following file and folder structure.

```text
integers/
  lib/
    integers.ex
  test/
    integers_test.exs
    test_helper.exs
  .formatter.exs
  .gitignore
  mix.exs
  README.md
```

### The `lib` Folder

The lib/ folder contains the files for the project. We start with a single module named after the project. You should have a HelloWorld module in the lib/integers.ex file.

### The `test` Folder

Mix will have generated a predefined example test file `test/integers_test.exs`

In Elixir, the mix `test` command is used to run the tests that are defined in your project. When you run mix `test`, Mix will automatically search for and run any files that match the pattern test/\*\_test.exs.

Notice how `ExUnit.start()` is not incloduded. If you look under `test/test_helpers.exs`, you will find it it there. The `test_helpers.exs` file is a special file that is run before any of the test files in the test directory. It is used to define common code that is used by multiple test files.

### Let's get started

Talk about the `integers.ex`
-Introduce moduledoc, function docs with parameters - talk about examples later?

Integers work as you would expect in Elixir. Let's take a look inside `integers_test.ex`. Let's delete pre-included test and write our ow, Let's write an `add` function to try things out

```elixir
defmodule IntegersTest do
  use ExUnit.Case
  doctest Integers

  test "greets the world" do
    assert Integers.adder(2,2) == 4
  end
end
```

<!-- Flag: @moduledoc, @doc. Introduce doctest, printing them to the console now or later?  -->

Elixir treats documentation as a first-class citizen. This means documentation should be easy to write and easy to read.

We use @moduledoc and @doc to document our code. The @moduledoc attribute is used to add documentation to the module. @doc is used before a function to provide documentation for it.

In documentation is a contract with users of your API, who may not necessarily have access to the source code; whereas code comments are for those who interact directly with the source. You can learn and express different guarantees about your software by separating those two concepts.

```elixir
defmodule IntegersTest do
  use ExUnit.Case
  doctest Integers

  test "greets the world" do
    assert Integers.add(2,2) == 4
  end
end

```

## Try and run the test

Run the test `mix test`

Inspect the test error

\*\* (UndefinedFunctionError) function Integers.add/2 is undefined or private

## Write the minimal amount of code for the test to run and check the failing test output

Write enough code to satisfy the test runner _and that's all_ - remember we want to check that our tests fail for the correct reason.

```elixir
@spec add(integer, integer) :: integer
def add(x, y) do
    4
end
```

Now run the tests and we should be happy that the test is correctly reporting what is wrong.

```text
  1) test greets the world (IntegersTest)
     test/integers_test.exs:5
     Assertion with == failed
     code:  assert Integers.add(2, 2) == 4
     left:  0
     right: 4
     stacktrace:
       test/integers_test.exs:6: (test)
```

## Write enough code to make it pass

In the strictest sense of TDD we should now write the _minimal amount of code to make the test pass_. A pedantic programmer may do this

```elixir
@spec add(integer, integer) :: integer
def add(x, y) do
    4
end
```

Ah hah! Foiled again, TDD is a sham right?

We could write another test, with some different numbers to force that test to fail but that feels like [a game of cat and mouse](https://en.m.wikipedia.org/wiki/Cat_and_mouse).

Once we're more familiar with Go's syntax I will introduce a technique called _"Property Based Testing"_, which would stop annoying developers and help you find bugs.

For now, let's fix it properly

```elixir
@spec add(integer, integer) :: integer
def add(x, y) do
    x + y
end
```

If you re-run the tests they should pass.

## Refactor

It is preferable that a user can understand the usage of your code by just looking at the type signature and documentation.

You can add documentation to functions with comments, and these will appear in Go Doc just like when you look at the standard library's documentation.

```go
// Add takes two integers and returns the sum of them.
func Add(x, y int) int {
	return x + y
}
```

<!-- Flag: DocTest Examples -->

### Examples

If you really want to go the extra mile you can make [examples](https://blog.golang.org/examples). You will find a lot of examples in the documentation of the standard library.

Often code examples that can be found outside the codebase, such as a readme file often become out of date and incorrect compared to the actual code because they don't get checked.

Go examples are executed just like tests so you can be confident examples reflect what the code actually does.

Examples are compiled \(and optionally executed\) as part of a package's test suite.

As with typical tests, examples are functions that reside in a package's `_test.go` files. Add the following `ExampleAdd` function to the `adder_test.go` file.

```go
func ExampleAdd() {
	sum := Add(1, 5)
	fmt.Println(sum)
	// Output: 6
}
```

```bash

```

#Flag: ExDoc introduction

- Running docs locaaly, outputting to sdout
- By adding this code the example will appear in the documentation inside `godoc`, making your code even more accessible.

## Wrapping up

What we have covered:

- More practice of the TDD workflow
- Integers, addition
- Writing better documentation so users of our code can understand its usage quickly
- Examples of how to use our code, which are checked as part of our tests