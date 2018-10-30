const httpInterface = {
  getData(url) {
    return fetch(url)
      .then(response => response.json())
  },
  postData(url, method, payload={}) {
    return fetch(url, {
      method: method || "POST",
      mode: "same-origin",
      cache: "no-cache", // *default, no-cache, reload, force-cache, only-if-cached
      credentials: "same-origin", // include, same-origin, *omit
      headers: {
          "Content-Type": "application/json; charset=utf-8",
          // "Content-Type": "application/x-www-form-urlencoded",
      },
      body: JSON.stringify(payload),
    })
  }
};

export default httpInterface;