using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using AudioBuddyTool;

public class PlaySounds : MonoBehaviour
{
    [SerializeField] private string nameOfSound;
    [SerializeField] private bool isMusic;

    private float timer;
    [SerializeField] private bool shouldLoop;
    private AudioBuddySpeaker speaker;
    [SerializeField] float volumeReduction = 1;

    // Start is called before the first frame update
    void Start()
    {
        float volumeMulti = isMusic ? PlayerPrefs.GetFloat(PlayerPrefKeys.MUSIC_VOLUME, 0.5f) : PlayerPrefs.GetFloat(PlayerPrefKeys.SOUND_VOLUME, 0.5f);
        speaker = AudioBuddy.Play(nameOfSound, volumeMulti * volumeReduction, gameObject);
        timer = AudioBuddy.FindSoundByName(nameOfSound).GetDuration();
    }

    private void Update()
    {
        float volumeMulti = isMusic ? PlayerPrefs.GetFloat(PlayerPrefKeys.MUSIC_VOLUME, 0.5f) : PlayerPrefs.GetFloat(PlayerPrefKeys.SOUND_VOLUME, 0.5f);
        if (speaker != null && speaker.SourcePlayer.volume != volumeMulti * volumeReduction)
        {
            speaker.SourcePlayer.volume = (volumeMulti * volumeReduction);
        }
        timer -= Time.deltaTime;
        if (timer <= 0 && shouldLoop)
        {
            speaker = AudioBuddy.Play(nameOfSound, volumeMulti * volumeReduction, gameObject);
            timer = AudioBuddy.FindSoundByName(nameOfSound).GetDuration();
        }
    }
}
