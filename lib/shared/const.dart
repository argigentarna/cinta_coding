// NOTE : Base URL
const baseUrl = "https://jsonplaceholder.typicode.com/";

// NOTE : API
const String apiUser = 'users';
const String apiPost = 'posts';

String apiComment(String id) {
  return "posts/$id/comments";
}

// NOTE : Lottie
const String lotDeveloper = 'assets/lotties/developer.json';

// NOTE : Response
const resSuccessUploaded = "Upload successfully!";
const resFailedGetStatus = "Failed to get status!";
const resNoConnection = 'No Internet connection!';
const resCouldntFindData = "Couldn't find the data!";
const resBadResponse = "Bad response format!";
const resFailedGetTransaction = 'Failed to get transactions!';
