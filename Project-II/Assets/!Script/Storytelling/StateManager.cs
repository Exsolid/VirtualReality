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

    public void setState(int newState)
    {
        currentState = newState;
    }

    public StoryInfos getCurrentInfos(StoryObjects obj)
    {
        StoryInfos infos = new StoryInfos();
        switch (obj)
        {
            case StoryObjects.Edgar:
                infos = getEdgarsStory(infos);
                break;
            case StoryObjects.Margaret:
                infos = getMargsStory(infos);
                break;
            default:
                break;
        }
        return infos;
    }

    private StoryInfos getEdgarsStory(StoryInfos infos)
    {
        DialogTreeNode root = null;
        DialogTreeNode temp;
        Vector3 rotateTo = Vector3.zero;
        switch (currentState)
        {
            case GameplayStates.INTRO:
                root = new DialogTreeNode("Aah, old friend, good to see you, I am glad you could come here so promptly.", "Edgar");
                root.ChildNodes.Add(new DialogTreeNode("It has been a long time so of course you have not met my second wife. Let me introduce you to my beloved Margaret.", "Edgar"));
                temp = root.ChildNodes[0];
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

                rotateTo = (edgar.transform.position + marg.transform.position) / 2;
                rotateTo.y += 1.25f;
                infos.TalkingPoint = rotateTo;
                infos.NextState = GameplayStates.CHAPTER_ONE;
                break;

            case GameplayStates.CHAPTER_ONE:
                root = new DialogTreeNode("My friend, can I help you with anything?", "Edgar");
                root.Options.Add("How was your relationship with Elizabeth?");
                root.ChildNodes.Add(new DialogTreeNode("She meant the world to me and was the spitting image of my late wife...", "Edgar"));
                temp = root.ChildNodes[0];
                temp.Options.Add("Did Elizabeth ever argue with anyone?");
                temp.ChildNodes.Add(new DialogTreeNode("No, never. She was kind and gentle and eyeryone loved her.", "Edgar"));
                temp = temp.ChildNodes[0];
                temp.Options.Add("I don't have any more questions at the moment.");
                temp.Options.Add("Have you perhaps seen the key to the living room?");
                temp.ChildNodes.Add(new DialogTreeNode("", "Edgar"));
                temp.ChildNodes.Add(new DialogTreeNode("Not recently, is it locked again?", "Edgar"));
                temp = temp.ChildNodes[0];
                break;
        }
        if(rotateTo == Vector3.zero)
        {
            rotateTo = edgar.transform.position;
            rotateTo.y += 1.25f;
            infos.TalkingPoint = rotateTo;
        }
        infos.Root = root;
        return infos;
    }

    private StoryInfos getMargsStory(StoryInfos infos)
    {
        DialogTreeNode root = null;
        DialogTreeNode temp;
        Vector3 rotateTo = Vector3.zero;
        switch (currentState)
        {
            case GameplayStates.INTRO:
                root = new DialogTreeNode("Aah, old friend, good to see you, I am glad you could come here so promptly.", "Edgar");
                root.ChildNodes.Add(new DialogTreeNode("It has been a long time so of course you have not met my second wife. Let me introduce you to my beloved Margaret.", "Edgar"));
                temp = root.ChildNodes[0];
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

                rotateTo = (edgar.transform.position + marg.transform.position) / 2;
                rotateTo.y += 1.25f;
                infos.TalkingPoint = rotateTo;
                infos.NextState = GameplayStates.CHAPTER_ONE;
                break;
        }
        infos.Root = root;
        if (rotateTo == Vector3.zero)
        {
            rotateTo = marg.transform.position;
            rotateTo.y += 1.25f;
            infos.TalkingPoint = rotateTo;
        }
        return infos;
    }
}
