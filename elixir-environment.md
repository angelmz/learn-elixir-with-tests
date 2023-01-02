# Install Elixir and set up it's enviromnet.

The official installation instructions for Elixir are available [here](https://elixir-lang.org/install.html).

### [ExUnit](https://hexdocs.pm/ex_unit/ExUnit.html)

ExUnit is a powerful unit testing framework for the Elixir programming language that enables developers to define and run automated tests to verify the correctness and reliability of their code. It provides a simple and flexible syntax for defining test functions that check specific behaviors or features of the code being tested, as well as a variety of assertion functions and utilities to facilitate the testing process. ExUnit is included as part of the Elixir standard library, which means that you don't have to install any additional packages or dependencies to use it.

### [Mix](https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html)

Mix is a build tool that is used for creating and managing Elixir projects. It provides a number of tasks that you can use to create, test, compile, and run your Elixir code. Mix ships with Elixir

### [Types and specs](https://elixir-lang.org/getting-started/typespecs-and-behaviours.html#types-and-specs)

Elixir is a dynamically typed language, so all types in Elixir are checked at runtime. Nonetheless, Elixir comes with typespecs, which are a notation used for declaring typed function signatures (also called specifications) and declaring custom types.

- Typespecs are useful for code clarity and static code analysis (for example, the Dialyxir tool).

- Function specs are written with the `@spec` attribute, typically placed immediately before the function definition.

### [Dialyxir](https://github.com/jeremyjh/dialyxir) vs [ElixirLS](https://marketplace.visualstudio.com/items?itemName=JakeBecker.elixir-ls) linting

ElixirLS is a Language Server Protocol (LSP) implementation for Elixir that provides various language features such as code completion, go-to-definition, and linting. Dialyxir is a static code analysis tool for Elixir that can be used to check for issues such as code style violations, potential runtime errors, and other programming issues.

Both ElixirLS and Dialyxir can be used for linting Elixir code, but they operate in different ways. ElixirLS provides real-time linting as you edit your code in an editor, while Dialyxir is a command-line tool that can be run as part of the build process to perform static analysis on the entire codebase.

ElixirLS is typically used to provide linting and other language features in an editor, while Dialyxir is more geared towards checking the overall quality and consistency of the codebase. You can use both tools together, or choose one depending on your specific needs and workflow.

- To install ElixirLS open the Extensions tab in Visual Studio Code (Ctrl+Shift+X), search for ["ElixirLS"](https://marketplace.visualstudio.com/items?itemName=JakeBecker.elixir-ls), click "Install" on the extension page.
- To install dialyxir, add the Dialyxir [package](https://github.com/jeremyjh/dialyxir) as a dependency in your project's mix.exs file.

## Refactoring and your tooling

A big emphasis of this book is the importance of refactoring.

Your tools can help you do bigger refactoring with confidence.

You should be familiar enough with your editor to perform the following with a simple key combination:

- **Extract/Inline variable**. Being able to take magic values and give them a name lets you simplify your code quickly.
- **Extract method/function**. It is vital to be able to take a section of code and extract functions/methods
- **Rename**. You should be able to confidently rename symbols across files.
- **Code formatter**. Your editor should be running this on every file save.
- **Run tests**. You should be able to do any of the above and then quickly re-run your tests to ensure your refactoring hasn't broken anything.

In addition, to help you work with your code you should be able to:

- **View function signature**. You should never be unsure how to call a function in Elixir. Your IDE should describe a function in terms of its documentation, its parameters and what it returns.
- **View function definition**. If it's still not clear what a function does, you should be able to jump to the source code and try and figure it out yourself.
- **Find usages of a symbol**. Being able to see the context of a function being called can help your decision process when refactoring.

Mastering your tools will help you concentrate on the code and reduce context switching.

## Wrapping up

At this point you should have Elixir installed, an editor available and some basic tooling in place. Elixir has a very large ecosystem of third party products. We have identified a few useful components here. For a more complete list, see [https://github.com/h4cc/awesome-elixir](https://github.com/h4cc/awesome-elixir).
