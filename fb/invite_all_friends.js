
function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
  console.log('Taking a break...');
}

async function demo() {
var inputs = document.getElementsByClassName('uiButton _1sm');
  for(var i=0; i<inputs.length;i++) {
    await sleep(1000);
    inputs[i].click();
  }
}

javascript:demo();
