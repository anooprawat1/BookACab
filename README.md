# BookACab
This app lets you view nearby cabs and book them for a ride.

Possible Permorfance Changes

Right now annotation is loading at once, we can show annotation for visible rect only. And same for hidding and showing pin, right now on hidding other pins its hiding all the pins irrespective of the rect. MapView should hide only visible pins.

I have used MVVM because it segerates logic and view controller code very well and used by lots of other developer so make sense in perspective of adaptability. We can use coordinators for making better communication between ViewControllers. But as there are only two controllers right now, it doesnot add value.
