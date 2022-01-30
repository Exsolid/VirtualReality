using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class PauseGame : MonoBehaviour
{
    [SerializeField] private string returnActionName;
    [SerializeField] private PlayerInput input;
    [SerializeField] private Canvas pauseMenu;
    [SerializeField] RectTransform mainPause;
    private bool isPaused;

    private bool mayUnlockRotation;

    void Start()
    {
    }

    // Update is called once per frame
    void Update()
    {
        if (input.actions[returnActionName].triggered)
        {
            togglePause();
        }
    }

    public void togglePause()
    {
        isPaused = !isPaused;
        pauseMenu.enabled = isPaused;
        if (isPaused)
        {
            mayUnlockRotation = GetComponent<Movement>().LockRotation;
            GetComponent<Movement>().LockRotation = true;
            GetComponent<Interact>().resetInteraction();
            Cursor.lockState = CursorLockMode.Confined;
            Cursor.visible = true;
        }
        else
        {
            mainPause.SetAsLastSibling();
            GetComponent<Movement>().LockRotation = mayUnlockRotation;
            GetComponent<Interact>().resetInteraction();
            Cursor.lockState = CursorLockMode.Locked;
            Cursor.visible = false;
        }
    }
}
