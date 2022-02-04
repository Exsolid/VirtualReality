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

    public DialogTreeNode(string shownText, string descriptor)
    {
        this.shownText = shownText;
        this.descriptor = descriptor;
        childNodes = new List<DialogTreeNode>();
        options = new List<string>();
    }
}
