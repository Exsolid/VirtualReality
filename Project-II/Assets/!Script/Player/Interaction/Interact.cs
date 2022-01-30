using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.InputSystem;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class Interact : MonoBehaviour
{
    [SerializeField] private string interactActionName;
    [SerializeField] private string returnActionName;
    [SerializeField] private PlayerInput input;
    [SerializeField] private VolumeProfile volumeProfile;

    [SerializeField] private Canvas canvasForDialog;
    [SerializeField] private Camera objectCam;
    private RaycastHit hitInteractable;

    [SerializeField] private string interactingLayerName;
    [SerializeField] private string interactableLayerName;

    private GameObject objectInUse;
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
        if (infos.UseBlur)
        {
            volumeProfile.components.Find(component => component.name.Equals("Blur")).active = true;
            objectInUse.layer = LayerMask.NameToLayer(interactingLayerName);
            Camera.main.cullingMask &= ~(1 << LayerMask.NameToLayer(interactingLayerName));
            objectCam.cullingMask |= 1 << LayerMask.NameToLayer(interactingLayerName);
        }
        if (infos.FocusOnObject) gameObject.GetComponent<Movement>().LockRotation = true;
        if (infos.ShownText.Length > 0)
        {
            string builder = "";
            for(int i = 0; i < infos.ShownText.Length; i++)
            {
                builder += infos.ShownText[i];
                if (i != infos.ShownText.Length - 1) builder += "\n";
            }
            builder.Remove(builder.Length-3, 2);
            canvasForDialog.GetComponentInChildren<Text>().text = builder;
            canvasForDialog.GetComponentInChildren<Image>().enabled = true;
        }
        if(infos.Moveable)
        {
            Rigidbody rb = objectInUse.GetComponent<Rigidbody>();
            rb.AddTorque(Vector3.one*20*Mathf.Sign(transform.position.x - objectInUse.transform.position.x));
        }
        if(infos.GotoScene != "")
        {
            SceneManager.LoadScene(infos.GotoScene);
        }
    }

    public void resetInteraction()
    {
        if(objectInUse != null)
        {
            InteractableInfos infos = objectInUse.GetComponent<InteractableInfos>();
            if (infos.UseBlur)
            {
                volumeProfile.components.Find(component => component.name.Equals("Blur")).active = false;
                objectInUse.layer = LayerMask.NameToLayer(interactableLayerName);
                Camera.main.cullingMask |= 1 << LayerMask.NameToLayer(interactingLayerName);
                objectCam.cullingMask &= ~(1 << LayerMask.NameToLayer(interactingLayerName));
            }
            if (infos.FocusOnObject) gameObject.GetComponent<Movement>().LockRotation = false;
            if (infos.ShownText.Length > 0)
            {
                canvasForDialog.GetComponentInChildren<Text>().text = "";
                canvasForDialog.GetComponentInChildren<Image>().enabled = false;
            }
        }
    }

    private void OnDestroy()
    {
        volumeProfile.components.Find(component => component.name.Equals("Blur")).active = false;
    }
}
