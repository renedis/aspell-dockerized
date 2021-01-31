# Aspell Dockerized

## Usage

```
docker build . -t kinoba/aspell-dockerized && docker run --rm -v $(pwd):/home/aspell kinoba/aspell-dockerized
docker run --rm -v $(pwd):/home/aspell kinoba/aspell-dockerized *.txt > spelling-mistakes.txt
```

## TODO

- Add more languages
- Ability to select which languages to use
- Add personal dictonary for allowed words
- ~~Ability to select which file extension to check for spelling mistakes~~
