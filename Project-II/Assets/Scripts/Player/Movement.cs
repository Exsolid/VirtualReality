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


    // Start is called before the first frame update
    void Start()
    {
        input = GetComponent<PlayerInput>();
        controller = GetComponent<CharacterController>();
    }

    // Update is called once per frame
    void Update()
    {
        turnView();
        if(!lockPosition) move();
    }

    private void turnView()
    {
        Vector2 mouse = input.actions[viewActionName].ReadValue<Vector2>();
        Quaternion rotation = Quaternion.RotateTowards(gameObject.transform.rotation, Quaternion.Euler(gameObject.transform.rotation.eulerAngles.x+ mouse.y *-1, gameObject.transform.rotation.eulerAngles.y + mouse.x , 0), mouseSensitivity * Time.deltaTime * 10);
        gameObject.transform.rotation = Quaternion.Euler((Mathf.Abs(rotation.eulerAngles.x - 180) < 115) ? gameObject.transform.rotation.eulerAngles.x : rotation.eulerAngles.x,  rotation.eulerAngles.y, 0);
    }

    private void move()
    {
        Vector2 movement = input.actions[movementActionName].ReadValue<Vector2>();

        controller.enabled = true;
        controller.Move(Time.deltaTime * movementSpeed * movement.y * Camera.main.transform.forward);
        controller.Move(Time.deltaTime * movementSpeed * movement.x * Camera.main.transform.right);
        controller.enabled = false;
    }
}
