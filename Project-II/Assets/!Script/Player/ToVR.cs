using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using UnityEngine.InputSystem;

public class ToVR : MonoBehaviour
{

    private RaycastHit hitDisplay;
    [SerializeField] private string toVRTag;
    [SerializeField] private string vrSceneName;
    [SerializeField] private string interactActionName;
    [SerializeField] private PlayerInput input;

    [SerializeField] private Canvas fadeCanvas;
    private Image fadeToBlack;
    private bool isClicked;

    // Start is called before the first frame update
    void Start()
    {
        fadeToBlack = fadeCanvas.GetComponentInChildren<Image>();
        input = GetComponent<PlayerInput>();
    }

    // Update is called once per frame
    void Update()
    {
        if (input.actions[interactActionName].triggered)
        {
            Physics.Raycast(Camera.main.transform.position, Camera.main.transform.forward, out hitDisplay, 10, 1 << 5);

            if (hitDisplay.transform != null && hitDisplay.collider.tag.Equals(toVRTag) && !isClicked)
            {
                fadeCanvas.enabled = true;
                isClicked = true;
                StartCoroutine(fadeIn());
            }
        }
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
        SceneManager.LoadScene(vrSceneName);
    }
}
