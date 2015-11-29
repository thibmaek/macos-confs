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
git clone https://github.com/thibmaek/worker.git worker
cd worker
sudo ./make #sudo not required (except for osx.sh)
```

`make` is the file that points your shell to each specific module.  
If you want to turn certain modules of, just comment them out from `make`

If you want to you can also install this on a file-per-file base, just run the .sh files inside of the modules directory. The extensions directory installs additional content to the modules.

### Modifying

No problem forking this over to your own account, but don't bother sending a PR because I won't merge it unless it's a bug fix (though I prefer to use the issues on this repo for that.)

#### Testing

If I have to be really honest: I didn't test this on a new machine. It's just created out of the assumption that the code will work. I'm in progress of grabbing hold of a MacBook so I can test it, but currently this is released as beta code.

There is a small test on Travis though which you can work on.  
To start your test edit `test.sh` to:

```shell
# Test every script in the modules folder
for file in $(find ./modules -name '*.sh'); do
```

and then run:

```shell
bash test.sh
```
