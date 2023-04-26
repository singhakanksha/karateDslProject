function fn(){
 var config = {
   name: "akanksha",
   baseURL: "https://reqres.in/api"

 };

 var env = karate.env
 karate.log('the value of env is: ', env)

 if(env == 'qa'){
  config.baseURL = "https://reqres.in/api/qa"
 }

  if(env == 'dev'){
   config.baseURL = "https://reqres.in/api/dev"
  }

 return config;
}