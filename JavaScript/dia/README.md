[![Build Status](https://travis-ci.org/eozelius/dia.svg?branch=master)](https://travis-ci.org/eozelius/dia)

## Dia & Co News API Technical test
Welcome, this is my solution to the Dia & Co technical assessment.  

## Folder Structure

After creation, your project should look like this:

```
dia/
  README.md
  node_modules/
  package.json
  public/
    index.html
    favicon.ico
  src/
    components/
      App.js
      Articles.js
      Search.js
      Sources.js
    images/
    styles/
      App.css
    test/
      __mocks__/
        articles.json
        sources.json
      Api.test.js
      App.test.js
      Articles.test.js
      Sources.test.js
      Search.test.js
    Api.js  
    index.js
    setupTest.js
    registerService worker
  .git
  .gitignore
  .yarn.lock
  .package-lock.json
```

### Getting started
This project was initialized using [create-react-app](https://github.com/facebook/create-react-app), and all the associated commands are valid.

### Dependencies
- Node v8.10.0
- create-react-app v1.5.2
- react v16.3.1
- jest v22.4.3
- enzyme v3.3.0


### NewsApi.org Api Key
It is recommended to keep your NewsAPI key in an environment variable, and sZ however in the interest of simplicity, my personal API key has been hard-coded into src/Api.js.<br>
I will generate a new token and remove the references in the code once this test has been viewed.

### `npm start` or `yarn start`

Runs the app in the development mode.<br>
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.<br>
You will also see any lint errors in the console.

### `npm test` or `yarn test`

Launches the test runner in the interactive watch mode.<br>

- to run tests with coverage stats, run `$ yarn test --coverage`

### Travis CI
This project is continuously integrated with travis CI
