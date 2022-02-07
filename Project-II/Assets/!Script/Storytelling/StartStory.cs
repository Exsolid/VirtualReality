using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.InputSystem;

public class StartStory : MonoBehaviour
{
    [SerializeField] private Canvas letter;
    [SerializeField] private string interactActionName;
    [SerializeField] private string returnActionName;
    [SerializeField] private PlayerInput input;
    [SerializeField] private GameObject edgar;
    [SerializeField] private Canvas fadeCanvas;
    private Image fadeToBlack;
    private bool mayUnlockRotation;
    private bool mayUnlockPosition;
    private bool isClicked;
    private bool finishedFadeOut;
    private bool finishedFadeIn;

    // Start is called before the first frame update
    void Start()
    {
        fadeToBlack = fadeCanvas.GetComponentInChildren<Image>();
        fadeToBlack.color = new Color(fadeToBlack.color.r, fadeToBlack.color.g, fadeToBlack.color.b, 1);
        mayUnlockRotation = GetComponent<Movement>().LockRotation;
        mayUnlockPosition = GetComponent<Movement>().LockPosition;
        GetComponent<Movement>().LockRotation = true;
        GetComponent<Movement>().LockPosition = true;
        if (GetComponent<StateManager>().CurrentState == GameplayStates.INTRO) letter.enabled = true;
        fadeCanvas.enabled = true;
        Cursor.lockState = CursorLockMode.Confined;
        GetComponent<Interact>().MayInteract = false;
        GetComponent<PauseGame>().MayPause = false;
        StartCoroutine(fadeOut());
    }

    // Update is called once per frame
    void Update()
    {
        if(GetComponent<StateManager>().CurrentState == GameplayStates.INTRO)
        {
            if (!isClicked && finishedFadeOut && (input.actions[returnActionName].triggered || input.actions[interactActionName].triggered))
            {
                isClicked = true;
                finishedFadeOut = false;
                StartCoroutine(fadeIn());
            }
            if (isClicked && finishedFadeIn)
            {
                finishedFadeIn = false;
                letter.enabled = false;
                StartCoroutine(fadeOut());
            }
            if (isClicked && finishedFadeOut)
            {
                GetComponent<Movement>().LockRotation = mayUnlockRotation;
                GetComponent<Movement>().LockPosition = mayUnlockPosition;
                Cursor.lockState = CursorLockMode.Locked;
                GetComponent<Interact>().MayInteract = true;
                GetComponent<Interact>().ObjectInUse = edgar;
                GetComponent<Interact>().interact();
                GetComponent<PauseGame>().MayPause = true;
                finishedFadeOut = false;
                fadeCanvas.enabled = false;
            }
        }
        else if(finishedFadeOut)
        {
            finishedFadeOut = false;
            GetComponent<Interact>().MayInteract = true;
            GetComponent<Movement>().LockRotation = mayUnlockRotation;
            GetComponent<Movement>().LockPosition = mayUnlockPosition;
            Cursor.lockState = CursorLockMode.Locked;
            GetComponent<PauseGame>().MayPause = true;
            fadeCanvas.enabled = false;
        }
    }

    IEnumerator fadeOut()
    {
        yield return new WaitForSeconds(1f);
        float value = 0;
        while (fadeToBlack.color.a > 0)
        {
            value += 0.01f;
            fadeToBlack.color = new Color(fadeToBlack.color.r, fadeToBlack.color.g, fadeToBlack.color.b, fadeToBlack.color.a- value);
            yield return new WaitForSeconds(0.07f);
        }
        fadeToBlack.color = new Color(fadeToBlack.color.r, fadeToBlack.color.g, fadeToBlack.color.b, 0);
        finishedFadeOut = true;
    }

    IEnumerator fadeIn()
    {
        float value = 0;
        while (fadeToBlack.color.a < 1)
        {
            value += 0.01f;
            fadeToBlack.color = new Color(fadeToBlack.color.r, fadeToBlack.color.g, fadeToBlack.color.b, fadeToBlack.color.a + value);
            yield return new WaitForSeconds(0.05f);
        }
        fadeToBlack.color = new Color(fadeToBlack.color.r, fadeToBlack.color.g, fadeToBlack.color.b, 1);
        finishedFadeIn = true;
    }
}
