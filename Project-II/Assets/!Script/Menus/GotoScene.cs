using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;
using UnityEngine.InputSystem;

public class GotoScene : MonoBehaviour, IPointerClickHandler
{
    [SerializeField] string sceneName;
    [SerializeField] Canvas toCanvas;
    [SerializeField] Canvas parentCanvas;
    [SerializeField] bool resetStory;
    [SerializeField] bool enableGoToOnReturn;
    [SerializeField] private string returnActionName;
    [SerializeField] private PlayerInput input;
    [SerializeField] private Canvas pauseMenuMain;

    public void OnPointerClick(PointerEventData eventData)
    {
        Goto();
    }

    private void Goto()
    {
        if (parentCanvas.enabled)
        {
            if (toCanvas != null)
            {
                toCanvas.enabled = true;
                toCanvas.transform.SetAsLastSibling();
                parentCanvas.enabled = false;
                return;
            }
            if (resetStory) PlayerPrefs.SetInt(PlayerPrefKeys.GAMEPLAY_STATE, (int)GameplayStates.INTRO);
            if (sceneName != null && sceneName != "") SceneManager.LoadScene(sceneName);
        }
    }
}