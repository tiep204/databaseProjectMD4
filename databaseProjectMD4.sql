create database projectMD4;
use projectMD4;

create table roles
(
    role_id   int primary key auto_increment,
    role_name nvarchar(255)
);

create table user
(
    user_id       int primary key auto_increment,
    username      nvarchar(255),
    email         nvarchar(255),
    first_name    nvarchar(255),
    last_name     nvarchar(255),
    password      nvarchar(255),
    role_id       int,
    status bit default 1,
    avatar        text,
    created_at    datetime,
    created_by_id int,
    updated_at    datetime,
    updated_by_id int,
    foreign key (role_id) references roles (role_id)
);
create table category
(
    category_id   int primary key auto_increment,
    category_name nvarchar(255),
    status        bit default (1)
);

create table product
(
    product_id    int primary key auto_increment,
    sku           nvarchar(5),
    product_name  nvarchar(255),
    category_id   int,
    description   text,
    unit_price    float,
    image         text,
    stock         int,
    created_at    datetime,
    created_by_id int,
    updated_at    datetime,
    updated_by_id int,
    foreign key (category_id) references category (category_id)
);

create table orders
(
    order_id     int primary key auto_increment,
    user_id      int,
    order_at     datetime,
    total_price  int,
    status       int,
    note         nvarchar(255),
    created_at   datetime,
    update_by_id int,
    foreign key (user_id) references user (user_id)
);
create table orderDetail
(
    order_detail_id int primary key auto_increment,
    order_id        int,
    product_id      int,
    unit_price      float,
    quantity        int,
    sub_total_price float,
    foreign key (order_id) references orders (order_id),
    foreign key (product_id) references product (product_id)
);

create table contact
(
    id            int primary key,
    full_name     nvarchar(255),
    email         nvarchar(255),
    content       nvarchar(255),
    status        int,
    created_at    datetime,
    created_by_id int,
    updated_at    datetime,
    updated_by_id int
);
create table image(
    image_id int primary key auto_increment,
    imageURL text,
    imageStatus bit default(1),
    product_id int ,
    foreign key (product_id) references product(product_id)
);
create table wishlist
(
    wishlist_id   int primary key auto_increment,
    user_id       int,
    product_id    int,
    created_at    datetime,
    foreign key (user_id) references user (user_id),
    foreign key (product_id) references product (product_id)
);
