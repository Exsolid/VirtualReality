using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class ToVR : MonoBehaviour
{

    private RaycastHit hitDisplay;
    [SerializeField] private string toVRTag;
    [SerializeField] private string vrSceneName;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        Physics.Raycast(Camera.main.transform.position, Camera.main.transform.forward, out hitDisplay, 10, 1 << 5);
        Debug.DrawRay(Camera.main.transform.position, Camera.main.transform.forward, Color.green, Time.deltaTime, false);
        if (hitDisplay.transform != null )Debug.Log(hitDisplay.collider.gameObject.name);
        if (hitDisplay.transform != null && hitDisplay.collider.tag.Equals(toVRTag)){
            SceneManager.LoadScene(vrSceneName);
        }
    }
}
