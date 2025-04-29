

const hotels = [
  {
    id: 1,
    name: "Hotel Sunshine",
    description: "Near the beach, cozy rooms with a beautiful ocean view.",
    image: "https://images.unsplash.com/photo-1600488993291-7c1b95307b7a?crop=entropy&cs=tinysrgb&fit=crop&h=300&w=500"
  },
  {
    id: 2,
    name: "Mountain View Inn",
    description: "Breathtaking mountain scenery and hiking trails.",
    image: "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?crop=entropy&cs=tinysrgb&fit=crop&h=300&w=500"
  },
  {
    id: 3,
    name: "City Lights Hotel",
    description: "Located in the heart of downtown with luxury amenities.",
    image: "https://images.unsplash.com/photo-1563298723-dcfebaa392e3?crop=entropy&cs=tinysrgb&fit=crop&h=300&w=500"
  }
];


const hotelList = document.getElementById('hotel-list');
const bookingFormSection = document.getElementById('booking-form');
const confirmationSection = document.getElementById('confirmation');
const form = document.getElementById('form');
const confirmationText = document.getElementById('confirmation-text');

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


function bookHotel(hotelId) {
  selectedHotel = hotels.find(h => h.id === hotelId);
  hotelList.style.display = 'none';
  bookingFormSection.style.display = 'block';
}

form.addEventListener('submit', function(e) {
  e.preventDefault();
  const name = document.getElementById('name').value;
  const email = document.getElementById('email').value;
  const nights = document.getElementById('nights').value;

  bookingFormSection.style.display = 'none';
  confirmationSection.style.display = 'block';
  confirmationText.innerText = `Dear ${name}, your booking for ${nights} night(s) at ${selectedHotel.name} has been confirmed. A confirmation has been sent to ${email}.`;
});

function goBack() {
  bookingFormSection.style.display = 'none';
  confirmationSection.style.display = 'none';
  hotelList.style.display = 'grid';
}

loadHotels();
