using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class ColorTintBecauseUnityDoesntWantTo : MonoBehaviour, IPointerExitHandler, IPointerEnterHandler
{
    [SerializeField] Color highlight;
    [SerializeField] Color normal;
    [SerializeField] Canvas parentCanvas;
    public void OnPointerExit(PointerEventData eventData)
    {
        GetComponent<Image>().color = normal;
    }
    public void OnPointerEnter(PointerEventData eventData)
    {
        GetComponent<Image>().color = highlight;
    }

    public void Update()
    {
        if(!parentCanvas.enabled) GetComponent<Image>().color = normal;
    }
}
