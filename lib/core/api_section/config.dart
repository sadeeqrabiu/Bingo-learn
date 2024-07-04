





class Config{

  //All API endpoints
  static const String apiHttp = "https://";
  static const String apiAuth = "ypmqjrxxegdrgfhfzbxj.supabase.co";
  static const String loginEndPoint = "/auth/v1/token?grant_type=password";
  static const String signUpEndPoint = "/auth/v1/signup";
  static const String userDateEndPoint = '/rest/v1/users';
  static const String allLanguageEndPoint = '/rest/v1/Languages?select=*';
  static const String getUerDataEndPoint = '/rest/v1/users?userId=eq.';

  //Gemini ApiKey
  static const String GEMINI_AI_KEY = "AIzaSyCPC7U2K83Nkfwpagyg9M_oPDMfiLsv14c";


}

