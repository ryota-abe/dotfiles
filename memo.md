# Table row placed at line 0 is not recognized

## Description

When inserting a table at the very beginning of the file,
the first row is not recognized by the table editor.

## Changes

When the line number is 0, it is evaluated as falsy, so I changed it to compare with `undefined`.

## Tested On
 - OS and version: Windows 10 Home 1903
 - Zettlr version: Latest develop


# Writing target info is not updated

## Description

Writing-target-info tooltip in the file list is not updated when saving the file.
The trigger is probably this commit: ["Fixed FileList glitches"](https://github.com/Zettlr/Zettlr/commit/5ce31d43dd3a9ad58bdccf0df7a0cde53d3c1921).

## Reproducing

1. Set writing target to arbitrary file.
2. Open the file and type (or delete) some words.
3. `Ctrl-s`
4. Hover the writing target indicator in the file list.

## Expected behaviour

The correct word count should be displayed in the tooltip.

## Platform

 - OS and version: Windows 10 Home 1903
 - Zettlr Version: 1.6.0-beta.4
 - Screen Resolution: 1366x768

## Additional Information


