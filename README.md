# glfw-skeleton-ruby [![Build Status](https://travis-ci.org/andystanton/glfw-skeleton-ruby.png?branch=master)](https://travis-ci.org/andystanton/glfw-skeleton-ruby)

A skeleton Ruby application that makes use of the [GLFW library](http://www.glfw.org) for rapidly prototyping OpenGL applications in Ruby via the [ruby-glfw3 bindings](https://github.com/nilium/ruby-glfw3). It is based on the C++ [glfw-skeleton project](https://github.com/andystanton/glfw-skeleton).

![](http://andystanton.github.io/glfw-skeleton/images/content/1.0-ruby/glfw-skeleton.png)


## Requirements

 * Ruby >= 2.0.0
 * [GLFW3](http://www.glfw.org/download.html) *


\* [Homebrew](http://brew.sh/) is strongly recommended on MacOS for simplicity: ```brew install glfw3```


## Quick Start

Clone the project:

```sh
git clone https://github.com/andystanton/glfw-skeleton-ruby.git --recursive && cd glfw-skeleton-ruby
```

Get the dependencies:

```sh
sudo -E bundle install
```

Run the rb file:

```sh
ruby src/glfw-skeleton.rb
```
