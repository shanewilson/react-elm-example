`Buzzwords: #elm #reactjs #webpack #es6 #babeljs #hyperscript #enzyme`

Goals
=

Trying to build an Elm application using React components for the view layer. Able to stay within the React ecosystem and take advantage of all the work they are doing and the cool new React components (like [draft.js](https://facebook.github.io/draft-js/)) while gaining the advantages of Elm everywhere else. Added bonus of not having to explain to your boss that you are changing to yet another JS framework.

Technologies
=

- [Elm](http://elm-lang.org/) - the best of functional programming in your browser
- [React](http://facebook.github.io/react/) - A Javascript Library For Building User Interfaces
- [React-Router](https://github.com/rackt/react-router) - A complete routing library for React.
- [Webpack](http://webpack.github.io/) - Module Bundler
- [Babel](https://babeljs.io/) - Babel will turn your ES6+ code into ES5 friendly code
- [Enzyme](http://airbnb.io/enzyme/) - makes it easier to assert, manipulate, and traverse your React Components.

Development
=

The development server is setup using Webpack

```
❯ npm start

> react-elm-example@0.0.1 start /Users/swilson/Documents/Development/js/react-elm-example
> NODE_ENV=development make server

⌛  Webpack bundling assets for the first time...
⚡  Server running at localhost:8080
   Proxying to API running at http://localhost:5000
Success! Compiled 1 modules.
Successfully generated /var/folders/r8/ysx65v5109qcg857_5sm60500000gp/T/116225-97216-jxzv2j.js
webpack built 9d06a86811439ddd0838 in 1911ms
Version: webpack 1.12.14
Time: 1911ms
    Asset     Size  Chunks             Chunk Names
bundle.js  3.88 MB       0  [emitted]  bundle
webpack: bundle is now VALID.
```

Tests
=

Unit tests are run using Karma.

```
❯ npm test

> react-elm-example@0.0.1 test
> make prepare

lint                           [OK]
cd src/elm/tests && elm-test TestRunner.elm
Successfully compiled TestRunner.elm
Running tests...
  2 suites run, containing 4 tests
  All tests passed
elm-test                       [OK]
TEST_ENV=single karma start karma.config.js
Success! Compiled 1 modules.
Successfully generated
Success! Compiled 1 modules.
Successfully generated
25 03 2016 15:30:02.316:INFO [karma]: Karma v0.13.22 server started at http://localhost:9876/
25 03 2016 15:30:02.324:INFO [launcher]: Starting browser PhantomJS
25 03 2016 15:30:02.835:INFO [PhantomJS 2.1.1 (Mac OS X 0.0.0)]: Connected on socket /#Y7Csf4vbjNoueI-zAAAA with id 86416930
PhantomJS 2.1.1 (Mac OS X 0.0.0): Executed 11 of 11 SUCCESS (0.017 secs / 0.01 secs)
test-once                      [OK]
prepare                        [OK]
```

Production
=

Webpack bundles all the assets in production mode

```
NODE_ENV=production npm run build
...
clean-dist                     [OK]
build                          [production]
Success! Compiled 1 modules.
Successfully generated
Hash: 9e2541bd1a87d3bc6151
Version: webpack 1.12.14
Time: 6283ms
                             Asset     Size  Chunks             Chunk Names
    bundle.9e2541bd1a87d3bc6151.js   154 kB       0  [emitted]  bundle
      libs.9e2541bd1a87d3bc6151.js   132 kB       1  [emitted]  libs
bundle.9e2541bd1a87d3bc6151.js.map  1.14 MB       0  [emitted]  bundle
  libs.9e2541bd1a87d3bc6151.js.map  1.55 MB       1  [emitted]  libs
   [0] multi bundle 28 bytes {0} [built]
   [0] multi libs 40 bytes {1} [built]
    + 448 hidden modules
build                          [OK]
```

Resources
=

- https://github.com/petehunt/webpack-howto
- https://github.com/rtfeldman/elm-webpack-loader
- http://tech.noredink.com/post/126978281075/walkthrough-introducing-elm-to-a-js-web-app
- https://github.com/justinwoo/elm-simple-ports-example
