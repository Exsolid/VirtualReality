using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Crosshair : MonoBehaviour
{
    [SerializeField] private Canvas canvas;
    private Image dot;
    private RaycastHit hitInteractable;
    [SerializeField] private Color interactionColor;
    [SerializeField] private Color idleColor;
    // Start is called before the first frame update
    void Start()
    {
        dot = canvas.GetComponentInChildren<Image>();
    }

    // Update is called once per frame
    void Update()
    {
        Physics.Raycast(Camera.main.transform.position + Camera.main.transform.forward * 0.6f, Camera.main.transform.forward, out hitInteractable, 2, 11 << 11);
        if (hitInteractable.transform != null && hitInteractable.collider.gameObject.GetComponent<InteractableInfos>().InteractableAfter <= GetComponent<StateManager>().CurrentState)
        {
            dot.color = interactionColor;
        }
        else
        {
            dot.color = idleColor;
        }
    }

    public void showCrosshair()
    {
        canvas.enabled = true;
    }
    public void hideCrosshair()
    {
        canvas.enabled = false;
    }
}
