select vehicles.VIN, color, model, make, sold, inventory.dealershipID
from vehicles join inventory on vehicles.VIN = inventory.VIN
where dealershipID = 1;