module Main where

import Task
import Http
import Json.Decode
import Debug
import Effects

import Counter
-- Elm app

type alias Model =
  {
    modules: {
      counter: Counter.Model
    }
  }
type Action =
  NoOp
  | Counter Counter.Action

-- Model
model0 : Model
model0 =
  {
    modules = {
      counter = Counter.model0,
    }
  }

-- Actions
port dispatchCounterIncrement : Signal ()
port dispatchCounterDecrement : Signal ()
port dispatchCounterDefault : Signal ()
port dispatchCounterSet : Signal Counter.Count


counters : Signal Action
counters =
    Signal.mergeMany
        [
            Signal.map (always (Counter Counter.Increment)) dispatchCounterIncrement,
            Signal.map (always (Counter Counter.Decrement)) dispatchCounterDecrement,
            Signal.map (always (Counter Counter.Default)) dispatchCounterDefault,
            Signal.map (\c -> Counter (Counter.Set c)) dispatchCounterSet
        ]


actions : Signal Action
actions =
    Signal.mergeMany
        [
            counters
        ]


-- Update
update : Action -> (Model, Effects.Effects Action) -> (Model, Effects.Effects Action)
update a (m, e) =
  case a of
    Counter a ->
      let
        { modules } = m
        counter = Counter.update a modules.counter
      in
        ({ m | modules = { modules | counter = counter } }, Effects.none)
    NoOp ->
      let
        { modules } = m
      in
        ({ m | modules = { modules | counter = {count = 55, operation = "NoOp"} } }, Effects.none)


model : Signal (Model, Effects.Effects Action)
model =
  Signal.foldp update (model0, Effects.none) actions


port modelEvents : Signal Model
port modelEvents = Signal.dropRepeats (Signal.map fst model)


get : Task.Task Http.Error String
get =
  Http.get (Json.Decode.string) "http://numbersapi.com/5/math"


safeGet : Task.Task x (String)
safeGet =
  get `Task.onError` (\err -> Task.succeed "")


port runner : Task.Task x String
port runner =
  safeGet
