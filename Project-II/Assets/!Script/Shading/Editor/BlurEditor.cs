using UnityEditor.Rendering;
using UnityEditor;
using UnityEngine.Rendering;
using UnityEngine.Rendering.HighDefinition;

[VolumeComponentEditor(typeof(Blur))]

sealed class BlurEditor : VolumeComponentEditor

{
    SerializedDataParameter _Quality;
    SerializedDataParameter _Amount;

    public override bool hasAdvancedMode => false;

    public override void OnEnable()

    {
        base.OnEnable();
        var o = new PropertyFetcher<Blur>(serializedObject);
        _Quality = Unpack(o.Find(x => x._Quality));
        _Amount = Unpack(o.Find(x => x._Amount));
    }

    public override void OnInspectorGUI()
    {
        PropertyField(_Quality);
        PropertyField(_Amount);
    }

}