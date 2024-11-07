// hit this endpoint and return the JSON payload.
// Once successful, parse the data

// -- -- -- Test endpoints -- -- -- //
// /posts
// /comments
// /albums
// /photos
// /todos
// /users

const mainEndpoint = "https://jsonplaceholder.typicode.com/";

function get_data() {
  fetch(mainEndpoint + "todos/1")
    .then((response) => response.json())
    .then((json) => console.log(json));
}

console.log("Data returned: ");
get_data();
