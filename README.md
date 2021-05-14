# devigetChallenge
I developed this test with a little amount of time per day, I didn't finished it all, but the important thing is it works.

# About instructions

## - Assume the latest platform and use Swift
I have and old Macbook with Catalina, with no Big Sur Support, so I used the final XCode version for this OS (12.4)
## - Use UITableView / UICollectionView to arrange the data.
I used UITableView
## - Please refrain from using any dependency manager [cocoapods / carthage / etc], instead, use URLSession 
Done
## - Support all Device Orientation
Done, but I didn't do anything elaborated for ipad
## - Support all Devices screen (iPhone/iPad)
Done, but I didn't do anything elaborated for ipad. The same as above
## - Use Storyboards
Done

# About what to show
## The app should be able to show data from each entry such as:

### - Title (at its full length, so take this into account when sizing your cells)
Yes
### - Author
Yes
### - entry date, following a format like “x hours ago” 
Yes, that was tricky
### - A thumbnail for those who have a picture.
Yes
### - Number of comments
Yes
### - Unread status
Yes but I didn't store any kind of data to make unread status persistant
### - Open Media with URL
Yes, and I added GIF support

# About What to Include
## - Pull to Refresh
Not implemented
## - Pagination support
not implemented
## - Saving pictures in the picture gallery
not implemented
## - App state-preservation/restoration
not implemented
## - Indicator of unread/read post (updated status, after post it’s selected)
Yes but without store the read status
## - Dismiss Post Button (remove the cell from list. Animations required)
Yes, but without animation, I tried with tableView.deleteRow() but it was a mess
## - Dismiss All Button (remove all posts. Animations required)
Yes
## - Support split layout (left side: all posts / right side: detail post)
Not implemented

In few words, I didn't have too much time cause I have a lot of work where I'm currently working and I hade some personal compromises 
