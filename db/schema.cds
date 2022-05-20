namespace com.accenture;
using { cuid, managed, Country, Language, Currency} from '@sap/cds/common';

//asepts are reusable models
aspect additionalInfo{
    language: String (10);
    lan: Language;
    currency: Currency;
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

entity Products{
    key ID : UUID;
    identifier: String @Common.Label : 'ProductID';
    title: localized String @Common.Label : 'Name';
    description: localized String;
    availability: Integer;
    price: Decimal(9,2);
    currency: Currency;
    supplier: Association to Suppliers;
    image_url: String;
}

entity Suppliers{
    key ID: UUID;
    identifier: String;
    name: String;
    phone: String;
    street: String @multiline;
    postCode: String;
    city: String;
    country: Country;
    products: Composition of many Products on products.supplier = $self;

}