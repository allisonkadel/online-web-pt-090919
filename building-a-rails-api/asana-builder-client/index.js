// fetch('http://localhost:3000/asanas')
// .then(function(response) {
//     return response.json()
// })
// .then(function(data) {
//     data.forEach(function(asana) {
//         let p = document.createElement('p');
//         p.innerText += asana.name;
//         document.body.appendChild(p);
//     });
// })
// .catch(function(error) {
//     console.log(error);
// })

fetch('http://localhost:3000/asanas/466', {
    'method': 'post',
    'headers': {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
    },
    'body': JSON.stringify({
        id: 466,
        name: 'a new asana name'
    })
})
.then(function(resp) {
    return resp.json()
})
.then(function(asana) {
    console.log(asana)
})
.catch(function(error) {
    console.log(error);
});