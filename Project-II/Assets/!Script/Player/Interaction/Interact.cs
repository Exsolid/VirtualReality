using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.InputSystem;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using AudioBuddyTool;

public class Interact : MonoBehaviour
{
    [SerializeField] private string interactActionName;
    [SerializeField] private string returnActionName;
    [SerializeField] private PlayerInput input;
    [SerializeField] private VolumeProfile volumeProfile;

    [SerializeField] private Image textBox;
    [SerializeField] private Image textBoxOptionsSmall;
    [SerializeField] private Image textBoxOptionsBig;
    [SerializeField] private Image pointer;
    private Text displayText = null;
    private Text descriptorText = null;
    private List<Text> options = new List<Text>();
    private Image currentImage = null;

    [SerializeField] private Camera objectCam;
    private RaycastHit hitInteractable;

    [SerializeField] private string interactingLayerName;
    [SerializeField] private string interactableLayerName;

    public GameObject ObjectInUse { get { return objectInUse; }  set { objectInUse = value; } }
    private GameObject objectInUse;
    private GameObject objectToShow;

    private DialogTreeNode currentText;

    private int selectedOption;

    public bool MayInteract { get { return mayInteract; } set { mayInteract = value; } }
    private bool mayInteract;
    private void Start()
    {
    }

    void Update()
    {
        if (objectInUse != null && !GetComponent<PauseGame>().IsPaused)
        {
            if (input.actions[returnActionName].triggered || input.actions[interactActionName].triggered)
            {
                resetInteraction();
            }
            return;
        }

        if (input.actions[interactActionName].triggered && !GetComponent<PauseGame>().IsPaused)
        {
            Physics.Raycast(Camera.main.transform.position + Camera.main.transform.forward * 0.6f, Camera.main.transform.forward, out hitInteractable, 2, 11 << 11);
            if (hitInteractable.transform != null && hitInteractable.collider.gameObject.GetComponent<InteractableInfos>().InteractableAfter <= GetComponent<StateManager>().CurrentState)
            {
                objectInUse = hitInteractable.collider.gameObject;
                interact();
            }
        }
    }

    public void interact()
    {
        if (!mayInteract) return;
        InteractableInfos infos = objectInUse.GetComponent<InteractableInfos>();
        if(objectInUse.GetComponent<PlaySoundsOnInteraction>() != null)
        {
            objectInUse.GetComponent<PlaySoundsOnInteraction>().playSound();
        }
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
            else GetComponent<Movement>().rotateTo(objectInUse.transform.position + infos.RepositionFocus);
        }
        if (GetComponent<StateManager>().getCurrentInfos(infos.StoryObject).Root != null || !infos.ShownText.Equals(""))
        {
            selectedOption = -1;
            currentText = GetComponent<StateManager>().getCurrentInfos(infos.StoryObject).Root;
            updateTextFields();
            if(currentText != null)
            {
                for (int i = 0; i < currentText.Options.Count; i++)
                {
                    options[i].GetComponentInChildren<Text>().text = currentText.Options[i];
                }
            }

            displayText.text = currentText == null ? infos.ShownText : currentText.ShownText;
            currentImage.enabled = true;

            descriptorText.text = currentText == null ? infos.Descriptor : currentText.Descriptor;
            if (currentText != null && currentText.NextState != 0) GetComponent<StateManager>().updateCurrentState(currentText.NextState);
            if (currentText != null && currentText.ShowObject)
            {
                objectToShow = Instantiate(infos.ObjectToShow);
                objectToShow.transform.position = Camera.main.transform.position + Camera.main.transform.forward * 0.4f;
                objectToShow.layer = LayerMask.NameToLayer(interactingLayerName);
                objectInUse.layer = LayerMask.NameToLayer(interactableLayerName);
            }

            if (currentText != null && currentText.SoundToPlay != "" && currentText.SoundToPlay != null)
            {
                Debug.Log(currentText.SoundToPlay);
                AudioBuddy.Play(currentText.SoundToPlay, PlayerPrefs.GetFloat(PlayerPrefKeys.SOUND_VOLUME));
            }
            GetComponent<Crosshair>().hideCrosshair();
        }
        if (infos.Moveable)
        {
            Rigidbody rb = objectInUse.GetComponent<Rigidbody>();
            rb.AddTorque(Vector3.one * 20 * Mathf.Sign(transform.position.x - objectInUse.transform.position.x));
            objectInUse = null;
        }
        if (infos.GotoScene != "")
        {
            SceneManager.LoadScene(infos.GotoScene);
        }
    }

    public void resetInteraction()
    {
        if (objectInUse != null && mayInteract)
        {
            InteractableInfos infos = objectInUse.GetComponent<InteractableInfos>();
            if (objectInUse.GetComponent<PlaySoundsOnInteraction>() != null)
            {
                objectInUse.GetComponent<PlaySoundsOnInteraction>().playSound();
            }
            if (currentText != null && currentText.ChildNodes.Count > 0 && currentText.Options.Count == 0 && currentText.ChildNodes[0].ShownText != "") currentText = currentText.ChildNodes[0];
            else if (currentText != null && selectedOption != -1 && currentText.ChildNodes[selectedOption].ShownText != "") currentText = currentText.ChildNodes[selectedOption];
            else currentText = null;

            updateTextFields();
            if (currentText != null)
            {
                selectedOption = -1;
                if (currentText.SoundToPlay != "" && currentText.SoundToPlay != "" && currentText.SoundToPlay != null)
                {
                    AudioBuddy.Play(currentText.SoundToPlay, PlayerPrefs.GetFloat(PlayerPrefKeys.SOUND_VOLUME));
                }
                if (currentText != null)
                {
                    for (int i = 0; i < currentText.Options.Count; i++)
                    {
                        options[i].GetComponentInChildren<Text>().text = currentText.Options[i];
                    }
                }
                displayText.text = currentText == null ? infos.ShownText : currentText.ShownText;
                currentImage.enabled = true;

                descriptorText.text = currentText == null ? infos.Descriptor : currentText.Descriptor;
                if (currentText.NextState != 0) GetComponent<StateManager>().updateCurrentState(currentText.NextState);
                if (currentText != null && currentText.ShowObject && objectToShow == null)
                {
                    objectToShow = Instantiate(infos.ObjectToShow);
                    objectToShow.transform.position = Camera.main.transform.position + Camera.main.transform.forward * 0.4f;
                    objectToShow.transform.position += new Vector3(0,0.05f,0);
                    objectToShow.transform.LookAt(Camera.main.transform);
                    if (infos.RotateOnX) objectToShow.transform.Rotate(new Vector3(90,0,0), Space.Self);
                    objectToShow.layer = LayerMask.NameToLayer(interactingLayerName);
                    objectInUse.layer = LayerMask.NameToLayer(interactableLayerName);
                }
                if (objectToShow != null && !currentText.ShowObject)
                {
                    Destroy(objectToShow);
                    objectInUse.layer = LayerMask.NameToLayer(interactingLayerName);
                }
                return;
            }
            else
            {
                GetComponent<Crosshair>().showCrosshair();
                if (objectToShow != null)
                {
                    Destroy(objectToShow);
                    objectInUse.layer = LayerMask.NameToLayer(interactingLayerName);
                }
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

    private void updateTextFields()
    {
        if(displayText != null)
        {
            displayText.text = "";
        }

        if (descriptorText != null)
        {
            descriptorText.text = "";
        }

        for (int i = 0; i < options.Count; i++)
        {
            options[i].GetComponentInChildren<Text>().text = "";
        }

        options.Clear();
        if (currentImage != null) currentImage.enabled = false;

        textBoxOptionsBig.transform.Find("Option 1 I").GetComponent<Image>().enabled = false;
        textBoxOptionsBig.transform.Find("Option 2 I").GetComponent<Image>().enabled = false;
        textBoxOptionsBig.transform.Find("Option 4 I").GetComponent<Image>().enabled = false;
        textBoxOptionsBig.transform.Find("Option 5 I").GetComponent<Image>().enabled = false;
        textBoxOptionsBig.transform.Find("Option 3 I").GetComponent<Image>().enabled = false;
        textBoxOptionsSmall.transform.Find("Option 1 I").GetComponent<Image>().enabled = false;
        textBoxOptionsSmall.transform.Find("Option 2 I").GetComponent<Image>().enabled = false;

        pointer.enabled = false;

        if (currentText == null)
        {
            currentImage = textBox;
            displayText = textBox.transform.Find("Text").GetComponent<Text>();
            descriptorText = textBox.transform.Find("Descriptor").GetComponent<Text>();
            textBox.transform.SetAsLastSibling();
            return;
        }
        if (currentText.Options.Count == 0)
        {
            currentImage = textBox;
            displayText = textBox.transform.Find("Text").GetComponent<Text>();
            descriptorText = textBox.transform.Find("Descriptor").GetComponent<Text>();
            textBox.transform.SetAsLastSibling();
        }
        else if (currentText.Options.Count <= 2)
        {
            currentImage = textBoxOptionsSmall;
            displayText = textBoxOptionsSmall.transform.Find("Text").GetComponent<Text>();
            descriptorText = textBoxOptionsSmall.transform.Find("Descriptor").GetComponent<Text>();
            options.Add(textBoxOptionsSmall.transform.Find("Option 1 I").transform.Find("Option 1").GetComponent<Text>());
            options.Add(textBoxOptionsSmall.transform.Find("Option 2 I").transform.Find("Option 2").GetComponent<Text>());
            textBoxOptionsSmall.transform.Find("Option 1 I").GetComponent<Image>().enabled = true;
            textBoxOptionsSmall.transform.Find("Option 2 I").GetComponent<Image>().enabled = true;
            textBoxOptionsSmall.transform.SetAsLastSibling();
            pointer.enabled = true;
            pointer.transform.SetAsLastSibling();
        }
        else
        {
            currentImage = textBoxOptionsBig;
            displayText = textBoxOptionsBig.transform.Find("Text").GetComponent<Text>();
            descriptorText = textBoxOptionsBig.transform.Find("Descriptor").GetComponent<Text>();
            options.Add(textBoxOptionsBig.transform.Find("Option 1 I").transform.Find("Option 1").GetComponent<Text>());
            options.Add(textBoxOptionsBig.transform.Find("Option 2 I").transform.Find("Option 2").GetComponent<Text>());
            options.Add(textBoxOptionsBig.transform.Find("Option 3 I").transform.Find("Option 3").GetComponent<Text>());
            options.Add(textBoxOptionsBig.transform.Find("Option 4 I").transform.Find("Option 4").GetComponent<Text>());
            options.Add(textBoxOptionsBig.transform.Find("Option 5 I").transform.Find("Option 5").GetComponent<Text>());
            textBoxOptionsBig.transform.Find("Option 1 I").GetComponent<Image>().enabled = true;
            textBoxOptionsBig.transform.Find("Option 2 I").GetComponent<Image>().enabled = true;
            textBoxOptionsBig.transform.Find("Option 4 I").GetComponent<Image>().enabled = true;
            textBoxOptionsBig.transform.Find("Option 5 I").GetComponent<Image>().enabled = true;
            textBoxOptionsBig.transform.Find("Option 3 I").GetComponent<Image>().enabled = true;
            textBoxOptionsBig.transform.SetAsLastSibling();
            pointer.enabled = true;
            pointer.transform.SetAsLastSibling();
        }
    }
}
