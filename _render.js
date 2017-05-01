var page = require('webpage').create();
var fs = require('fs');
var system = require('system');
var args = system.args;

page.paperSize = {
  format: 'A3',
  margin: "1cm"
};


if (args.length === 1) {
  console.log('Try to pass some arguments when invoking this script!');
} else {
  console.log(args[1]);
}
var url = args[1];
page.open(url, function (status) {
  page.render(args[2]);
  phantom.exit();
});
