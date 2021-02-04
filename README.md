# Aspell Dockerized

## Usage

```
docker run --rm -v $(pwd):/home/aspell kinoba/aspell-dockerized *.txt
```

### Options

#### Extra dictionary

We use this image to check for spelling mistakes inside in our code. Many false positives such as `const`, `var`... are detected.
We created a developer oriented wordlist to help remove these.
The wordlist is available at: 

To use it (or any other wordlist), mount it as a volume:

```
docker run --rm -v $(pwd):/home/aspell -v [/path/to/wordlist.txt]:/home/aspell/wordlist.txt kinoba/aspell-dockerized *.txt
```

## Contribute

```
docker build . -t kinoba/aspell-dockerized
```

## TODO

- Add more languages
- Ability to select which languages to use
- Add personal dictonary for allowed words
- ~~Ability to select which file extension to check for spelling mistakes~~
