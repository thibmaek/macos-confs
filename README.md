<p align="center">
  <h1 align="center">🍎 macOS Confs — Collective repository macOS configuration & bootstrapping</h1>

  <p align="center">
    <img src="https://badgen.net/badge/license/MIT/blue" alt="MIT License">
    <a href="https://www.notion.so/thibmaek/a07f717381924dfa85889c55b04e5319?v=5a93806995d94debbd16ff0396c21a18">
      <img src="https://img.shields.io/badge/check-our%20roadmap-5362F5.svg" alt="Chat">
    </a>
  </p>

  <blockquote>
    Previously <code>thibmaek/worker</code>. Find the old version <a href="https://github.com/thibmaek/worker/tree/aff7fffebc1e440e87263811ced1aa9c2f086776">at commit aff7fff</a>
  </blockquote>
  <p>
    This repository is aimed at collecting some handy/useful/lengthy/hard scripts and configurations for macOS machines.
    It's the first thing I clone to a new MacBook and then it's basically just a pick & mix of scripts and configurations to install. No install.sh or installation method, only manual cp & running scripts allowed 🙌🏻
  </p>
</p>

# What's in the box

Lots of stuff!

- Some [install scripts](./installers) to set up common packages & binaries
- [Configuration files](./configs) for popular tools & applications
- [Utilities](./utils) for bash scripting

# Installation

It's a pick & mix! You can manually copy over files with cp, rsync, drag and drop or choose to copy over the whole folder like `cp -R installers/**/* $HOME/.installers/`. This is in no way a provisioning tool, then you're better off with Puppet, Ansible, etc. Running headless or automated not recommended since these scripts might require interaction.

# Testing

Runs test.sh for shellcheck'ing the files on Travis CI or locally in dev with `bash test.sh`
