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
    private bool mayPause;
    public bool MayPause { get { return mayPause; } set { mayPause = value; } }

    private bool mayUnlockRotation;
    private bool mayUnlockPosition;

    private Crosshair cross;

    void Start()
    {
        mayPause = true;
        cross = GetComponent<Crosshair>();
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
        if (mayPause &&(GetComponent<Interact>() == null || !GetComponent<Interact>().isInteracting()))
        {
            isPaused = !isPaused;
            pauseMenu.enabled = isPaused;
            if (isPaused)
            {
                if(cross != null) cross.hideCrosshair();
                mayUnlockRotation = GetComponent<Movement>().LockRotation;
                mayUnlockPosition = GetComponent<Movement>().LockPosition;
                GetComponent<Movement>().LockRotation = true;
                GetComponent<Movement>().LockPosition = true;
                Cursor.lockState = CursorLockMode.Confined;
                Cursor.visible = true;
            }
            else
            {
                if (cross != null) cross.showCrosshair();
                mainPause.SetAsLastSibling();
                GetComponent<Movement>().LockRotation = mayUnlockRotation;
                GetComponent<Movement>().LockPosition = mayUnlockPosition;
                Cursor.lockState = CursorLockMode.Locked;
                Cursor.visible = false;
            }
        }
    }
}
