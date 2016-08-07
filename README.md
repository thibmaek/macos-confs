# Welcome to worker!

> Getting your OS X machine up and running!

Worker is a personal project to quickly get new or clean installed OS X machines
up and running with everything I need for my development workflow.

It currently presets all of the following:
* [OS X sensible defaults](https://github.com/mathiasbynens/dotfiles)
* [Brew](https://github.com/Homebrew/homebrew) (with casks)
* Node (trough [nvm](https://github.com/creationix/nvm))
* Ruby (trough [rbenv](https://github.com/rbenv/rbenv))
* Python (trough [pyenv](https://github.com/yyuu/pyenv))
* [Atom](https://github.com/atom/atom) (with apm packages & themes)

Ready to get started? Great.

### Installing

Just running it from the top is easy:

```shell
git clone https://github.com/thibmaek/worker.git
cd worker
sudo ./make #sudo not required (except for macos.sh)
```

`make` is the file that points your shell to each specific module.  
If you want to turn certain modules of, just comment them out from `make`

If you want to you can also install this on a file-per-file base, just run the .sh files inside of the modules directory. The extensions directory installs additional content to the modules.

### Modifying

No problem forking this over to your own account, but don't bother sending a PR because I won't merge it unless it's a bug fix (though I prefer to use the issues on this repo for that.)

#### Testing

Run tests locally by just executing them with bash from the test dir.
It's advised to make sure they are executable with `chmod` first:

```bash
export $TESTDIR=./tests
for TEST in $(find $TESTDIR/ -name '*.test.sh'); do chmod +x $TEST done

for FILE in $TESTDIR/*; do
  bash $FILE
done
```
