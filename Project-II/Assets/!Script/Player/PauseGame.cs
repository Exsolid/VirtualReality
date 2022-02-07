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
    public bool IsPaused { get { return isPaused; } set { isPaused = value;  } }

    private bool mayUnlockRotation;
    private bool mayUnlockPosition;

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
        if (GetComponent<Interact>() == null || !GetComponent<Interact>().isInteracting())
        {
            isPaused = !isPaused;
            pauseMenu.enabled = isPaused;
            if (isPaused)
            {
                mayUnlockRotation = GetComponent<Movement>().LockRotation;
                mayUnlockPosition = GetComponent<Movement>().LockPosition;
                GetComponent<Movement>().LockRotation = true;
                GetComponent<Movement>().LockPosition = true;
                Cursor.lockState = CursorLockMode.Confined;
                Cursor.visible = true;
            }
            else
            {
                mainPause.SetAsLastSibling();
                GetComponent<Movement>().LockRotation = mayUnlockRotation;
                GetComponent<Movement>().LockPosition = mayUnlockPosition;
                Cursor.lockState = CursorLockMode.Locked;
                Cursor.visible = false;
            }
        }
    }
}
