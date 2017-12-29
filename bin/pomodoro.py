#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Based on samliu/osx_sleeptimer.py

import argparse
import time
import sys
import os

from datetime import datetime, timedelta


def start(app, minutes):
    print("🍅  Running a {} minute{} pomodoro...".format(
        minutes, 's' if minutes != 1 else ''))
    print("🎹  Playing music in {}...".format(app))
    os.system("osascript -e 'tell app \"{}\" to play'".format(app))


def pomodoro(app, minutes):
    start = datetime.now()

    if minutes:
        # Calculate when we should be done, for display purposes
        end = start + timedelta(minutes=minutes)
        now = datetime.now()

        # Wait the proper amount of time, while printing a timer
        while end >= now:
            time.sleep(0.05)
            now = datetime.now()
            left = (end - now)

            sys.stdout.write("\r⏲  Remaining time: {} ".format(
                left - timedelta(microseconds=left.microseconds)
                if left > timedelta(0)
                else timedelta(0)))
            sys.stdout.flush()

        print("")


def end(app, minutes):
    os.system("osascript -e 'tell app \"{}\" to pause'".format(app))
    print("🎹  Stopping music in {}...".format(app))
    print("☕️  Done!")


def main():
    parser = argparse.ArgumentParser(
        description="Starts your music and stops it with a timer")
    parser.add_argument("--app", default='spotify',
                        choices=['spotify', 'itunes'],
                        help="app used to play music")
    parser.add_argument("minutes", default=25, nargs='?',
                        help="minutes to wait (fractions are allowed)")
    args = parser.parse_args()

    start(args.app, float(args.minutes))
    pomodoro(args.app, float(args.minutes))
    end(args.app, float(args.minutes))


if __name__ == '__main__':
    main()
