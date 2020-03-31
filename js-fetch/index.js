// add an event handler to the moon image to display an alert message when clicked
// make a get request to the NASA astronomy photo endpoint and display the image in the DOM

document.addEventListener("DOMContentLoaded", function() {
    console.log("dom has loaded");
    // If we try to write the below code (10-13) outside of the DOMContentLoaded
    // event listener callback function, when we load the page in the browser we will
    // see a ReferenceError in the console telling us we can't call "addEventListener"
    // on "null". This is because the moon image does not exist until after it is
    // loaded (that seems reasonable, right?). By waiting until the DOM is loaded
    // to target the moon image, we can be sure it will actually exist when we add
    // an event listener to it.
    let moon = document.getElementById("moon");
    // debugger;
    moon.addEventListener("click", function() {
        alert("You clicked the moon");
    });
});
// debugger;

// make an http request to a NASA endpoint that returns an astronomy photo
fetch("https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY") // "fetch" returns a Promise object
.then(resp => { // parameter "resp" holds a javascript Response object
    // debugger;
    return resp.json(); // don't forget: you need to use an explicit return in a JS function
})
.then(data => { // parameter "data" holds the javascript object (JSON) with NASA's data
    // debugger;
    console.log(data);
    addImage(data.hdurl); 
}); 

function addImage(url) {
    // debugger;
    let img = document.createElement("img");
    img.src = url;
    document.body.appendChild(img);
}

// Test yourself on what order the code executes in by uncommenting the debuggers,
// refreshing, and observing in what order the browser's JS engine triggers them