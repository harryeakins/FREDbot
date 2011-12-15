#!/usr/bin/env python
import pygame
import os

class Speaker:
    sounds = {
             "idle": ["feedme", 
                      "imhungry",
                      "ieatbottles",
                      "bottlesplease"],
             "approached": ["hello",
                            "hi",
                            "howdy"],
             "bottle": ["mmmbottles",
                        "niceone",
                        "thankyou",
                        "yumyumyum"],
             "non-bottle": ["yuk",
                            "spitting",
                            "bottletarian",
                            "grrr"]
             }
    states = sounds.keys()
    def __init__(self):
        pygame.mixer.init()
        self.indexes = dict((k, 0) for k in Speaker.sounds.keys())
        self.state = "idle"
        self.voice_type = "Human"

    def setState(self, state):
        state = state.lower() # lower case
        if state not in Speaker.states:
            print "State must be one of", Speaker.states
        else:
            self.state = state

    def saySomething(self):
        filename = self.voice_type + "/" + self.getNextSoundName() + ".mp3"
        pygame.mixer.music.load(filename)
        pygame.mixer.music.play()

    def getNextSoundName(self):
        possible_sounds = Speaker.sounds[self.state]
        filename = possible_sounds[self.indexes[self.state]]
        self.indexes[self.state] = (self.indexes[self.state]+1) % len(possible_sounds)
        return filename

    def setVoiceType(self, type):
        if os.path.isdir(type):
            self.voice_type = type
        else:
            print "No such voice type:", type

          
