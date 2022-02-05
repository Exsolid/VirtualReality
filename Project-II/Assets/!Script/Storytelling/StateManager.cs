using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StateManager : MonoBehaviour
{
    private int currentState;
    [SerializeField] private GameObject edgar;
    [SerializeField] private GameObject marg;
    [SerializeField] private GameObject camilla;
    [SerializeField] private GameObject cassilda;
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
            case StoryObjects.Camilla:
                infos = getCamillasStory(infos);
                break;
            case StoryObjects.Cassilda:
                infos = getCassildasStory(infos);
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
                temp = temp.ChildNodes[0];

                rotateTo = (edgar.transform.position + marg.transform.position) / 2;
                rotateTo.y += 1.25f;
                infos.TalkingPoint = rotateTo;
                temp.NextState = GameplayStates.CHAPTER_ONE;
                break;

            case GameplayStates.CHAPTER_ONE:
            case GameplayStates.CHAPTER_ONE_UNSOLVED:
                root = new DialogTreeNode("My friend, can I help you with anything?", "Edgar");
                root.Options.Add("How was your relationship with Elizabeth?");
                root.ChildNodes.Add(new DialogTreeNode("She meant the world to me and was the spitting image of my late wife...", "Edgar"));
                temp = root.ChildNodes[0];
                temp.Options.Add("Did Elizabeth ever argue with anyone?");
                temp.ChildNodes.Add(new DialogTreeNode("No, never. She was kind and gentle and everyone loved her.", "Edgar"));
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
                temp = temp.ChildNodes[0];

                rotateTo = (edgar.transform.position + marg.transform.position) / 2;
                rotateTo.y += 1.25f;
                infos.TalkingPoint = rotateTo;
                temp.NextState = GameplayStates.CHAPTER_ONE;
                break;
            case GameplayStates.CHAPTER_ONE:
            case GameplayStates.CHAPTER_ONE_UNSOLVED:
                root = new DialogTreeNode("Yes? Do you need anything?", "Margaret");
                root.Options.Add("How was your relationship with Elizabeth?");
                root.ChildNodes.Add(new DialogTreeNode("She might not have been my own daughter, but I loved her just the same.", "Margaret"));
                temp = root.ChildNodes[0];
                temp.Options.Add("Did Elizabeth ever argue with anyone?");
                temp.ChildNodes.Add(new DialogTreeNode("Oh, just the usual banter between siblings. But I assure you both of my daughters loved her like a sister.", "Margaret"));
                temp = temp.ChildNodes[0];
                temp.Options.Add("I don't have any more questions at the moment.");
                temp.Options.Add("Have you perhaps seen the key to the living room?");
                temp.ChildNodes.Add(new DialogTreeNode("", "Margaret"));
                temp.ChildNodes.Add(new DialogTreeNode("No, I have not, I'm sorry.", "Margaret"));
                temp = temp.ChildNodes[0];
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

    private StoryInfos getCamillasStory(StoryInfos infos)
    {
        DialogTreeNode root = null;
        DialogTreeNode temp;
        Vector3 rotateTo = Vector3.zero;
        switch (currentState)
        {
            case GameplayStates.INTRO:

                break;

            case GameplayStates.CHAPTER_ONE:
            case GameplayStates.CHAPTER_ONE_UNSOLVED:
                root = new DialogTreeNode("Yes??", "Camilla");
                root.Options.Add("Who are you?");
                root.ChildNodes.Add(new DialogTreeNode("I'm Camilla Thompson", "Camilla"));
                temp = root.ChildNodes[0];
                temp.Options.Add("How was your relationship with Elizabeth?");
                temp.ChildNodes.Add(new DialogTreeNode("I'm not fussed about her, to be honest.", "Margaret"));
                temp = temp.ChildNodes[0];
                temp.Options.Add("Did Elizabeth ever argue with anyone?");
                temp.ChildNodes.Add(new DialogTreeNode("Of course, she did. She always thought herself to be better than others and liked to show that.", "Camilla"));
                temp = temp.ChildNodes[0];
                temp.Options.Add("I don't have any more questions at the moment.");
                temp.Options.Add("Have you perhaps seen the key to the living room?");
                temp.ChildNodes.Add(new DialogTreeNode("", "Camilla"));
                temp.ChildNodes.Add(new DialogTreeNode("No, I have not. Sometimes things just go missing in this house, it's really weird.", "Camilla"));
                temp = temp.ChildNodes[0];
                break;
        }
        if (rotateTo == Vector3.zero)
        {
            rotateTo = camilla.transform.position;
            rotateTo.y += 1.25f;
            infos.TalkingPoint = rotateTo;
        }
        infos.Root = root;
        return infos;
    }
    private StoryInfos getCassildasStory(StoryInfos infos)
    {
        DialogTreeNode root = null;
        DialogTreeNode temp;
        Vector3 rotateTo = Vector3.zero;
        switch (currentState)
        {
            case GameplayStates.INTRO:

                break;

            case GameplayStates.CHAPTER_ONE:
                root = new DialogTreeNode("Hello there, you must be the detective Edgar has been talking about! That's so exciting! Of course, I will help however I can.", "Cassilda");
                root.Options.Add("Who are you?");
                root.ChildNodes.Add(new DialogTreeNode("Oh, where are my manners? I am Cassilda Thompson, Margaret’s daughter. Edgar is my stepfather. The grumpy one over there is my twin sister.", "Cassilda"));
                temp = root.ChildNodes[0];
                temp.Options.Add("How was your relationship with Elizabeth?");
                temp.ChildNodes.Add(new DialogTreeNode("She was a great person, and we were the best of friends, almost inseparable. What happened to her is such a tragedy.", "Cassilda"));
                temp = temp.ChildNodes[0];
                temp.Options.Add("Did Elizabeth ever argue with anyone?");
                temp.ChildNodes.Add(new DialogTreeNode("Well... Elizabeth could be a handful, and not everyone was as good at dealing with her moods as I was. But we don't want to speak ill of the dead, do we?", "Cassilda"));
                temp = temp.ChildNodes[0];
                temp.Options.Add("I don't have any more questions at the moment.");
                temp.Options.Add("Have you perhaps seen the key to the living room?");
                temp.ChildNodes.Add(new DialogTreeNode("", "Cassilda"));
                temp.ChildNodes.Add(new DialogTreeNode("Well, I might have an idea where it could be.... but I'm only going to tell you if you help me first.", "Cassilda"));
                temp = temp.ChildNodes[1];
                temp.ChildNodes.Add(new DialogTreeNode("You see, I have invited some friends from Cornwall for tea, but I can't seem to remember the difference between Cornish Cream Tea and Devonshire Cream Tea.", "Cassilda"));
                temp = temp.ChildNodes[0];
                temp.ChildNodes.Add(new DialogTreeNode("Could you please find out the difference for me? It would be very embarrassing for me to get it wrong.", "Cassilda"));
                temp = temp.ChildNodes[0];
                temp.NextState = GameplayStates.CHAPTER_ONE_UNSOLVED;
                break;
            case GameplayStates.CHAPTER_ONE_UNSOLVED:
                root = new DialogTreeNode("So? Did you find the answer?", "Cassilda");
                root.Options.Add("No, I have not.");
                root.ChildNodes.Add(new DialogTreeNode("", "Camilla"));
                break;
        }
        if (rotateTo == Vector3.zero)
        {
            rotateTo = cassilda.transform.position;
            rotateTo.y += 1.25f;
            infos.TalkingPoint = rotateTo;
        }
        infos.Root = root;
        return infos;
    }

    private StoryInfos temp(StoryInfos infos)
    {
        DialogTreeNode root = null;
        DialogTreeNode temp;
        Vector3 rotateTo = Vector3.zero;
        switch (currentState)
        {
            case GameplayStates.INTRO:
                
                break;

            case GameplayStates.CHAPTER_ONE:
            case GameplayStates.CHAPTER_ONE_UNSOLVED:

                break;
        }
        if (rotateTo == Vector3.zero)
        {
            rotateTo = camilla.transform.position;
            rotateTo.y += 1.25f;
            infos.TalkingPoint = rotateTo;
        }
        infos.Root = root;
        return infos;
    }
}
