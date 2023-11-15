require('code_runner').setup({
  filetype = {
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt"
    },
    python = "python3 -u",
    c = {
      "gcc -Wall -std=c99 -pedantic $fileName -o $fileNameWithoutExt &&",
      "./$fileNameWithoutExt"
    }
  },
})
