using UnityEngine;
using UnityEngine.EventSystems;


public class SelectOption : MonoBehaviour, IPointerClickHandler
{
    enum Option
    {
        One,
        Two,
        Three,
        Four
    };
    [SerializeField] private Option option;
    public void OnPointerClick(PointerEventData eventData)
    {
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
        }
    }
}
