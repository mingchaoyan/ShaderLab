Shader "Custom/Flow" {
	SubShader {
        pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            void vert(in float2 objPos:POSITION, out float4 pos:POSITION, out float4 col:COLOR) {
                pos = float4(objPos, 0, 1);
                if(pos.x < 0 && pos.y < 0) {
                    col = float4(1, 0, 0, 1);
                } else if(pos.x < 0 && pos.y > 0){
                    col = float4(0, 1, 0, 1);
                } else if (pos.x > 0 && pos.y < 0) {
                    col = float4(0, 0, 1, 1);
                } else {
                    col = float4(1, 1, 0, 1);
                }
                          
            }

            void frag(inout float4 col:COLOR) {
                int i = 0;
                while(i<10) {
                    i++;
                }
                if(i==10)
                    col = float4(0, 0, 0, 1);

                i = 0;
                do {
                    i++;
                } while (i < 20);
                if(i == 20)
                    col = float4(0, 1, 0, 1);

                for(i=0; i < 1023; ++i) {}
                if (i == 1023) 
                    col = float4(0, 0, 1, 1);                 
            }
            ENDCG
        }
	}
}
