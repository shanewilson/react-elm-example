module Tests where

import ElmTest exposing (..)

import String
import CounterTests

all : Test
all =
    suite "Elm Test Suite"
        [
            CounterTests.all
        ]
