
import 'package:http/http.dart' as http;
class StringCall{

   static final StringCall _instance = new StringCall.internal();
   factory StringCall()=> _instance;

   StringCall.internal();

   static StringCall get instance => _instance;


//  static StringCall _instance;
//  factory StringCall() =>  _instance   ?? = new StringCall._();
//
//  StringCall._();

//  Future<String> _makePostsRequest(String url, Map params) async {
//    // set up POST request arguments
//    String url = 'https://jsonplaceholder.typicode.com/posts';
//    Map<String, String> headers = {"Content-type": "application/json"};
//    String json = '{"title": "Hello", "body": "body text", "userId": 1}';
//    // make POST request
//    Response response = await post(url, headers: headers, body: json);
//    // check the status code for the result
//    int statusCode = response.statusCode;
//    // this API passes back the id of the new item added to the body
//    String body = response.body;
//    // {
//    //   "title": "Hello",
//    //   "body": "body text",
//    //   "userId": 1,
//    //   "id": 101
//    // }
//  }

   Future<String> makeGetRequest(String url, Map params) async {

     var response = await http
         .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
     return response.body;
   }

   Future<String> makePostRequest(String url, Map map) async {
     var response =  await http.post(Uri.decodeFull(url), headers: {"Accepts":"application/json"});
     return response.body;
   }
 }
