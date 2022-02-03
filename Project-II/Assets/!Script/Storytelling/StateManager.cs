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
        List<string> toReturn = new List<string>();
        Vector3 rotateTo = new Vector3(0,0,0);
        switch (obj)
        {
            case StoryObjects.Edgar:
                toReturn = getEdgarsStory();
                rotateTo = (edgar.transform.position + marg.transform.position) / 2;
                break;
            default:
                toReturn.Clear();
                break;
        }
        infos.ShownText = toReturn;
        infos.TalkingPoint = rotateTo;
        return infos;
    }

    private List<string> getEdgarsStory()
    {
        List<string> toReturn = new List<string>();
        switch (currentState)
        {
            case GameplayStates.INTRO:
                toReturn.Add("Aah, old friend, good to see you, I am glad you could come here so promptly.");
                toReturn.Add("It has been a long time so of course you have not met my second wife. Let me introduce you to my beloved Margaret.");
                break;
        }
        return toReturn;
    }
}
