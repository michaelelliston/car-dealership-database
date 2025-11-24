select dealerships.name as VehicleLocation, inventory.VIN, vehicles.color, vehicles.model, vehicles.make
from dealerships join inventory on dealerships.dealershipID = inventory.dealershipID
join vehicles on inventory.VIN = vehicles.VIN
where inventory.VIN = 101