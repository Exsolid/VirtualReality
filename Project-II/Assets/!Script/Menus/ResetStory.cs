using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;
public class ResetStory : MonoBehaviour
{
    [SerializeField] private string sceneName;
    private void Awake()
    {
        PlayerPrefs.SetInt(PlayerPrefKeys.GAMEPLAY_STATE, (int)GameplayStates.INTRO);
        SceneManager.LoadScene(sceneName);
    }
}
