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


* * *
In my implementation I had three classes: Hotel, Date_Range, and Room.  
What is this class's responsibility? You should be able to describe it in a single sentence. Is this class responsible for exactly one thing?
Hotel: Hotel is responsible for hodling a collection of 20 rooms, making reservations, providing a list of reservations, and a list of available rooms. In general, I'd say Hotel is responseible for high level reservation-type activities.
DateRange: DateRange is responsible for knowing a start and end date, validating whether they are valid (end is afer start), whether two instances of itself overlap, and how to calculate the total length of stay. Date range is responsible for date-range activities.
Room: Room is responsible for knowing its ID, Rate, and list of Reservations, which allows it to have the following behaviors: make_reservation(date_range), total_cost(date_range), reservation_exists?(date_range). Room is responsible for room-related activities.



Does this class take on any responsibility that should be delegated to "lower level" classes?
I don't see an opportunity here to move any responsibilities to "lower level" classes here. I do see an opportunity to format my tests. 

Is there code in other classes that directly manipulates this class's instance variables?
No

You might recall writing a file called refactor.txt. Take a look at the refactor plans that you wrote, and consider the following:

How easy is it to follow your own instructions?
Do these refactors improve the clarity of your code? I could have done a better job with refactors.txt
Do you still agree with your previous assesment, or could your refactor be further improved? 
Describe in design-activity.md what changes you would need to make to improve this design, and how the resulting design would be an improvement.