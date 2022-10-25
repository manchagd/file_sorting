# File Sorting
## Tasks
Create test cases with the following command:
```
rake challenge:setup
```
If you need to remove the `result` y `test_cases` directories run:
```
rake challenge:clean_test_cases
rake challenge:clean_result
```

## Description
Inside the folder `src` you will find the class `FileSorting` with a class method `.run!`.
Implement the logic to:
1. Create a folder `result` for the work
2. Create a Folder for each letter for example `result/a`, `result/b`, etc.
3. You will find many files in the `test_cases` folder, each file contains a string `title <some_title>` this will be the name of the file, and the file shoul be placed inside the folder named with the initial, for example `title abc` inside `result/a`
