import fetch from 'node-fetch';

const apiUrl = 'http://ctrl067.dyndns.org:3009/getuserdata';

fetch(apiUrl)
  .then(response => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json();
  })
  .then(data => {
    console.log('Data from backend:', data);
  })
  .catch(error => {
    console.error('Error:', error);
  });

  