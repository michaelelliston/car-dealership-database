select dealerships.name, vehicles.color, vehicles.make, vehicles.model, vehicles.VIN
from dealerships join inventory on dealerships.dealershipID = inventory.dealershipID
join vehicles on inventory.VIN = vehicles.VIN
where vehicles.make = 'Ford';