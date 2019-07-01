# Table row placed at line 0 is not recognized

## Description

When inserting a table at the very beginning of the file,
the first row is not recognized by the table editor.

## Changes

When the line number is 0, it is evaluated as falsy, so I changed it to compare with `undefined`.

## Tested On
 - OS and version: Windows 10 Home 1903
 - Zettlr version: Latest develop



# IME problem

    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
    height: 1.4375em !important;
    bottom: -1.4375em !important;
    transform: scaleY(1.1); // Workaround to correctly render negative value positioning

The size of the characters in the hidden textarea must match the size of the characters actually displayed.
Therefore, I added the following style:
```less
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
```

Next, make sure that the vertical size and position of the textarea is always correct.
But Chrome looks buggy with negative position calculations:
```less
    height: 1.4375em !important;
    bottom: -1.4375em !important;
    transform: scaleY(1.1); // Workaround to correctly render negative value positioning
```

At least at the moment, the above workaround is effective:
