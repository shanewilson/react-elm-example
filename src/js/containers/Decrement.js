import { h } from 'react-hyperscript-helpers';
import Button from 'components/Button';

import ports from 'ports';


const Decrement = (props) =>
  h(Button, {
    ...props,
    onClick: () =>
      props.ports.dispatchCounterDecrement.send([]),
  },
  'Minus');

Decrement.defaultProps = { ports };

export default Decrement;
