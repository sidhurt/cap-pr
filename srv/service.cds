using inventory from '../db/schema';

service orderService {
    entity Orders as projection on inventory.Orders;
    entity OrderItems as projection on inventory.OrderItems;
    entity Customers as projection on inventory.Customers;
    entity Products as projection on inventory.Products;
}
