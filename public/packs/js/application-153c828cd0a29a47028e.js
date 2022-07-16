/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/application.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/application.js":
/*!*********************************************!*\
  !*** ./app/javascript/packs/application.js ***!
  \*********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: /home/vishu/Personal/gamers_machine/app/javascript/packs/application.js: Unexpected token (50:36)\n\n  48 |\n  49 | $('#sidebarCollapse').on('click', function () {\n> 50 | $('#sidebar').toggleClass('active');\n     |                                     ^\n    at instantiate (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:72:32)\n    at constructor (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:359:12)\n    at Parser.raise (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:3339:19)\n    at Parser.unexpected (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:3377:16)\n    at Parser.parseExprAtom (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:13123:22)\n    at Parser.parseExprSubscripts (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:12648:23)\n    at Parser.parseUpdate (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:12627:21)\n    at Parser.parseMaybeUnary (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:12598:23)\n    at Parser.parseMaybeUnaryOrPrivate (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:12392:61)\n    at Parser.parseExprOps (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:12399:23)\n    at Parser.parseMaybeConditional (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:12369:23)\n    at Parser.parseMaybeAssign (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:12321:21)\n    at Parser.parseExpressionBase (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:12257:23)\n    at /home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:12251:39\n    at Parser.allowInAnd (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:14346:16)\n    at Parser.parseExpression (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:12251:17)\n    at Parser.parseStatementContent (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:14786:23)\n    at Parser.parseStatement (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:14643:17)\n    at Parser.parseBlockOrModuleBlockBody (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:15286:25)\n    at Parser.parseBlockBody (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:15277:10)\n    at Parser.parseBlock (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:15261:10)\n    at Parser.parseFunctionBody (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:13951:24)\n    at Parser.parseFunctionBodyAndFinish (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:13935:10)\n    at /home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:15436:12\n    at Parser.withSmartMixTopicForbiddingContext (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:14323:14)\n    at Parser.parseFunction (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:15435:10)\n    at Parser.parseFunctionOrFunctionSent (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:13280:17)\n    at Parser.parseExprAtom (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:13002:21)\n    at Parser.parseExprSubscripts (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:12648:23)\n    at Parser.parseUpdate (/home/vishu/Personal/gamers_machine/node_modules/@babel/parser/lib/index.js:12627:21)");

/***/ })

/******/ });
//# sourceMappingURL=application-153c828cd0a29a47028e.js.map