using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using AudioBuddyTool;

public class PlaySoundsOnInteraction : MonoBehaviour
{

    [SerializeField] private List<string> nameOfSounds;
    [SerializeField] private bool isMusic;
    private AudioBuddySpeaker speaker;
    private float timer;
    private int rand;

    private void Update()
    {
        float volumeMulti = isMusic ? PlayerPrefs.GetFloat(PlayerPrefKeys.MUSIC_VOLUME) : PlayerPrefs.GetFloat(PlayerPrefKeys.SOUND_VOLUME);
        if (speaker != null && speaker.SourcePlayer.volume != volumeMulti)
        {
            speaker.updateVolume(volumeMulti);
        }
        timer -= Time.deltaTime;
    }

    public void playSound()
    {
        if(timer <= 0)
        {
            rand = Random.Range(0, nameOfSounds.Count);
            float volumeMulti = isMusic ? PlayerPrefs.GetFloat(PlayerPrefKeys.MUSIC_VOLUME) : PlayerPrefs.GetFloat(PlayerPrefKeys.SOUND_VOLUME);
            speaker = AudioBuddy.Play(nameOfSounds[rand], volumeMulti, gameObject);
            timer = AudioBuddy.FindSoundByName(nameOfSounds[rand]).GetDuration();
        }
    }
}
