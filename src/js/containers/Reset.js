import { h } from 'react-hyperscript-helpers';
import Button from 'components/Button';

import ports from 'ports';


const Reset = (props) =>
  h(Button, {
    ...props,
    onClick: () =>
      props.ports.dispatchCounterDefault.send([]),
  },
  'Reset');

Reset.defaultProps = { ports };

export default Reset;
