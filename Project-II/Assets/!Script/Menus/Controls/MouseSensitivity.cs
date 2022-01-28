using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MouseSensitivity : MonoBehaviour
{
    private Slider slider;
    private float currentValue;
    private float timer;
    // Start is called before the first frame update
    void Start()
    {
        slider = gameObject.GetComponent<Slider>();
        if (PlayerPrefs.HasKey(PlayerPrefKeys.MOUSE_SENSITIVITY)) slider.value = PlayerPrefs.GetFloat(PlayerPrefKeys.MOUSE_SENSITIVITY) * slider.maxValue;
        slider.onValueChanged.AddListener(delegate
        {
            timer = 1.5f;
        });
    }

    // Update is called once per frame
    void Update()
    {
        if (timer > 0) timer -= Time.deltaTime;
        if (timer < 0 && timer != -10)
        {
            PlayerPrefs.SetFloat(PlayerPrefKeys.MOUSE_SENSITIVITY, slider.value / slider.maxValue);
            timer = -10;
        }
    }

    private void OnDestroy()
    {
        if (timer < 0)
        {
            PlayerPrefs.SetFloat(PlayerPrefKeys.MOUSE_SENSITIVITY, slider.value / slider.maxValue);
        }
    }
}