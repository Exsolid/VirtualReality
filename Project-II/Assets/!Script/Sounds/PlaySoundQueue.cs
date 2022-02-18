using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using AudioBuddyTool;

public class PlaySoundQueue : MonoBehaviour
{
    [SerializeField] private List<string> nameOfSound;
    [SerializeField] private bool isMusic;

    private float timer;
    private int current;

    private AudioBuddySpeaker speaker;
    [SerializeField] float volumeReduction = 1;


    // Start is called before the first frame update
    void Start()
    {
        current = Random.Range(0,nameOfSound.Count);
        float volumeMulti = isMusic ? PlayerPrefs.GetFloat(PlayerPrefKeys.MUSIC_VOLUME, 0.5f) : PlayerPrefs.GetFloat(PlayerPrefKeys.SOUND_VOLUME, 0.5f);
        speaker = AudioBuddy.Play(nameOfSound[current], volumeMulti * volumeReduction, gameObject);
        timer = AudioBuddy.FindSoundByName(nameOfSound[current]).GetDuration();
    }

    private void Update()
    {
        speaker.transform.position = gameObject.transform.position;
        float volumeMulti = isMusic ? PlayerPrefs.GetFloat(PlayerPrefKeys.MUSIC_VOLUME, 0.5f) : PlayerPrefs.GetFloat(PlayerPrefKeys.SOUND_VOLUME, 0.5f);
        if (speaker != null && speaker.SourcePlayer.volume != volumeMulti * volumeReduction)
        {
            speaker.updateVolume(volumeMulti * volumeReduction);
        }
        timer -= Time.deltaTime;
        if (timer <= 0)
        {
            current++;
            if (current == nameOfSound.Count) current = 0;
            speaker = AudioBuddy.Play(nameOfSound[current], volumeMulti * volumeReduction);
            timer = AudioBuddy.FindSoundByName(nameOfSound[current]).GetDuration();
        }
    }
}
