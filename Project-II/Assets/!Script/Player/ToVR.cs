using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.InputSystem;

public class ToVR : MonoBehaviour
{

    private RaycastHit hitDisplay;
    [SerializeField] private string toVRTag;
    [SerializeField] private string vrSceneName;
    [SerializeField] private string interactActionName;
    [SerializeField] private PlayerInput input;

    // Start is called before the first frame update
    void Start()
    {
        input = GetComponent<PlayerInput>();
    }

    // Update is called once per frame
    void Update()
    {
        if (input.actions[interactActionName].triggered)
        {
            Physics.Raycast(Camera.main.transform.position, Camera.main.transform.forward, out hitDisplay, 10, 1 << 5);

            if (hitDisplay.transform != null && hitDisplay.collider.tag.Equals(toVRTag))
            {
                SceneManager.LoadScene(vrSceneName);
            }
        }
    }
}
