using System.Collections;
using System.Collections.Generic;
using UnityEngine.InputSystem;
using UnityEngine;

public class Movement : MonoBehaviour
{
    private PlayerInput input;
    private CharacterController controller;
    [SerializeField] private int mouseSensitivity;
    [SerializeField] private float movementSpeed;
    [SerializeField] private string movementActionName;
    [SerializeField] private string viewActionName;

    [SerializeField] private bool lockPosition;

    [SerializeField] private Camera secondCam;


    // Start is called before the first frame update
    void Start()
    {
        input = GetComponent<PlayerInput>();
        controller = GetComponent<CharacterController>();
    }

    // Update is called once per frame
    void LateUpdate()
    {
        turnView();
        if(!lockPosition) move();
    }

    private void turnView()
    {
        Vector2 mouse = input.actions[viewActionName].ReadValue<Vector2>();
        Quaternion rotation = Quaternion.Slerp(Camera.main.transform.rotation, Quaternion.Euler(Camera.main.transform.rotation.eulerAngles.x+ mouse.y *-1, Camera.main.transform.rotation.eulerAngles.y + mouse.x , 0), mouseSensitivity * Time.deltaTime * 10);
        Camera.main.transform.rotation = Quaternion.Euler((Mathf.Abs(rotation.eulerAngles.x - 180) < 115) ? Camera.main.transform.rotation.eulerAngles.x : rotation.eulerAngles.x,  rotation.eulerAngles.y, 0);
        secondCam.transform.rotation = Camera.main.transform.rotation;
    }

    private void move()
    {
        Vector2 movement = input.actions[movementActionName].ReadValue<Vector2>();

        controller.enabled = true;
        controller.Move(Time.deltaTime * movementSpeed * movement.y * Vector3.Scale(Camera.main.transform.forward, new Vector3(1 , 0, 1)));
        controller.Move(Time.deltaTime * movementSpeed * movement.x * Vector3.Scale(Camera.main.transform.right, new Vector3(1, 0, 1)));
        controller.enabled = false;
    }
}
