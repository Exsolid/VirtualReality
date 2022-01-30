using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;


public class Unpause : MonoBehaviour, IPointerClickHandler
{
    [SerializeField] private PauseGame pauseGameScript;
    public void OnPointerClick(PointerEventData eventData)
    {
        pauseGameScript.togglePause();
    }
}