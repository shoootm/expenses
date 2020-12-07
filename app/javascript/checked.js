function check() {
  const test = document.getElementById("test");

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
      const item = XHR.response.expense;
      if (item.checked === true) {
        test.setAttribute("data-checked", "true");
      } else if (item.checked === false) {
        test.removeAttribute("data-checked");
      }
      const count = XHR.response.count;
      const XHRcount = new XMLHttpRequest();
      XHRcount.open("GET", `/expenses/${testId}/favorite_counts/${count}`, true);
      XHRcount.send();
    };
  });
};


window.addEventListener('load', check);