class Application {
  String product;
  String company;
  String status;
  String price;
  String logo;
  String offer;

  Application(this.product, this.company, this.status, this.price, this.logo,
      this.offer);
}

List<Application> getApplications() {
  return <Application>[
    Application("Product Title", "Brand Name", "In Stock", "200",
        "images/1.png", "-50%"),
    Application("Product Title", "Brand Name", "In Stock", "200",
        "images/2.png", "-50%"),
    Application("Product Title", "Brand Name", "In Stock", "200",
        "images/3.png", "-50%"),
    Application("Product Title", "Brand Name", "In Stock", "200",
        "images/4.png", "-50%"),
    Application("Product Title", "Brand Name", "Out of Stock", "200",
        "images/5.png", "-50%"),
    Application("Product Title", "Brand Name", "In Stock", "200",
        "images/6.png", "-50%"),
  ];
}
