using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum GameplayStates
{
    NONE = -1,
    INTRO = 0,
    INTRO_DOORNOTFOUND = 1,
    CHAPTER_ONE = 2,
    CHAPTER_ONE_UNSOLVED = 3,
    CHAPTER_ONE_CLUE_ONE = 4,
    CHAPTER_ONE_CLUE_TWO = 5,
    CHAPTER_ONE_SOLVED = 6,
    CHAPTER_TWO = 7,
    CHAPTER_TWO_TALK_ONE = 8,
    CHAPTER_TWO_TALK_TWO = 9
}
