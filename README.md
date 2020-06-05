![Knead Recipes Logo](https://i.imgur.com/QFrJuy4.png)

 
<p align="center">
 Live App Available At
  <a href="https://knead-recipes.herokuapp.com">Knead Recipes App</a>
 </p>
 
# About
This is the API microservice for the Knead Recipes application. It recieves an API request, sends a request to the <a href="https://spoonacular.com/food-api">Spoonacular API</a>, and returns the response back to the primary application. It was built using a Sinatra framework, and utilizes Faraday to establish it's connections.

# Installing
#### Clone down the repository:
```shell
$ git clone https://github.com/alex-latham/knead_recipes_microservice.git
```
#### Run bundle to install all required gems:
```shell
$ bundle install
```
#### Configure Microservice:
Get a Spoonacular key from <a href="https://spoonacular.com/food-api">Spoonacular</a>

Create var.env in root microservice directory

Insert Spoonacular API key into var.env
```shell
SPOONACULAR_KEY=<YOUR API KEY>
```
#### Launching the Microservice spins it up on localhost:9393:
```shell
$ bundle exec shotgun
```

# Features

#### Requests

- To return the information, in json, about a single recipe
```
http://localhost:9393/recipe?id=1
```

- To return information about multiple recipes, provide the IDs without spaces and separated by commas
```
http://localhost:9393/recipes?ids=1,2,3
```

- To return information about multiple recipes with additional (optional) query params

  - Possible querys
    - ?ingredients=beef
    - ?type=dessert
    - ?diet=vegan
    - ?time=60
    - For more information visit <a href="https://spoonacular.com/food-api/docs#Search-Recipes-Complex">Spoonacular Complex Search queries</a>
```
http://localhost:9393/recipes/compleSearch?includeIngredients=beef&time=120&type=main+course
```
