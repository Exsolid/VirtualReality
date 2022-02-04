using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StateManager : MonoBehaviour
{
    private int currentState;
    [SerializeField] private GameObject edgar;
    [SerializeField] private GameObject marg;
    // Start is called before the first frame update
    void Start()
    {
        if (PlayerPrefs.HasKey(PlayerPrefKeys.GAMEPLAY_STATE)) currentState = PlayerPrefs.GetInt(PlayerPrefKeys.GAMEPLAY_STATE);
        else currentState = GameplayStates.INTRO;
    }

    public StoryInfos getCurrentInfos(StoryObjects obj)
    {
        StoryInfos infos = new StoryInfos();

        Vector3 rotateTo = new Vector3(0,0,0);
        switch (obj)
        {
            case StoryObjects.Edgar:
                infos.Root = getEdgarsStory();
                rotateTo = (edgar.transform.position + marg.transform.position) / 2;
                rotateTo.y += 1.25f;
                break;
            default:
                break;
        }
        infos.TalkingPoint = rotateTo;
        return infos;
    }

    private DialogTreeNode getEdgarsStory()
    {
        DialogTreeNode toReturn = null;
        DialogTreeNode temp = null;
        switch (currentState)
        {
            case GameplayStates.INTRO:
                toReturn = new DialogTreeNode("BEEP", "Edgar");
                toReturn.ChildNodes.Add(new DialogTreeNode("Boop", "Edgar"));
                break;
        }
        return toReturn;
    }
}
