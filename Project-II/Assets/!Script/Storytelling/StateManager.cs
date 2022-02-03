using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StateManager : MonoBehaviour
{
    private int currentState;
    // Start is called before the first frame update
    void Start()
    {
        if (PlayerPrefs.HasKey(PlayerPrefKeys.GAMEPLAY_STATE)) currentState = PlayerPrefs.GetInt(PlayerPrefKeys.GAMEPLAY_STATE);
        else currentState = GameplayStates.INTRO;
    }

    public string getCurrentText(int objectID)
    {
        switch (objectID)
        {
            case ObjectIDs.EDGAR:
                return "";
            default:
                return "";
        }
    }
}
