using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.InputSystem;
using UnityEngine.UI;

public class Interact : MonoBehaviour
{
    [SerializeField] private string interactActionName;
    [SerializeField] private string returnActionName;
    [SerializeField] private PlayerInput input;

    //[SerializeField] private Camera focusCamera;
    [SerializeField] private VolumeProfile volumeProfile;

    [SerializeField] private Text textBox;

    private RaycastHit hitInteractable;

    private GameObject objectInUse;

    // Update is called once per frame
    void Update()
    {
        if(objectInUse != null)
        {
            if (input.actions[returnActionName].triggered || input.actions[interactActionName].triggered)
            {
                resetInteraction();
                objectInUse = null;
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
        InteractableInfos infos = objectInUse.GetComponent<InteractableInfos>();
        //focusCamera.enabled = true;
        //focusCamera.transform.LookAt(objectInUse.transform);
        if (infos.UseBlur) volumeProfile.components.Find(component => component.name.Equals("Blur")).active = true;
        if (infos.FocusOnObject) gameObject.GetComponent<Movement>().LockRotation = true;
        if (infos.ShownText.Length > 0)
        {
            string builder = "";
            foreach(string st in infos.ShownText)
            {
                builder += st + "\n";
            }
            textBox.text = builder;
        }
    }

    private void resetInteraction()
    {
        //focusCamera.enabled = false;
        InteractableInfos infos = objectInUse.GetComponent<InteractableInfos>();
        if (infos.UseBlur) volumeProfile.components.Find(component => component.name.Equals("Blur")).active = false;
        if (infos.FocusOnObject) gameObject.GetComponent<Movement>().LockRotation = false;
        if (infos.ShownText.Length > 0) textBox.text = "";
    }
}
