# spock-flow-example

A little skeleton that I use to copy / paste when starting a new simple webapp.

Uses Spock for the backend (Haskell) and Flow for the frontend.

```
# Build the JavaScript:
cd frontend
yarn install
webpack    # --watch

# Build the Haskell
stack build
stack exec -- spock-flow-example
```

## License

[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](https://jez.io/MIT-LICENSE.txt)
