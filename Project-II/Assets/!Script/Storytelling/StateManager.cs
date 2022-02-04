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
            case StoryObjects.Margaret:
                infos.Root = getMargsStory();
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
                toReturn = new DialogTreeNode("Aah, old friend, good to see you, I am glad you could come here so promptly.", "Edgar");
                toReturn.ChildNodes.Add(new DialogTreeNode("It has been a long time so of course you have not met my second wife. Let me introduce you to my beloved Margaret.", "Edgar"));
                temp = toReturn.ChildNodes[0];
                temp.ChildNodes.Add(new DialogTreeNode("It is a pleasure. Edgar has told me everything about you and your keen sense for mysteries.", "Margaret"));
                temp = temp.ChildNodes[0];
                temp.ChildNodes.Add(new DialogTreeNode("Speaking of which, as you can surely gather from my letter, we are in dire need of you your help.", "Edgar"));
                temp = temp.ChildNodes[0];
                temp.ChildNodes.Add(new DialogTreeNode("A few days ago, Elizabeth was found dead in her room. My wife discovered her on the bed...", "Edgar"));
                temp = temp.ChildNodes[0];
                temp.ChildNodes.Add(new DialogTreeNode("Yes, when I entered there was blood everywhere and Elizabeth had a horrible wound on her neck. But the police ruled it an „accident “.", "Margaret"));
                temp = temp.ChildNodes[0];
                temp.ChildNodes.Add(new DialogTreeNode("They didn't even properly look around, those incompetent fools.", "Margaret"));
                temp = temp.ChildNodes[0];
                temp.ChildNodes.Add(new DialogTreeNode("That's why I immediately thought of you. You are the only one who can help us now. Please take a look around the house, maybe you can find some clues. ", "Edgar"));
                temp = temp.ChildNodes[0];
                temp.ChildNodes.Add(new DialogTreeNode("And you can also meet the rest of the family, they could have some information you can use.", "Edgar"));

                break;
        }
        return toReturn;
    }

    private DialogTreeNode getMargsStory()
    {
        DialogTreeNode toReturn = null;
        DialogTreeNode temp = null;
        switch (currentState)
        {
            case GameplayStates.INTRO:
                toReturn = new DialogTreeNode("Aah, old friend, good to see you, I am glad you could come here so promptly.", "Edgar");
                toReturn.ChildNodes.Add(new DialogTreeNode("It has been a long time so of course you have not met my second wife. Let me introduce you to my beloved Margaret.", "Edgar"));
                temp = toReturn.ChildNodes[0];
                temp.ChildNodes.Add(new DialogTreeNode("It is a pleasure. Edgar has told me everything about you and your keen sense for mysteries.", "Margaret"));
                temp = temp.ChildNodes[0];
                temp.ChildNodes.Add(new DialogTreeNode("Speaking of which, as you can surely gather from my letter, we are in dire need of you your help.", "Edgar"));
                temp = temp.ChildNodes[0];
                temp.ChildNodes.Add(new DialogTreeNode("A few days ago, Elizabeth was found dead in her room. My wife discovered her on the bed...", "Edgar"));
                temp = temp.ChildNodes[0];
                temp.ChildNodes.Add(new DialogTreeNode("Yes, when I entered there was blood everywhere and Elizabeth had a horrible wound on her neck. But the police ruled it an „accident “.", "Margaret"));
                temp = temp.ChildNodes[0];
                temp.ChildNodes.Add(new DialogTreeNode("They didn't even properly look around, those incompetent fools.", "Margaret"));
                temp = temp.ChildNodes[0];
                temp.ChildNodes.Add(new DialogTreeNode("That's why I immediately thought of you. You are the only one who can help us now. Please take a look around the house, maybe you can find some clues. ", "Edgar"));
                temp = temp.ChildNodes[0];
                temp.ChildNodes.Add(new DialogTreeNode("And you can also meet the rest of the family, they could have some information you can use.", "Edgar"));

                break;
        }
        return toReturn;
    }
}
