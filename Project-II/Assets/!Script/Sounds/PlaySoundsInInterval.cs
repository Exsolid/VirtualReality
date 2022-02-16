using UnityEngine;
using AudioBuddyTool;

public class PlaySoundsInInterval : MonoBehaviour
{
    [SerializeField] private string nameOfSound;
    [SerializeField] private bool isMusic;

    private float timer;

    [SerializeField] private float randomStart;
    [SerializeField] private float randomEnd;

    private AudioBuddySpeaker speaker;
    // Start is called before the first frame update
    void Start()
    {
        float volumeMulti = isMusic ? PlayerPrefs.GetFloat(PlayerPrefKeys.MUSIC_VOLUME, 0.5f) : PlayerPrefs.GetFloat(PlayerPrefKeys.SOUND_VOLUME, 0.5f);
        speaker = AudioBuddy.Play(nameOfSound, volumeMulti, gameObject);
        timer = AudioBuddy.FindSoundByName(nameOfSound).GetDuration();
    }

    private void Update()
    {
        float volumeMulti = isMusic ? PlayerPrefs.GetFloat(PlayerPrefKeys.MUSIC_VOLUME, 0.5f) : PlayerPrefs.GetFloat(PlayerPrefKeys.SOUND_VOLUME, 0.5f);
        if (speaker != null && speaker.SourcePlayer.volume != volumeMulti)
        {
            speaker.updateVolume(volumeMulti);
        }
        timer -= Time.deltaTime;
        if (timer <= 0)
        {
            speaker = AudioBuddy.Play(nameOfSound, volumeMulti, gameObject);
            timer = AudioBuddy.FindSoundByName(nameOfSound).GetDuration();
            timer += Random.Range(randomStart, randomEnd);
        }
    }
}
