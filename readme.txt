TCustomOutline and TCustomDirectoryOutline components
for SpeedSoft Sibyl

Written by Aaron Lawrence (aaronl@clear.net.nz)

Summary
-------

This package contains two Sibyl components that you can use in
your projects. They are an slightly enhanced TOutline and 
a signficantly enhanced TDirectoryOutline

License
-------

These components are freeware, but comments would be appreciated!
I make no warranty as to the safe operation of these components... etc.

You may modify the source code and use it in your own projects.

What you need
-------------

You should have these files:

CustomOutline.pas
CustomDirectoryOutline.pas
CustomOutline.bmp
CustomDirectoryOutline.bmp

Installation
------------

Compile the two .pas files, CustomOutline first since it is used by the other.

Then, use Component - Install Component to select the two .SPU files produced
and install the components

The components should now appear under the User tab.

Using the components
--------------------

TCustomOutline
--------------
Adds one method and one property over TOutline

Procedure SetAndShowSelectedItem( NodeIndex: longint );
This procedure sets the given node as the selected one, and makes sure it is visible.

Property PopupNode
While a popup menu for the control is active, this indicates the node
that was right clicked, if any.

TCustomDirectoryOutline
-----------------------

This component is much more useful than the rather simplistic TDirectoryOutline that 
Sibyl comes with. Also it is based on TCustomOutline so it gains the benefits
above as well.

Behaviour
Unlike TDirectoryOutline, this component only reads directories as needed, and re-reads
them whenever a directory is opened (expanded). For speed, you have two options regarding 
subdirectories, controlled by the LookAhead property:

LookAhead = false:
In this case the control will display a + for any directories which have not been expanded.
When they are expanded by the user it will see if there are any subdirectories, and if not
the + will disappear (otherwise it becomes a - as usual).
In this mode the control is very fast.

LookAhead = true:
This makes sure the + is only displayed if there really are subdirectories. In this case
it will look ahead for any subdirectories - if none are found the + is hidden.
This noticeably slows down display when there are many subdirectories. It is still faster
than TDirectoryOutline since it only looks ahead one level and stops as soon as it finds
any subdirectory.

Folder bitmaps
You can change the open/closed/folder bitmaps - you aren't stuck with the built in ones.

Root directory selection
There is a bug fix so you can in fact select the root directory!

Current Directory
This control keeps track of it's own directory and does not change, or read, the
current directory. This avoids unexpected side effects of dialogs... :-)

Reload
This procedure immediately re-reads the directories for the current drive.

Navigation methods
ChangeToParent: selects the parent directory of the current selection (if any)
ChangeToRoot: goes to the root directory of the current drive.

Information
AtRoot: this function returns true if the user has selected a root directory
Parent: function returns parent of the selected directory.




If you have any ideas or comments (especially nice ones) feel free to mail me.
aaronl@clear.net.nz
or
aaronl@pec.co.nz (may change soon)

