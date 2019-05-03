# Rails DHL Clon

## Documentation

Clone this repo, then run:

```bash
bundle install
bin/rails db:setup
```

To sign in as:

- `admin` : email: vale@aa | password: aaaaaa
- `deposit` : email: diegocuevas579+abc@gmail.com | password: 123456

For `regular` users, simply sign up.

## Public website

The app should have a public website without a namespace.

- Authentication with email and at least two social networks
- Users should have a city, country and address
- Customers should have a form to search a tracking number
- Verify the tracking number is valid
- If it's valid display the information about the shipment
- Any customer can view a shipment's tracking details if they know the tracking number, but only if the logged in user's email matches the recipient's they should view the details marked as not public
- (optional) After a customer searched a tracking number save it in a cookie to list the status if such shipment again in the homepage
  - All shipments they have tracked and are yet to be delivered (empty delivered date)
  - Only the last 5 delivered packages
- After a shipment is marked as completed email the customers registered in the shipment details.

_Private fields to avoid showing in the shipment detail:_

- Sender: order_id, freight_value, email
- Recipient related information

## Deposit panel

The app should have a deposit panel in the namespace `/deposit`.

- Users of role `deposit` should have access to this panel
- Deposits should have a form to search for a tracking number
- Deposits should have a button to mark a shipment as stored in their deposit
- After a deposit marked a shipment as stored should be saved in the shipment history it was on the deposit city and country and the date.

## Administration panel

The app should have an administration panel in the namespace `/admin`.

- Admins can create new tracking numbers
- Admins can create users with read-only access to the admin sales section. This section includes
  - The top 5 countries with the most origin and destination shipments
  - Senders ranked by number of packages sent
  - Senders ranked by total freight value of all their shipments if they have shipped more than 1000kg
  - (Optional) Number of packages with delivered dates past due their estimated delivery date this week, month, quarter

## Public API

The app should expose an API in `/api` to recreate the public website.

- Token based authentication (normal token or JWT with invalidation)
- The API should expose all the endpoints required to re implement the public, deposit and admin websites.
- It must have tests

## Resources

- User (id, username, email, password, city, country, address, role)
- Sender (id, store_name, order_id, email)
- Shipment (id, tracking_id, origin_address, destination_address, weight, reception_date, estimated_delivery_date, delivered_date, freight_value, recipient_id, sender_id)
- ShipmentLocation (id, city, country, reception_date, shipment_id)

![](https://d2ddoduugvun08.cloudfront.net/items/2J1j2B360l2a0t2h3P28/Image%202019-04-29%20at%2010.15.02%20AM.png?X-CloudApp-Visitor-Id=3093938&v=0736014f)

## Acceptance Criteria

- The API must have tests
- Errors should be displayed to the users with understandable messages
- Non optional features are required
- Project lead must ask doubts about the features
