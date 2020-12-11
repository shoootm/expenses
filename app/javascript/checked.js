function check() {
  const favorite = document.getElementById("favorite");

  favorite.setAttribute("data-load", "true");
  favorite.addEventListener("click", () => {
    const favoriteId = favorite.getAttribute("data-id");
    const XHR = new XMLHttpRequest();
    XHR.open("GET", `/expenses/${favoriteId}/checked`, true);
    XHR.responseType = "json";
    XHR.send();
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.expense;
      if (item.checked === true) {
        favorite.setAttribute("data-checked", "true");
      } else if (item.checked === false) {
        favorite.removeAttribute("data-checked");
      }
      const count = XHR.response.count;
      const XHRcount = new XMLHttpRequest();
      XHRcount.open("GET", `/expenses/${favoriteId}/favorite_counts/${count}`, true);
      XHRcount.send();
    };
  });
};


window.addEventListener('load', check);