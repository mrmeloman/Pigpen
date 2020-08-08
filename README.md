# Pigpen
This is an app for presenting a ["Pigs in the pen" problem](https://psycnet.apa.org/record/1993-36184-001), or Pigpen problem, to the solvers. It allows recording of the solving process in CSV on ~50 FPS. It doesn't provide a solution detection, as it seems really complicated. If you want to add it, feel free to work on it. 

The code is written in [Processing](https://processing.org/) using Java. 

The project was created during my Master's course in National Research University "Higher School of Economics".
It was tested on ~150 participants, using touch tablet PCs. 

The project has lots of weak points, so, please: **if you use it - improve it** at least a bit.

## If you want to just start using it:
1. Download the latest version of [Processing IDE](https://processing.org/download/)
2. Download the last version of [Java](https://www.java.com/)
3. Download this project, it has all the source code
4. All of the project files must be inside of the folder named "pigpen"
5. Open pigpen.pde in Processing IDE
6. Export the project as an application

Processing will generate a folder(s) with executibles and everything you need to run this project.
After that, proceed using it just as any other app. 

### How do I close it?
Press "Q" on the keyboard. If it doesn't respond, click within the app space and try again. 

## How to access the solution data?
The app saves all recordings in the *.csv file. Column separator is ",", line separator is <LF>. 

There is a header with columns' names in the file. The name of the file consists of data and time when the app was launched. The date/time format in the file name is d.m.YYYY_h.m.s

Example: 7.6.2018_22.17.19

In the *.csv file, each line represents an action.
The headers in the file are:
- **time**: time in milliseconds, since the app was launched
- **x**: x (horizontal) coordinate of the action
- **y**: y (vertical) coordinate of the action. Note that y axis is reversed, meaning the lower, the bigger
- **state**: state or current screen of the app. 0 means instructions screen, 1 means task screen
- **resets**: total number of the "reset" button uses, including current line, meaning the line with the "RESET" action will have an incremented number
- **action**: the action that is represented by current line. Options are: 
   - _**START**_: pressing of the "start" button on the instructions screen
   - _**DPRESS**_: pressing the left mouse button, or touching the screen
   - _**DRELEASE**_: releasing the left mouse button or removing the finger/stilus from the screen
   - _**DRAW**_: dragging the cursor, finger or stilus while holding the left mouse button or touching the screen. All DRAWs are always between DPRESS and DRELEASE.
   - _**RESET**_: pressing the "reset" button
   - _**EXIT**_: pressing "Q" on the keyboard, exiting the program. It's always the last action in the file. 
