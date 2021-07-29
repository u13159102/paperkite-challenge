# Backend Candidate Challenge

This challenge is all about us getting an understanding of the way you approach problems, and a chance to flex your technical skills in the context of a potential PK project. The goal is to get as far as you can, but don’t feel pressure to spend more than 4 hours on it. We’ll talk about what you would have done with more time in the final interview. Have fun with it and let us know if you have any questions!

---

After receiving the design signoff from the client we are now ready to build the next stage of the Coca-Cola Vend App. We have been provided the following 3 states from our design team and need to implement an API for our mobile teams (Android & iOS) to consume so that they can get underway.

To do this, we first need to consume the product and promotion data from Coke's systems. We’ve been provided with the following URL and brief documentation to go with it. Coke have said we can’t call this anymore frequently than every 5 minutes because their system can’t handle the load.

The URL is: [Products](https://ncakqcujsk.execute-api.ap-southeast-2.amazonaws.com/PKTechTest/products)

When creating our API for the Mobile team, it’s worth thinking about the following things:
- Where business logic should be (client vs server)
- How can we ensure the end user has the best, quickest experience possible
- How can we make sure that what we are returning via our API fits the spec we give to our Mobile Devs

If you have any questions, feel free to ping montgomery.anderson@paperkite.co.nz or daniel@paperkite.co.nz, and we'll find out the answers to any questions you may have, and get back to you.

## Screen Descriptions

These screen descriptions might help you understand what the problem is, and how you might solve it. Consider how much data you send and how many requests the phone needs to make to render these screens. If you are not sure, please ask!

### State 1:

This screen simply lays out the available products at the current vending machine that is being used (apps will scan a QR code and this will dictate which machine a user is at). There is no need to worry about the cart icon or animations for now, this will be implemented in a later sprint.

![alt text](/images/state1.png "State 1")

### State 2:

This screen lays out the promotions that are available at any one time. When tapping on the promotion's purchase button, you will be presented with the dialogue box (screen below).

![alt text](/images/state2.png "State 2")

### State 3:

This screen is where a user can select the drinks for their promotion (1 drink per slot), which will then be added to the cart (cart will be worked on in another sprint).

![alt text](/images/state3.png "State 3")

## Frontend

Now consume your API and build a front end to display the data. This can be in whatever tech you like.

## Infrastructure

We know that on average, the Coke API can have up to ~400k requests per day, with peak time spread throughout. With this kind of knowledge, and any other AWS knowledge you may have, attempt to detail out an approach for what kind of systems / services you'd expect for this piece of software. Add any caveats that you suspect might be required. Feel free to commit your approach to the repo in a README format.
