import 'babel-polyfill';
import ReactDOM from 'react-dom';
import { h } from 'react-hyperscript-helpers';

import App from 'containers/App';

ReactDOM.render(
  h(App),
  document.getElementById('react-elm-example')
);
