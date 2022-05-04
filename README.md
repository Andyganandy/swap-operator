# swap-operator
Vim plugin that maps an operator for changing the motion target into what you have in your unnamed ("") register without messing up your clipboards.

_Usage_: \
Creates a new operator "cr{motion}" that replaces {motion} with the contents of your unnamed register without changing the state of any of your registers/clipboards.



_Example_:

You yank the following text:
```Text
Foo
```

You have the following line of text, with the cursor on the second word:

```Text
Scooby Doo where are you?
```

You execute the vim normal-command:
```vim
criw
```

The text will now say:
```Text
Scooby Foo where are you?
```

And all your registers/clipboards will be the same. 
