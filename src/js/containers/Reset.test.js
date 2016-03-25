import { shallow } from 'enzyme';
import { h } from 'react-hyperscript-helpers';

import Button from 'components/Button';
import Reset from './Reset';

describe('<Reset />', () => {
  it('should exist', () => {
    const wrapper = shallow(h(Reset));
    expect(wrapper.type()).to.equal(Button);
  });

  it('should handle onClick', () => {
    const ports = {
      dispatchCounterDefault: { send: sinon.spy() },
    };
    shallow(h(Reset, { ports })).simulate('click');
    expect(ports.dispatchCounterDefault.send.called).to.equal(true);
  });
});
