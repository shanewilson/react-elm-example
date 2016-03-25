import Elm from 'elm/Main.elm';
const defaultStore =
  {
    dispatchCounterIncrement: [],
    dispatchCounterDecrement: [],
    dispatchCounterDefault: [],
    dispatchCounterSet: 0,
  };

export default Elm.worker(Elm.Main, defaultStore).ports;
