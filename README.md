EuroCopaInfo
============

EuroCopaInfo, a
[FRLayeredNavigationController](https://github.com/weissi/FRLayeredNavigationController)
demo project.

How to Build?
=============

It's very simple, but it's essential that you also get
FRLayeredNavigationController. Additionally, FRLayeredNavigationController and
EuroCopaInfo have to have the same parent folder. My directory hierarchy looks
like:

    $HOME/Documents/EuroCopaInfo
    $HOME/Documents/FRLayeredNavigationController

Here's the step by step guide:

    # First: go to some folder
    cd ~/Documents
    # Second: checkout FRLayeredNavigationController (next to EuroCopaInfo!)
    git clone git://github.com/weissi/FRLayeredNavigationController.git
    # Third: checkout EuroCopaInfo
    git clone git://github.com/weissi/EuroCopaInfo.git
    # Last: Build it, you can also open the EuroCopaInfo project in Xcode and
    #       run EuroCopaInfo on your iPad / Simulator
    xcodebuild
