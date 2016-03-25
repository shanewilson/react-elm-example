import { shallow } from 'enzyme';
import { h } from 'react-hyperscript-helpers';

import Button from 'components/Button';
import Increment from './Increment';

describe('<Increment />', () => {
  it('should exist', () => {
    const wrapper = shallow(h(Increment));
    expect(wrapper.type()).to.equal(Button);
  });

  it('should handle onClick', () => {
    const ports = {
      dispatchCounterIncrement: { send: sinon.spy() },
    };
    shallow(h(Increment, { ports })).simulate('click');
    expect(ports.dispatchCounterIncrement.send.called).to.equal(true);
  });
});
