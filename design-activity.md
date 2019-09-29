What classes does each implementation include? Are the lists the same? 
Implementation A: CartEntry, ShoppingCart, and Order.
Implementation B: CartEntry, ShoppingCart, and Order.
The lists have the same number of classes and names of classes.

Write down a sentence to describe each class.
CartEntry is responsible for knowing the unit_price and quantity 
ShoppingCart is repsonsible for keeping track of the number of entries
Order is responsible for initializing an instance of ShoppingCart and returning the total price 
How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.

What data does each class store? How (if at all) does this differ between the two implementations?
CartEntry: unit price, quantity
ShoppingCart: entries
Order: sum of cart entries (and in implementation b, a new instance of @cart), SALES_TAX

What methods does each class have? How (if at all) does this differ between the two implementations?
Implementation A:
CartEntry: initialize
ShoppingCart: initialize
Order initialize, total_price

Implementation B:
CartEntry: initialize, price
ShoppingCart: initialize, prices
Order: initialize, total_price

Consider the Order#total_price method. In each implementation:
Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?
I don't know how to answer this question
Does total_price directly manipulate the instance variables of other classes?
No
If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
I would modify the price method in ShoppingCart.
Implementation B is easier to modify.
Which implementation better adheres to the single responsibility principle?
B
Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?
B