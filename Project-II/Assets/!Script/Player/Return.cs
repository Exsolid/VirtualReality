using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.SceneManagement;

public class Return : MonoBehaviour
{
    [SerializeField] private string sceneName;
    [SerializeField] private string returnActionName;
    [SerializeField] private PlayerInput input;
    private float timer;
    // Start is called before the first frame update
    void Start()
    {
        timer = 1;
        input = GetComponent<PlayerInput>();
    }

    void Update()
    {
        if (timer >= 0) timer -= Time.deltaTime;
        if (timer <= 0 && input.actions[returnActionName].triggered) SceneManager.LoadScene(sceneName);
    }
}
