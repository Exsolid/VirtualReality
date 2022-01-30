using UnityEngine;
using System.Collections.Generic;
using UnityEngine.EventSystems;

public class DebugMouse : MonoBehaviour
{

    public Camera mainCamera;

    // Update is called once per frame
    void Update()
    {
        IsPointerOverUIElement();
    }
    public static bool IsPointerOverUIElement()
    {
        foreach (var eventData2 in GetEventSystemRaycastResults())
        {
            Debug.Log(eventData2.ToString());
        }
        return IsPointerOverUIElement(GetEventSystemRaycastResults());
    }
    ///Returns 'true' if we touched or hovering on Unity UI element.
    public static bool IsPointerOverUIElement(List<RaycastResult> eventSystemRaysastResults)
    {
        for (int index = 0; index < eventSystemRaysastResults.Count; index++)
        {
            RaycastResult curRaysastResult = eventSystemRaysastResults[index];
            if (curRaysastResult.gameObject.layer == LayerMask.NameToLayer("UI"))
                return true;
        }
        return false;
    }
    ///Gets all event systen raycast results of current mouse or touch position.
    static List<RaycastResult> GetEventSystemRaycastResults()
    {
        PointerEventData eventData = new PointerEventData(EventSystem.current);
        eventData.position = Input.mousePosition;
        List<RaycastResult> raysastResults = new List<RaycastResult>();
        EventSystem.current.RaycastAll(eventData, raysastResults);
        return raysastResults;
    }
}