# BabysitterCalculator

This is a command line tool for calculating the pay a babysitter should take home after an evening of babysitting.

## Contents

* [Setting Up a Dev Environment](#dev-environment)
* [Running the Command Line App](#running-the-app)


<a name="dev-environment"></a>
## Setting Up a Dev Environment

The minimum requirements for building and running this project are:

	- Swift 5.0 or higher
	- Xcode 10.2 or higher

Swift 5.0 is included with Xcode 10.2. You can download Xcode 10.2 from the Mac App Store.

First clone the repo

```
$ git clone git@github.com:tylerjohnson10/babysitter-calculator.git
```

cd into the BabysitterCalculator directory

```
$ cd BabysitterCalculator
```

Build the project

```
$ make build
```

Run the tests:

```
$ make test
```

<a name="running-the-app"></a>
## Running the Command Line App

You can run the command line app either from the command line or through the Xcode. To run the tool from the command line:

```
$ .build/debug/BabysitterCalculator --family a
```

Running the tool through Xcode will automatically select a family for you. To change the family, you must modify the arguments passed on launch by selecting the target from the Xcode toolbar and selecting "Edit Scheme" from the dropdown menu. For a more detailed walk-through, see [here](https://nshipster.com/launch-arguments-and-environment-variables/)

*Note: you must provide a family using the --family option. Valid entries for the family option are a, b, and c.