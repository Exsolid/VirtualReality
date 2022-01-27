using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InteractableInfos : MonoBehaviour
{
    public bool UseBlur { get { return useBlur; } set { useBlur = value; } }
    [SerializeField] private bool useBlur;
    public bool FocusOnObject { get { return focusOnObject; } set { focusOnObject = value; } }
    [SerializeField] private bool focusOnObject;
    public string[] ShownText { get { return shownText; } set { shownText = value; } }
    [SerializeField] private string[] shownText;
    public bool Moveable { get { return moveable; } set { moveable = value; } }
    [SerializeField] private bool moveable;
}
