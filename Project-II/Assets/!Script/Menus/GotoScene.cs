using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;

public class GotoScene : MonoBehaviour, IPointerClickHandler
{
    [SerializeField] string sceneName;

    public void OnPointerClick(PointerEventData eventData)
    {
        SceneManager.LoadScene(sceneName);
    }
}