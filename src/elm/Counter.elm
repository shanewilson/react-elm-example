module Counter where
-- Elm app


-- Types
type alias Count =
  Int
type alias Model =
  {
    operation: String,
    count: Count
  }
type Action =
  Increment
  | Decrement
  | Default
  | Set Count
  | NoOp


-- Model
model0 : Model
model0 =
  {
    operation = toString Default,
    count = 0
  }

actions : Signal.Mailbox Action
actions = Signal.mailbox NoOp

-- Update
update : Action -> Model -> Model
update a m =
  case a of
    Increment ->
      increment m
    Decrement ->
      decrement m
    Default ->
      default m
    Set number ->
      set number m
    NoOp ->
      m

increment : Model -> Model
increment m =
  { m | count = m.count + 1, operation = toString Increment }

decrement : Model -> Model
decrement m =
  { m | count = m.count - 1, operation = toString Decrement }

default : Model -> Model
default m =
  { m | count = 0, operation = toString Default }

set : Count -> Model -> Model
set number m  =
  { m | count = number, operation = "Set" }
