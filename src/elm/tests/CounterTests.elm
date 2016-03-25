module CounterTests where

import ElmTest exposing (..)

import Counter exposing (..)

all : Test
all =
    suite "Counter Test Suite"
        [
            test "increment" (assertEqual (increment model0) {count = 1, operation = toString Increment}),
            test "decrement" (assertEqual (decrement model0) {count = -1, operation = toString Decrement}),
            test "default" (assertEqual (default model0) {count = 0, operation = toString Default}),
            test "set" (assertEqual (set 5 model0) {count = 5, operation = "Set"})
        ]
