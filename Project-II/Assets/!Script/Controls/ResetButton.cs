
using UnityEngine;
using UnityEngine.EventSystems;

public class ResetButton : MonoBehaviour, IPointerClickHandler
{
    [SerializeField] private string control;
    [SerializeField] private string actionName;
    private ControlManager manager;

    private void Start()
    {
        manager = FindObjectOfType<ControlManager>();
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        if (control.Equals("")) manager.resetAllKeys();
        else manager.resetKey(control, actionName);
    }
}
