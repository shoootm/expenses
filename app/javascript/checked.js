function check() {
  const tests = document.querySelectorAll(".test");
  tests.forEach(function (test) {
    if (test.getAttribute("data-load") != null) {
      return null;
    }
    test.setAttribute("data-load", "true");
    test.addEventListener("click", () => {
      const testId = test.getAttribute("data-id");
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/expenses/${testId}/checked`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;
        }
        //debugger
        const item = XHR.response.expense;
        if (item.checked === true) {
          test.setAttribute("data-checked", "true");
        } else if (item.checked === false) {
          test.removeAttribute("data-checked");
        }
      };
    });
  });

}
setInterval(check, 1000);