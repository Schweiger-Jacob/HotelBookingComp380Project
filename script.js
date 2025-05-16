document.addEventListener('DOMContentLoaded', () => {
  const hotels = [
    {
      id: 1,
      name: "Hotel Sunshine",
      city: "Miami, USA",
      price: 350,
      description: "Near the beach, cozy rooms with a beautiful ocean view.",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8GpZ1hSLfYYcM-txTowyJ-nfUMfSRq5Nxcg&s"
    },
    {
      id: 2,
      name: "Mountain View Inn",
      city: "Denver, USA",
      price: 270,
      description: "Breathtaking mountain scenery and hiking trails.",
      image: "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?crop=entropy&cs=tinysrgb&fit=crop&h=300&w=500"
    },
    {
      id: 3,
      name: "City Lights Hotel",
      city: "Los Angeles, USA",
      price: 400,
      description: "Located in the heart of downtown with luxury amenities.",
      image: "https://images.unsplash.com/photo-1563298723-dcfebaa392e3?crop=entropy&cs=tinysrgb&fit=crop&h=300&w=500"
    }
  ];
  
  window.addEventListener("DOMContentLoaded", () => {
    const container = document.getElementById("hotel-cards");
  
    hotels.forEach(hotel => {
      const card = document.createElement("div");
      card.className = "hotel-card";
      card.setAttribute("data-name", hotel.name.toLowerCase());
      card.setAttribute("data-city", hotel.city.toLowerCase());
      card.setAttribute("data-price", hotel.price);
  
      card.innerHTML = `
        <img src="${hotel.image}" alt="${hotel.name}" style="width:100%; height:200px; object-fit:cover;">
        <div class="hotel-card-content" style="padding: 1rem;">
          <h3 class="hotel-name">${hotel.name}</h3>
          <p class="hotel-location">${hotel.city}</p>
          <p class="hotel-price">From $${hotel.price}/night</p>
          <p class="hotel-description">${hotel.description}</p>
          <button onclick="bookNow('${hotel.name}')">Book Now</button>
        </div>
      `;
  
      container.appendChild(card);
    });
  });
  document.addEventListener("DOMContentLoaded", function () {
    const searchButton = document.getElementById("search-button");
    const nameInput = document.getElementById("search-destination");
    const locationSelect = document.getElementById("search-location");
    const priceSelect = document.getElementById("search-price");
  
    searchButton.addEventListener("click", function () {
      const inputValue = nameInput.value.toLowerCase().trim();
      const selectedLocation = locationSelect.value.toLowerCase();
      const selectedPrice = priceSelect.value;
  
      const hotelCards = document.querySelectorAll(".hotel-card");
  
      hotelCards.forEach(card => {
        const name = card.getAttribute("data-name");
        const city = card.getAttribute("data-city");
        const price = parseInt(card.getAttribute("data-price"));
  
        const matchInput = !inputValue || name.includes(inputValue) || city.includes(inputValue);
        const matchLocation = !selectedLocation || city.includes(selectedLocation);
  
        let matchPrice = true;
        if (selectedPrice === "under300") {
          matchPrice = price < 300;
        } else if (selectedPrice === "300to500") {
          matchPrice = price >= 300 && price <= 500;
        } else if (selectedPrice === "above500") {
          matchPrice = price > 500;
        }
  
        if (matchInput && matchLocation && matchPrice) {
          card.style.display = "block";
        } else {
          card.style.display = "none";
        }
      });
    });
  });
  
  function bookNow(hotelName) {
    alert("Booking: " + hotelName); // Or redirect to reservation page
  }
  
  

  const hotelList = document.getElementById('hotel-list');
  const bookingFormSection = document.getElementById('booking-form');
  const confirmationSection = document.getElementById('confirmation');
  const confirmationText = document.getElementById('confirmation-text');
  const form = document.getElementById('search-form');

  let selectedHotel = null;

  function loadHotels() {
    hotels.forEach(hotel => {
      const hotelCard = document.createElement('div');
      hotelCard.className = 'hotel-card';
      hotelCard.innerHTML = `
        <img src="${hotel.image}" alt="${hotel.name}">
        <div class="hotel-card-content">
          <h3>${hotel.name}</h3>
          <p>${hotel.description}</p>
          <button onclick="bookHotel(${hotel.id})">Book Now</button>
        </div>
      `;
      hotelList.appendChild(hotelCard);
    });
  }

  window.bookHotel = function (hotelId) {
    selectedHotel = hotels.find(h => h.id === hotelId);
    hotelList.style.display = 'none';
    bookingFormSection.style.display = 'block';
  };

  form.addEventListener('submit', function (e) {
    e.preventDefault();
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const nights = document.getElementById('nights').value;
  
    // Show confirmation
    bookingFormSection.style.display = 'none';
    confirmationSection.style.display = 'block';
    confirmationText.innerText = `Dear ${name}, your booking for ${nights} night(s) at ${selectedHotel.name} has been confirmed. A confirmation has been sent to ${email}.`;
  
    
    fetch('http://ctrl067.dyndns.org:3009/getuserdata', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        name: name,
        email: email,
        hotel: selectedHotel.name,
        nights: nights
      })
    })
    .then(res => {
      if (res.ok) {
        console.log('Confirmation email sent!');
      } else {
        console.error('Failed to send confirmation email');
      }
    })
    .catch(err => {
      console.error('Email error:', err);
    });
  });

  window.goBack = function () {
    bookingFormSection.style.display = 'none';
    confirmationSection.style.display = 'none';
    hotelList.style.display = 'grid';
  };

  loadHotels();
});