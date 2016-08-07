curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | PROFILE=$HOME/.bash_profile bash

if [[ ! -f $HOME/.bash_profile && ! -d $HOME/.nvm/]]; then
  exit 1
else
  if !which npm >/dev/null; then exit 1 fi

  modules=(
    eslint
    mklicense
    mocha
    nativefier
    node-gyp
    nodemon
    npm
    speed-test
    webpack
    webpack-validator
    yo
  )

  generators=(
    generator-devine-project
    generator-generator
  )

  npm install -g ${modules[@]}
  npm install -g ${generators[@]}
fi
