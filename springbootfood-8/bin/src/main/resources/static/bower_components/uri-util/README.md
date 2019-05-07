# uri-util [![Build Status](https://travis-ci.org/pasangsherpa/uri-util.svg?branch=master)](https://travis-ci.org/pasangsherpa/uri-util)

> URI Util module to work with URIs in browser and server

## Install

Download the [production version][min] or the [development version][max].

[min]: https://raw.githubusercontent.com/pasangsherpa/uri-util/master/dist/uri-util.min.js
[max]: https://raw.githubusercontent.com/pasangsherpa/uri-util/master/dist/uri-util.js

```sh
$ npm install --save uri-util
```

```sh
$ bower install --save uri-util
```


## Usage

```js
var URIUtil = require('uri-util');
var uri = 'https://github.com/search?q=uri-util&order=asc';

var q = URIUtil.getQueryValue(uri, 'q');
console.log(q); // 'uri-util'

var query = URIUtil.parse(uri);
console.log(query); // {'q': 'uri-util', order: 'asc'}

var qs = URIUtil.stringify({'q': 'uri-util', order: 'asc'});
console.log(qs); // '?q=uri-util&order=asc'

```

```js
<script type="text/javascript" src="https://raw.githubusercontent.com/pasangsherpa/uri-util/master/dist/uri-util.min.js"></script>
<script type="text/javascript"> 

	// https://github.com/search?q=uri-util&order=asc
	console.log(URIUtil.getQueryValueInLoc('q')); // 'uri-util' 

	var query = URIUtil.parse(location.search);
	console.log(query); // {'q': 'uri-util', order: 'asc'}
	
	var qs = URIUtil.stringify({'q': 'uri-util', order: 'asc'});
	console.log(qs); // '?q=uri-util&order=asc'

</script>
```
######Refer to test.js in test directory for more examples.

## API

### Methods

#### .parse(str)

Parse a uri or a query string into an object.

##### str

Type: `String`

the string to be parsed. it can either be a uri or a query string.

#### .stringify(obj)

Convert the given object into a query string.

##### obj

Type: `Object`

the object to be converted to a query string. 

#### .getQueryValue(str, key)

Get the value of the given query key from the given (uri or query) string. 

##### str

Type: `String`

either a uri or a query string.

##### key

Type: `String`

key of the query field.

#### .getQueryValueInLoc(key)

Get the value of the given query key from the browser uri. (works only on client-side)

##### key

Type: `String`

key of the query field.


## License

[MIT](http://opensource.org/licenses/MIT) © [Pasang Sherpa](https://github.com/pasangsherpa)
