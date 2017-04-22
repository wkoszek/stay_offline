var fs = require('fs');
var page = require('webpage').create();

page.paperSize = {
  format: 'A3',
  margin: "1cm"
};

var list = fs.read('list.json');
var listJson = JSON.parse(list)

function zeroPad(num, places) {
  var zero = places - num.toString().length + 1;
  return Array(+(zero > 0 && zero)).join("0") + num;
}
//zeroPad(5, 2); // "05"

for (var li in listJson) {
  raw_link = listJson[li];

  var prefix = raw_link
    .replace("https://www.nngroup.com/articles/", "")
    .replace("/","")

  filename = zeroPad(li, 3) + "-" + prefix + ".pdf";
  console.log(filename);

  page.open(filename, function(status) {
    console.log("Status: " + status);
    if(status === "success") {
      page.render('s.pdf');
    }
    phantom.exit();
  });
}

