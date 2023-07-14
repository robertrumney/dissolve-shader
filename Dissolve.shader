Shader "Custom/Dissolve" {
    Properties {
        _MainTex ("Texture", 2D) = "white" {}
        _DissolveThreshold ("Dissolve Threshold", Range(0, 1)) = 0
        _DissolveColor ("Dissolve Color", Color) = (1, 0, 0, 1)
        _DissolveTex ("Dissolve Texture", 2D) = "white" {}
    }

    SubShader {
        Tags { "RenderType" = "Opaque" }

        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            sampler2D _DissolveTex;
            float _DissolveThreshold;
            float4 _DissolveColor;

            v2f vert (appdata v) {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target {
                fixed4 col = tex2D(_MainTex, i.uv);
                fixed dissolveAmount = tex2D(_DissolveTex, i.uv).r;
                if(dissolveAmount < _DissolveThreshold)
                    discard;
                else if(dissolveAmount < _DissolveThreshold + 0.05)
                    col = _DissolveColor;
                return col;
            }
            ENDCG
        }
    } 
}
