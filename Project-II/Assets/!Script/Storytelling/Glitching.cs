using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.SceneManagement;

public class Glitching : MonoBehaviour
{
    [SerializeField] private VolumeProfile volumeProfile;
    [SerializeField] private string playerRoomSceneName;
    private bool onceFinal;
    private bool onceClueOne;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (GameplayStates.CHAPTER_TWO_TALK_TWO == GetComponent<StateManager>().CurrentState  && !onceFinal)
        {
            StartCoroutine(finishScene());
            onceFinal = true;
        }

        if (GameplayStates.CHAPTER_ONE_CLUE_ONE == GetComponent<StateManager>().CurrentState && !onceClueOne)
        {
            StartCoroutine(smallGlitch());
            onceClueOne = true;
        }
    }

    IEnumerator finishScene()
    {
        Interact inter = GetComponent<Interact>();
        while (inter.isInteracting())
        {
            yield return new WaitForSeconds(1f);
        }
        inter.MayInteract = false;
        volumeProfile.components.Find(component => component.name.Equals("Glitch")).active = true;
        Glitch glitch = volumeProfile.components.Find(component => component.name.Equals("Glitch")) as Glitch;
        float resetValue = glitch._NoiseIntensity.value;
        for (int i = 0; i < 5; i += 1)
        {
            glitch._NoiseIntensity.value += 0.01f;
            yield return new WaitForSeconds(0.1f);
        }
        glitch._ScreenDivisions.value += 0.01f;
        for (int i = 0; i < 5; i += 1)
        {
            glitch._NoiseIntensity.value += 0.01f;
            yield return new WaitForSeconds(0.1f);
        }
        glitch._ScreenDivisions.value += 0.01f;
        for (int i = 0; i < 5; i += 1)
        {
            glitch._NoiseIntensity.value += 0.01f;
            yield return new WaitForSeconds(0.1f);
        }
        glitch._ScreenDivisions.value -= 0.01f;
        for (int i = 0; i < 5; i += 1)
        {
            glitch._NoiseIntensity.value += 0.01f;
            yield return new WaitForSeconds(0.1f);
        }
        glitch._ScreenDivisions.value -= 0.01f;
        glitch._NoiseIntensity.value = resetValue;
        volumeProfile.components.Find(component => component.name.Equals("Glitch")).active = false;
        SceneManager.LoadScene(playerRoomSceneName);
    }

    IEnumerator smallGlitch()
    {
        Interact inter = GetComponent<Interact>();
        Glitch glitch = volumeProfile.components.Find(component => component.name.Equals("Glitch")) as Glitch;
        while (inter.isInteracting())
        {
            yield return new WaitForSeconds(Random.Range(1,2.5f));
        }
        volumeProfile.components.Find(component => component.name.Equals("Glitch")).active = true;
        inter.MayInteract = false;

        float screenDiv = glitch._ScreenDivisions.value;
        float indention = glitch._IndentionAmount.value;
        float indentionL = glitch._IndentionIntensityRight.value;
        float indentionR = glitch._IndentionIntensityLeft.value;
        float noise = glitch._NoiseIntensity.value;
        float displace = glitch._DisplacementIntensity.value;
        float opac = glitch._StaticOpacity.value;
        glitch._StaticOpacity.value = 0;
        glitch._ScreenDivisions.value = 0;
        glitch._IndentionAmount.value = 0;
        glitch._IndentionIntensityRight.value = 0;
        glitch._IndentionIntensityLeft.value = 0;

        for (int i = 0; i < 5; i += 1)
        {
            glitch._DisplacementIntensity.value += 0.02f;
            glitch._NoiseIntensity.value += 0.003f;
            yield return new WaitForSeconds(0.1f);
        }

        glitch._DisplacementIntensity.value = displace;
        glitch._NoiseIntensity.value = noise;
        glitch._ScreenDivisions.value = screenDiv;
        glitch._IndentionAmount.value = indention;
        glitch._IndentionIntensityRight.value = indentionL;
        glitch._IndentionIntensityLeft.value = indentionR;
        glitch._StaticOpacity.value = opac;
        volumeProfile.components.Find(component => component.name.Equals("Glitch")).active = false;
        inter.MayInteract = true;
    }
}
