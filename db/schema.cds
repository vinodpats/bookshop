namespace com.accenture;
using { cuid, managed, Country } from '@sap/cds/common';

//asepts are reusable models
aspect additionalInfo{
    language: String (100);
}

entity Books: additionalInfo{
    key ID : Integer;
    title : String;
    stock : Integer;
    author: Association to Authors;
}

entity Authors{
     key ID : Integer;
     name: String;
     books: Association to many Books on books.author = $self;
     
}

entity Orders : cuid, managed{
    //key ID: UUID;
    book: Association to Books;
    quantity: Integer

}