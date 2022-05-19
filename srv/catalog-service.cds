using com.accenture as my from '../db/schema';

service CatalogService {
   
   entity Books as projection on my.Books;
   //entity Books as projection on my.Books excluding{ stock;author}
   // @readonly entity Books as projection on my.Books;
    //other syntax
    //@Capabilities: {Insertable:false}
   
    entity Authors as projection on my.Authors;
    entity Orders as projection on my.Orders;

    //We can even add actions/functions
    //action submitOrder (book: Books:ID, Orders:quantity);
}