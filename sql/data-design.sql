ALTER DATABASE jmurphy33 CHARACTER SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS shoppingCartItem;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS `profile`;

CREATE TABLE `profile` (
   profileId BINARY(16) NOT NULL,
   profileEmail VARCHAR(128) NOT NULL,
   profilePaymentInfo VARCHAR(28) NOT NULL,
   profileAddress VARCHAR(64) NOT NULL,
   profileUserName VARCHAR(32) NOT NULL,

   UNIQUE(profileEmail),
   UNIQUE(profileUserName),

   PRIMARY KEY(profileId)

);

CREATE TABLE product (
   productId BINARY(16) NOT NULL,
   productInfo VARCHAR(512) NOT NULL,
   productPrice VARCHAR(8) NOT NULL,

   UNIQUE(productInfo),

   PRIMARY KEY(productId)
);

CREATE TABLE shoppingCartItem (
   shoppingCartItemProfileId BINARY(16) NOT NULL,
   shoppingCartItemProductId BINARY(16) NOT NULL,
   shoppingCartItemQuantity VARCHAR(99) NOT NULL,

   INDEX(shoppingCartItemProfileId),
   INDEX(shoppingCartItemProductId),

   FOREIGN KEY(shoppingCartItemProfileId) REFERENCES profile(profileId),
   FOREIGN KEY(shoppingCartItemProductId) REFERENCES product(productId),

   PRIMARY KEY(shoppingCartItemProfileId, shoppingCartItemProductId)
);