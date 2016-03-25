import { h } from 'react-hyperscript-helpers';
import Button from 'components/Button';

import ports from 'ports';


const Increment = (props) =>
  h(Button, {
    ...props,
    onClick: () =>
      props.ports.dispatchCounterIncrement.send([]),
  },
  'Plus');

Increment.defaultProps = { ports };

export default Increment;
