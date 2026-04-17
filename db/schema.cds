namespace inventory;

entity Customers {
    key ID : UUID;
    name : String;
    email : String;
}

entity Orders {
    key ID : UUID;
    items : Composition of many OrderItems on items.order = $self;
    status : String;
    createdAt : Timestamp;
}

entity OrderItems{
    key ID : UUID;
    product : Association to Products;
    order : Association to Orders;
    quantity : Integer;
    price : Decimal(10, 2);
}

entity Products{
    key ID : UUID;
    name : String;
    price : Decimal(10, 2);
    stock : Integer;
}