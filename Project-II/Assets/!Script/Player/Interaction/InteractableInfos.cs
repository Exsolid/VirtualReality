using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InteractableInfos : MonoBehaviour
{
    public bool ResetTransformOnDone { get { return resetTransformOnDone; } set { resetTransformOnDone = value; } }
    [SerializeField] private bool resetTransformOnDone;
    public bool UseBlur { get { return useBlur; } set { useBlur = value; } }
    [SerializeField] private bool useBlur;
    public bool FocusOnObject { get { return focusOnObject; } set { focusOnObject = value; } }
    [SerializeField] private bool focusOnObject;
    public string[] ShownText { get { return shownText; } set { shownText = value; } }
    [SerializeField] private string[] shownText;
}
