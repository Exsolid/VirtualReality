using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InteractableInfos : MonoBehaviour
{
    public GameplayStates InteractableAfter { get { return interactableAfter; } set { interactableAfter = value; } }
    [SerializeField] private GameplayStates interactableAfter;
    public bool UseBlur { get { return useBlur; } set { useBlur = value; } }
    [SerializeField] private bool useBlur;
    public bool FocusOnObject { get { return focusOnObject; } set { focusOnObject = value; } }
    [SerializeField] private bool focusOnObject;
    public string ShownText { get { return shownText; } set { shownText = value; } }
    [SerializeField] private string shownText;
    public string Descriptor { get { return descriptor; } set { descriptor = value; } }
    [SerializeField] private string descriptor;
    public bool Moveable { get { return moveable; } set { moveable = value; } }
    [SerializeField] private bool moveable;
    public bool InvertMoveableDirection { get { return invertMoveableDirection; } set { invertMoveableDirection = value; } }
    [SerializeField] private bool invertMoveableDirection;
    public StoryObjects StoryObject { get { return storyObject; }}
    [SerializeField] private StoryObjects storyObject; 
    public string GotoScene { get { return gotoScene; } set { gotoScene = value; } }
    [SerializeField] private string gotoScene;
    public GameObject ObjectToShow { get { return objectToShow; } }
    [SerializeField] private GameObject objectToShow;
    public bool RotateOnX { get { return rotateOnX; } set { rotateOnX = value; } }
    [SerializeField] private bool rotateOnX;
    public Vector3 RepositionFocus { get { return repositionFocus; } set { repositionFocus = value; } }
    [SerializeField] private Vector3 repositionFocus;
}
