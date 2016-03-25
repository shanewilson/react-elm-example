import React from 'react';
import { div, h } from 'react-hyperscript-helpers';

import ports from 'ports';

import Increment from 'containers/Increment';
import Decrement from 'containers/Decrement';
import Reset from 'containers/Reset';

import Counter from 'components/Counter';


export default class App extends React.Component {

  constructor() {
    super();
    this.state = {
      modules: {
        counter: {
          count: 0,
          operation: 'Default',
        },
      },
    };
  }

  componentWillMount() {
    ports.modelEvents.subscribe(val => {
      this.setState(val);
    });
    // ports.modelBoxEvents.subscribe(val => {
    //   console.log('blurp: ', val);
    // });
  }

  render() {
    return div({
      children: [
        h(Increment),
        h(Decrement),
        h(Reset),
        h(Counter, { ...this.state.modules.counter }),
      ],
    });
  }
}
