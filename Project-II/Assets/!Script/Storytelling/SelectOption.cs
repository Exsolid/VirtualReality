using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class SelectOption : MonoBehaviour, IPointerClickHandler
{
    enum Option
    {
        One,
        Two,
        Three,
        Four,
        Five
    };
    [SerializeField] private Option option;
    public void OnPointerClick(PointerEventData eventData)
    {
        if (GetComponent<Image>() != null && GetComponent<Image>().enabled == false) return;
        switch (option)
        {
            case Option.One:
                if (FindObjectOfType<Interact>().setOption(0))
                FindObjectOfType<Interact>().resetInteraction();
                break;
            case Option.Two:
                if(FindObjectOfType<Interact>().setOption(1))
                FindObjectOfType<Interact>().resetInteraction();
                break;
            case Option.Three:
                if (FindObjectOfType<Interact>().setOption(2))
                    FindObjectOfType<Interact>().resetInteraction();
                break;
            case Option.Four:
                if (FindObjectOfType<Interact>().setOption(3))
                    FindObjectOfType<Interact>().resetInteraction();
                break;
            case Option.Five:
                if (FindObjectOfType<Interact>().setOption(4))
                    FindObjectOfType<Interact>().resetInteraction();
                break;
        }
    }
}
