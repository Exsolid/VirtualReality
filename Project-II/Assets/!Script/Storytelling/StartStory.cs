using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class StartStory : MonoBehaviour
{
    [SerializeField] private Canvas letter;
    [SerializeField] private string interactActionName;
    [SerializeField] private string returnActionName;
    [SerializeField] private PlayerInput input;
    [SerializeField] private GameObject edgar;
    private bool mayUnlockRotation;
    private bool mayUnlockPosition;
    private bool isDone;

    // Start is called before the first frame update
    void Start()
    {
        mayUnlockRotation = GetComponent<Movement>().LockRotation;
        mayUnlockPosition = GetComponent<Movement>().LockPosition;
        GetComponent<Movement>().LockRotation = true;
        GetComponent<Movement>().LockPosition = true;
        letter.enabled = true;
        Cursor.lockState = CursorLockMode.Confined;
        Cursor.visible = true;
        GetComponent<PauseGame>().IsPaused = true;
    }

    // Update is called once per frame
    void Update()
    {
        if (!isDone && (input.actions[returnActionName].triggered || input.actions[interactActionName].triggered))
        {
            GetComponent<Movement>().LockRotation = mayUnlockRotation;
            GetComponent<Movement>().LockPosition = mayUnlockPosition;
            Cursor.lockState = CursorLockMode.Locked;
            Cursor.visible = false;
            letter.enabled = false;
            GetComponent<PauseGame>().IsPaused = false;
            GetComponent<Interact>().ObjectInUse = edgar;
            GetComponent<Interact>().interact();
            isDone = true;
        }
    }
}
