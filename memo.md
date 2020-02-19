# title

## Description


## Reproducing


## Expected behaviour


## Platform

 - OS and version: Windows 10 Home 1903
 - Zettlr Version: 1.6.0-beta.4
 - Screen Resolution: 1366x768

## Additional Information

---

# Table row placed at line 0 is not recognized

## Description

When inserting a table at the very beginning of the file,
the first row is not recognized by the table editor.

## Changes

When the line number is 0, it is evaluated as falsy, so I changed it to compare with `undefined`.

## Tested On
 - OS and version: Windows 10 Home 1903
 - Zettlr version: Latest develop

---

# Cannot select "Characters" as writing target

## Description

Clicking on the "Characters" closes the set-writing-target popup immediately.

## Reproducing

1. Right click any file and select "Set writing target..."
2. Click on "Words" in the center of the popup and try to change it to "Characters".
3. The popup will close.

## Expected behaviour

Clicking the pull-down does not close the popup.

## Platform

 - OS and version: Windows 10 Home 1903
 - Zettlr Version: 1.6.0-beta.4
 - Screen Resolution: 1366x768

## Additional Information

Reproducible in v1.3.0 or later.

