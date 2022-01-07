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
    // Start is called before the first frame update
    void Start()
    {
        input = GetComponent<PlayerInput>();
        input.actions[returnActionName].performed +=
                         context =>
                         {
                             SceneManager.LoadScene(sceneName);
                         };
    }
}
