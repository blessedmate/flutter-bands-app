# Flutter Bands App

A Flutter mobile app that simulates a voting space for music bands, connected to a backend server using Socketio.

## Description

This application has a main screen where a list of music bands are displayed. 

Users can add votes to the bands by tapping on them and these will be registered in the backend via socket communication. All votes are displayed in a pie chart. Users can also add a new band to the list.

In case of a socket connection error, the top right icon will notify the user about the connectivity issue until its normal again.

## Implemented packages

Some of the most important packages used to build this app are:

- socket_io_client: ^1.0.2
- provider: ^6.0.1
- pie_chart: ^5.1.0
