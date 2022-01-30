using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;

public class GotoScene : MonoBehaviour, IPointerClickHandler
{
    [SerializeField] string sceneName;
    [SerializeField] bool toPrevScene;
    [SerializeField] RectTransform hideTo;

    public void OnPointerClick(PointerEventData eventData)
    {
        if (hideTo != null)
        {
            hideTo.SetAsLastSibling();
            return;
        }
        if (toPrevScene)
        {
            sceneName = PlayerPrefs.GetString(PlayerPrefKeys.PREV_SCENE);
        }
        PlayerPrefs.SetString(PlayerPrefKeys.PREV_SCENE, SceneManager.GetActiveScene().name);
        SceneManager.LoadScene(sceneName);
    }
}