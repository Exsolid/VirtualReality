using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class Interact : MonoBehaviour
{
    [SerializeField] private string interactActionName;
    [SerializeField] private string returnActionName;
    [SerializeField] private PlayerInput input;
    [SerializeField] private Camera focusCamera;

    private RaycastHit hitInteractable;

    private GameObject objectInUse; 
    // Update is called once per frame
    void Update()
    {
        if(objectInUse != null)
        {
            if (input.actions[returnActionName].triggered)
            {

            }
            return;
        }

        if (input.actions[interactActionName].triggered)
        {
            Physics.Raycast(Camera.main.transform.position, Camera.main.transform.forward, out hitInteractable, 2, 11 << 11);

            if (hitInteractable.transform != null)
            {
                objectInUse = hitInteractable.collider.gameObject;
                interact();
            }
        }
    }

    private void interact()
    {
        focusCamera.enabled = true;
        focusCamera.transform.LookAt(objectInUse.transform);
    }

    private void resetInteraction()
    {
        focusCamera.enabled = false;
    }
}
