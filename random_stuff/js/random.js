// hit this endpoint and return the JSON payload.
// Once successful, parse the data

// -- -- -- Test endpoints -- -- -- //
// /posts
// /comments
// /albums
// /photos
// /todos
// /users

async function getData(url) {
  try {
    const response = await fetch(url);
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    const data = await response.json();
    return data;
  } catch (error) {
    throw new Error("Error with the request: " + error.message);
  }
}

function processData(data) {
  console.log("Processing data:");
  console.log(`Title: ${data.title}`);
}

const url = "https://jsonplaceholder.typicode.com/todos/1";
getData(url)
  .then((data) => {
    console.log("Data returned:", data);
    processData(data); // Pass the fetched data to the processing function
  })
  .catch((error) => {
    console.error("Error:", error);
  });
