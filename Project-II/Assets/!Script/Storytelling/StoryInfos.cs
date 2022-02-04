using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StoryInfos
{
    public int NextState { get { return nextState; } set { nextState = value; } }
    private int nextState;
    public DialogTreeNode Root { get { return root; } set { root = value; } }
    private DialogTreeNode root;
    public Vector3 TalkingPoint { get { return talkingPoint; } set { talkingPoint = value; } }
    private Vector3 talkingPoint;
}
