# MetaBorg Homebrew Tap

To install MetaBorg formulas with Homebrew, add this tap with
```brew tap hendrikvanantwerpen/homebrew```.

Now install Stratego/XT with
```brew install strategoxt```

## Notes for Linux

You can use this way on linux as well, if you install the Homebrew
clone Linuxbrew (https://github.com/Homebrew/linuxbrew) using the
instructions in their GitHub repository.

If `brew tap` doesn't work, you can also create the tap with:
```
cd ~/.linuxbrew/Library/Taps
mkdir hendrikvanantwerpen
cd hendrikvanantwerpen
git clone https://github.com/hendrikvanantwerpen/homebrew.git
```

If `brew install` complains that it has no compiler to use, try to
pass one explicitly on the commandline, as in:
```brew install strategoxt --cc=gcc-4.9`````
