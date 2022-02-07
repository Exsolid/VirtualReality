using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Fade : MonoBehaviour
{
    [SerializeField] private Canvas fadeCanvas;
    private Image fadeToBlack;
    // Start is called before the first frame update
    void Start()
    {
        fadeToBlack = fadeCanvas.GetComponentInChildren<Image>();
        fadeCanvas.enabled = true;
        fadeToBlack.color = new Color(fadeToBlack.color.r, fadeToBlack.color.g, fadeToBlack.color.b, 1);
        StartCoroutine(fadeOut());
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    IEnumerator fadeOut()
    {
        yield return new WaitForSeconds(1f);
        float value = 0;
        while (fadeToBlack.color.a > 0)
        {
            value += 0.01f;
            fadeToBlack.color = new Color(fadeToBlack.color.r, fadeToBlack.color.g, fadeToBlack.color.b, fadeToBlack.color.a - value);
            yield return new WaitForSeconds(0.07f);
        }
        fadeToBlack.color = new Color(fadeToBlack.color.r, fadeToBlack.color.g, fadeToBlack.color.b, 0);
        fadeCanvas.enabled = false;
    }
}
