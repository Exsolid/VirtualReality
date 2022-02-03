using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InteractableInfos : MonoBehaviour
{
    public bool UseBlur { get { return useBlur; } set { useBlur = value; } }
    [SerializeField] private bool useBlur;
    public bool FocusOnObject { get { return focusOnObject; } set { focusOnObject = value; } }
    [SerializeField] private bool focusOnObject;
    public List<string> ShownText { get { return shownText; } set { shownText = value; } }
    [SerializeField] private List<string> shownText;
    public bool Moveable { get { return moveable; } set { moveable = value; } }
    [SerializeField] private bool moveable;
    public StoryObjects StoryObject { get { return storyObject; }}
    [SerializeField] private StoryObjects storyObject; 
    public string GotoScene { get { return gotoScene; } set { gotoScene = value; } }
    [SerializeField] private string gotoScene;
}
