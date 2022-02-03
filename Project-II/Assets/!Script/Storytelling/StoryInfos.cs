using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StoryInfos
{
    public List<string> ShownText { get { return shownText; } set { shownText = value; } }
    private List<string> shownText;

    public Vector3 TalkingPoint { get { return talkingPoint; } set { talkingPoint = value; } }
    private Vector3 talkingPoint;
}
