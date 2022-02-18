using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using AudioBuddyTool;

public class PlaySoundsOnInteraction : MonoBehaviour
{

    [SerializeField] private List<string> nameOfSounds;
    [SerializeField] private bool isMusic;
    [SerializeField] float volumeReduction = 1;

    private AudioBuddySpeaker speaker;
    private float timer;
    private int rand;

    private void Update()
    {
        float volumeMulti = isMusic ? PlayerPrefs.GetFloat(PlayerPrefKeys.MUSIC_VOLUME, 0.5f) : PlayerPrefs.GetFloat(PlayerPrefKeys.SOUND_VOLUME, 0.5f);
        if (speaker != null && speaker.SourcePlayer.volume != volumeMulti * volumeReduction)
        {
            speaker.updateVolume(volumeMulti * volumeReduction);
        }
        timer -= Time.deltaTime;
    }

    public void playSound()
    {
        if(timer <= 0)
        {
            rand = Random.Range(0, nameOfSounds.Count);
            float volumeMulti = isMusic ? PlayerPrefs.GetFloat(PlayerPrefKeys.MUSIC_VOLUME, 0.5f) : PlayerPrefs.GetFloat(PlayerPrefKeys.SOUND_VOLUME, 0.5f);
            speaker = AudioBuddy.Play(nameOfSounds[rand], volumeMulti * volumeReduction, gameObject);
            timer = AudioBuddy.FindSoundByName(nameOfSounds[rand]).GetDuration();
        }
    }
}
