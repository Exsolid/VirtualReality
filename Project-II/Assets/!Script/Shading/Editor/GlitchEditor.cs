using UnityEditor.Rendering;
using UnityEditor;
using UnityEngine.Rendering;
using UnityEngine.Rendering.HighDefinition;

[VolumeComponentEditor(typeof(Glitch))]

sealed class GlitchEditor : VolumeComponentEditor

{
    SerializedDataParameter _NoiseIntensity;

    SerializedDataParameter _ScreenDivisions;

    SerializedDataParameter _IndentionAmount;
    SerializedDataParameter _IndentionIntensityLeft;
    SerializedDataParameter _IndentionIntensityRight;

    SerializedDataParameter _StaticOpacity;
    SerializedDataParameter _StaticDivisionsY;
    SerializedDataParameter _StaticDivisionsY2;
    SerializedDataParameter _StaticDivisionsY3;
    SerializedDataParameter _StaticTimed;

    SerializedDataParameter _BlackWhite;
    SerializedDataParameter _BlackWhiteContrast;

    SerializedDataParameter _DisplacementIntensity;

    SerializedDataParameter _DisplacementTexture;

    public override bool hasAdvancedMode => false;

    public override void OnEnable()

    {
        base.OnEnable();
        var o = new PropertyFetcher<Glitch>(serializedObject);
        _NoiseIntensity = Unpack(o.Find(x => x._NoiseIntensity));
        _ScreenDivisions = Unpack(o.Find(x => x._ScreenDivisions));
        _IndentionAmount = Unpack(o.Find(x => x._IndentionAmount));
        _IndentionIntensityLeft = Unpack(o.Find(x => x._IndentionIntensityLeft));
        _IndentionIntensityRight = Unpack(o.Find(x => x._IndentionIntensityRight));
        _StaticOpacity = Unpack(o.Find(x => x._StaticOpacity));
        _StaticDivisionsY = Unpack(o.Find(x => x._StaticDivisionsY));
        _StaticDivisionsY2 = Unpack(o.Find(x => x._StaticDivisionsY2));
        _StaticDivisionsY3 = Unpack(o.Find(x => x._StaticDivisionsY3));
        _StaticTimed = Unpack(o.Find(x => x._StaticTimed));
        _BlackWhite = Unpack(o.Find(x => x._BlackWhite));
        _BlackWhiteContrast = Unpack(o.Find(x => x._BlackWhiteContrast));
        _DisplacementIntensity = Unpack(o.Find(x => x._DisplacementIntensity));
        _DisplacementTexture = Unpack(o.Find(x => x._DisplacementTexture));
    }

    public override void OnInspectorGUI()
    {
        PropertyField(_NoiseIntensity);
        PropertyField(_ScreenDivisions);
        PropertyField(_IndentionAmount);
        PropertyField(_IndentionIntensityLeft);
        PropertyField(_IndentionIntensityRight);
        PropertyField(_StaticOpacity);
        PropertyField(_StaticDivisionsY);
        PropertyField(_StaticDivisionsY2);
        PropertyField(_StaticDivisionsY3);
        PropertyField(_StaticTimed);
        PropertyField(_BlackWhite);
        PropertyField(_BlackWhiteContrast);
        PropertyField(_DisplacementIntensity);
        PropertyField(_DisplacementTexture);
    }

}