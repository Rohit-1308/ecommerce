import 'package:flutter/material.dart';
import 'package:ecommerce/data.dart';

class Applications extends StatefulWidget {
  @override
  _ApplicationsState createState() => _ApplicationsState();
}

class _ApplicationsState extends State<Applications> {

  List<Application> applications = getApplications();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Padding(
            padding: EdgeInsets.only(right: 32, left: 32, top: 48, bottom: 15),
            child: Text(
              "Suggested For You",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.2
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(right: 8, left: 10, bottom: 8),
            child: Column(
              children: buildApplications(),
            ),
          ),

        ],
      ),
    );
  }

  List<Widget> buildApplications(){
    List<Widget> list = [];
    for (var i = 0; i < applications.length; i++) {
      list.add(buildApplication(applications[i]));
    }
    return list;
  }

  Widget buildApplication(Application application){
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [

          Row(
            children: [

              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(application.logo),
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),

              Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          application.product,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          application.company,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),

                      ],
                    ),
                  )
              ),

              Icon(
                Icons.more_vert,
              ),

            ],
          ),

          SizedBox(
            height: 16,
          ),

          Row(
            children: [

              Expanded(
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      application.status,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: application.status == "In Stock" ? Colors.green[500] :
                        application.status == "Out of Stock" ? Colors.red[500] : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  child: Center(
                    child: Text(
                      r"Rs." + application.price + "",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }

}
