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
1. First, create a folder named `result`
2. Then, create a Folder for each letter. e.g.: `result/a`, `result/b`, etc.
3. You will find several files in the folder named `test_cases`. Each file contains a string `title <some_title>`. Please rename the file with the string `<some_title>`. Then move the file from `test_cases` into the folder named with the initial, like this: the file that contains `title abc` would be renamed as `abc` and placed in the folder `result/a`

Happy coding!
