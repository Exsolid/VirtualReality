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

    [SerializeField] private Image shownText;
    [SerializeField] private Image shownDescriptor;
    [SerializeField] private Image option1;
    [SerializeField] private Image option2;

    [SerializeField] private Camera objectCam;
    private RaycastHit hitInteractable;

    [SerializeField] private string interactingLayerName;
    [SerializeField] private string interactableLayerName;

    private GameObject objectInUse;

    private DialogTreeNode currentText;

    private int selectedOption;
    void Update()
    {
        if(objectInUse != null && !GetComponent<PauseGame>().IsPaused)
        {
            if (input.actions[returnActionName].triggered || input.actions[interactActionName].triggered)
            {
                resetInteraction();
            }
            return;
        }

        if (input.actions[interactActionName].triggered && !GetComponent<PauseGame>().IsPaused)
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
        if (infos.FocusOnObject && (GetComponent<StateManager>().getCurrentInfos(infos.StoryObject).Root != null || !infos.ShownText.Equals("")))
        {
            gameObject.GetComponent<Movement>().LockRotation = true;
            gameObject.GetComponent<Movement>().LockPosition = true;
            Cursor.lockState = CursorLockMode.Confined;
            Cursor.visible = true;
            if (GetComponent<StateManager>().getCurrentInfos(infos.StoryObject).TalkingPoint != Vector3.zero) GetComponent<Movement>().rotateTo(GetComponent<StateManager>().getCurrentInfos(infos.StoryObject).TalkingPoint);
            else GetComponent<Movement>().rotateTo(objectInUse.transform.position);
        }
        if (GetComponent<StateManager>().getCurrentInfos(infos.StoryObject).Root != null || !infos.ShownText.Equals(""))
        {
            selectedOption = -1;
            currentText = GetComponent<StateManager>().getCurrentInfos(infos.StoryObject).Root;
            if (currentText != null && currentText.Options.Count == 2)
            {
                option1.enabled = true;
                option2.enabled = true;
                option1.GetComponentInChildren<Text>().text = currentText.Options[0];
                option2.GetComponentInChildren<Text>().text = currentText.Options[1];

            }
            else if (currentText != null && currentText.Options.Count == 1)
            {
                option1.enabled = true;
                option1.GetComponentInChildren<Text>().text = currentText.Options[0];
            }
            shownText.GetComponentInChildren<Text>().text = currentText == null ? infos.ShownText : currentText.ShownText;
            shownText.enabled = true;

            shownDescriptor.GetComponentInChildren<Text>().text = currentText == null ? infos.Descriptor : currentText.Descriptor;
            shownDescriptor.enabled = true;
        }
        if (infos.Moveable)
        {
            Rigidbody rb = objectInUse.GetComponent<Rigidbody>();
            rb.AddTorque(Vector3.one*20*Mathf.Sign(transform.position.x - objectInUse.transform.position.x));
            objectInUse = null;
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
            if (currentText != null && currentText.Options.Count == 0 && currentText.ChildNodes.Count == 1) currentText = currentText.ChildNodes[0];
            else if(currentText != null && currentText.Options.Count > 0)
            {
                switch (selectedOption)
                {
                    case -1:
                        return;
                    case 0:
                        if (currentText.ChildNodes[0].ShownText != "") currentText = currentText.ChildNodes[0];
                        else currentText = null;
                        break;
                    case 1:
                        if (currentText.ChildNodes[1].ShownText != "") currentText = currentText.ChildNodes[1];
                        else currentText = null;
                        break;
                }
                selectedOption = -1;
                option1.enabled = false;
                option2.enabled = false;
                option1.GetComponentInChildren<Text>().text = "";
                option2.GetComponentInChildren<Text>().text = "";
                if (currentText != null && currentText.Options.Count == 2)
                {
                    option1.enabled = true;
                    option2.enabled = true;
                    option1.GetComponentInChildren<Text>().text = currentText.Options[0];
                    option2.GetComponentInChildren<Text>().text = currentText.Options[1];
                }
                else if (currentText != null && currentText.Options.Count == 1)
                {
                    option1.enabled = true;
                    option1.GetComponentInChildren<Text>().text = currentText.Options[0];
                }
            }
            else currentText = null;
            if (currentText != null)
            {
                shownText.GetComponentInChildren<Text>().text = currentText.ShownText;
                shownText.enabled = true;

                shownDescriptor.GetComponentInChildren<Text>().text = currentText.Descriptor;
                shownDescriptor.enabled = true;
                if(currentText.NextState != 0) GetComponent<StateManager>().setState(currentText.NextState);
                return;
            }
            else
            {
                shownText.GetComponentInChildren<Text>().text = "";
                shownText.GetComponentInChildren<Image>().enabled = false;
                shownDescriptor.GetComponentInChildren<Text>().text = "";
                shownDescriptor.GetComponentInChildren<Image>().enabled = false;
            }

            if (infos.UseBlur)
            {
                volumeProfile.components.Find(component => component.name.Equals("Blur")).active = false;
                objectInUse.layer = LayerMask.NameToLayer(interactableLayerName);
                Camera.main.cullingMask |= 1 << LayerMask.NameToLayer(interactingLayerName);
                objectCam.cullingMask &= ~(1 << LayerMask.NameToLayer(interactingLayerName));
            }
            if (infos.FocusOnObject)
            {
                gameObject.GetComponent<Movement>().LockRotation = false;
                gameObject.GetComponent<Movement>().LockPosition = false;
                Cursor.lockState = CursorLockMode.Locked;
                Cursor.visible = false;
            }
            objectInUse = null;
        }
    }

    private void OnDestroy()
    {
        volumeProfile.components.Find(component => component.name.Equals("Blur")).active = false;
    }

    public bool isInteracting()
    {
        return objectInUse != null;
    }

    public bool setOption(int option)
    {
        if (currentText != null && option < currentText.Options.Count)
        {
            selectedOption = option;
            return true;
        }
        return false;
    }
}
