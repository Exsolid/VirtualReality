using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DialogTreeNode
{
    public string ShownText { get { return shownText; } set { shownText = value; } }
    private string shownText;
    public string Descriptor { get { return descriptor; } set { descriptor = value; } }
    private string descriptor;
    public List<string> Options { get{ return options; } set { options = value; } }
    private List<string> options;
    public List<DialogTreeNode> ChildNodes { get { return childNodes; } set { childNodes = value; } }
    private List<DialogTreeNode> childNodes;
    public GameplayStates NextState { get { return nextState; } set { nextState = value; } }
    private GameplayStates nextState;
    public bool ShowObject { get { return showObject; } set { showObject = value; } }
    private bool showObject;
    public bool IsMoveable { get { return isMoveable; } set { isMoveable = value; } }
    private bool isMoveable;
    public string SoundToPlay { get { return soundToPlay; } set { soundToPlay = value; } }
    private string soundToPlay;
    public DialogTreeNode(string shownText, string descriptor)
    {
        this.shownText = shownText;
        this.descriptor = descriptor;
        childNodes = new List<DialogTreeNode>();
        options = new List<string>();
    }
}
