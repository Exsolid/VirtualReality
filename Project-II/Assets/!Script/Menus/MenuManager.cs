using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MenuManager : MonoBehaviour
{
    public MenuState State { get { return state; } set { state = value; } }
    private MenuState state;
}

public enum MenuState
{
    Main,
    Settings,
    None
}