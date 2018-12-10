Simple demo JSON API with some coding samples. Of course some (most) of the files content was auto automagically created but still... yay for the Rails community ;-) This at least shows roughly how I structure and separate things as well as my GIT flow. 

This API has (an) end point(s) for checking if a Sudoku board is correctly solved. 

Rough Steps To Run:

clone the repo

run `bundle`

run `rails s`

fire some requests via curl or your favorite tool

 ex...
 
 invalid board
 
 `curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"board": ["4", "6", "7", "9", "2", "2", "3", "5", "8", "8", "9", "5", "4", "7", "3", "2", "6", "1", "2", "3", "1", "8", "6", "5", "7", "4", "9", "5", "1", "3", "6", "9", "8", "4", "2", "7", "9", "2", "8", "7", "5", "4", "6", "1", "3", "7", "4", "6", "1", "3", "2", "9", "8", "5", "3", "5", "4", "2", "8", "7", "1", "9", "6", "1", "8", "9", "3", "4", "6", "5", "7", "2", "6", "7", "2", "5", "1", "9", "8", "3", "4"]}' \
  http://localhost:3000/is_valid`

valid board 

`curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"board": ["4", "6", "7", "9", "2", "1", "3", "5", "8", "8", "9", "5", "4", "7", "3", "2", "6", "1", "2", "3", "1", "8", "6", "5", "7", "4", "9", "5", "1", "3", "6", "9", "8", "4", "2", "7", "9", "2", "8", "7", "5", "4", "6", "1", "3", "7", "4", "6", "1", "3", "2", "9", "8", "5", "3", "5", "4", "2", "8", "7", "1", "9", "6", "1", "8", "9", "3", "4", "6", "5", "7", "2", "6", "7", "2", "5", "1", "9", "8", "3", "4"]}' \
  http://localhost:3000/is_valid`
