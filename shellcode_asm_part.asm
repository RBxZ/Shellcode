.686p 
.xmm
.model flat,c
.stack  4096

.code
        
public  main

signature db "SIGNATURE",0
main proc
    call CODESTART
CODESTART:
	pop esi
var_codestart		EQU -268h
var_264         EQU -264h
var_1A0         EQU -1A0h
var_194         EQU -194h
var_188         EQU -188h
var_17C         EQU -17Ch
var_170         EQU -170h
var_164         EQU -164h
var_158         EQU -158h
var_14C         EQU -14Ch
var_140         EQU -140h
var_134         EQU -134h
var_128         EQU -128h
var_11C         EQU -11Ch
var_110         EQU -110h
var_104         EQU -104h
var_F8          EQU -0F8h
var_EC          EQU -0ECh
var_E0          EQU -0E0h
var_D4          EQU -0D4h
var_C8          EQU -0C8h
var_BC          EQU -0BCh
var_B0          EQU -0B0h
var_A4          EQU -0A4h
var_98          EQU -98h
var_8C          EQU -8Ch
var_80          EQU -80h
var_74          EQU -74h
var_68          EQU -68h
var_5C          EQU -5Ch
var_50          EQU -50h
var_44          EQU -44h
var_38          EQU -38h
var_2C          EQU -2Ch
var_20          EQU -20h
var_14          EQU -14h
var_8           EQU -8
                push    ebp
                mov     ebp, esp
                sub     esp, 1000h
                push    ebx
                push    esi
                push    edi
                lea     edi, [ebp+var_264]
                mov     ecx, 99h
                mov     eax, 0CCCCCCCCh
				mov		[ebp+var_codestart], esi ; shellcode start
				mov	    eax, offset CODESTART
				sub		[ebp+var_codestart], eax
				mov		eax, [ebp+var_codestart]
                mov     [ebp+var_8], offset _Kernel
                add		[ebp+var_8], eax
                mov     [ebp+var_14], offset _Proc1
				add		[ebp+var_14], eax
                mov     [ebp+var_20], offset _Load
				add		[ebp+var_20], eax
                mov     [ebp+var_2C], offset _User
				add		[ebp+var_2C], eax
                mov     [ebp+var_38], offset _Message
				add		[ebp+var_38], eax
                mov     [ebp+var_44], offset _Title1
				add		[ebp+var_44], eax
                mov     [ebp+var_50], offset _Content
				add		[ebp+var_50], eax
                mov     esi, esp
				assume fs: nothing
				mov eax, fs:[030h]
				mov eax, [eax + 08h]
                mov     [ebp+var_5C], eax
                mov     dword ptr [ebp+var_68], 0
                mov     dword ptr [ebp+var_74], 0
                mov     eax, [ebp+var_5C]
                mov     [ebp+var_80], eax
                mov     eax, [ebp+var_80]
                mov     ecx, [ebp+var_5C]
                add     ecx, [eax+3Ch]
                mov     [ebp+var_8C], ecx
                mov     eax, [ebp+var_8C]
                add     eax, 18h
                mov     [ebp+var_98], eax
                mov     eax, 8
                shl     eax, 0
                mov     ecx, [ebp+var_98]
                lea     edx, [ecx+eax+60h]
                mov     [ebp+var_A4], edx
                mov     eax, [ebp+var_A4]
                mov     ecx, [ebp+var_5C]
                add     ecx, [eax]
                mov     [ebp+var_B0], ecx
                mov     dword ptr[ebp+var_BC], 1
loc_4117E2:
                mov     eax, [ebp+var_B0]
                cmp     dword ptr [eax+0Ch], 0
                jz      loc_411B0E
                cmp     dword ptr[ebp+var_BC], 0
                jz      loc_411B0E
                mov     eax, [ebp+var_B0]
                mov     ecx, [eax+0Ch]
                mov     [ebp+var_C8], ecx
                mov     eax, [ebp+var_5C]
                add     eax, [ebp+var_C8]
                mov     [ebp+var_D4], eax
                mov     eax, [ebp+var_D4]
                mov     [ebp+var_E0], eax
                mov     eax, [ebp+var_8]
                mov     [ebp+var_EC], eax
                mov     dword ptr[ebp+var_F8], 1
loc_41183C:
                mov     eax, [ebp+var_E0]
                movsx   ecx, byte ptr [eax]
                test    ecx, ecx
                jz      short loc_41189B
                mov     eax, 1
                imul    ecx, eax, 0
                mov     edx, [ebp+var_E0]
                movsx   eax, byte ptr [edx+ecx]
                mov     ecx, 1
                imul    edx, ecx, 0
                mov     ecx, [ebp+var_EC]
                movsx   edx, byte ptr [ecx+edx]
                cmp     eax, edx
                jz      short loc_41187B
                mov     dword ptr[ebp+var_F8], 0
loc_41187B:
                mov     eax, [ebp+var_E0]
                add     eax, 1
                mov     [ebp+var_E0], eax
                mov     eax, [ebp+var_EC]
                add     eax, 1
                mov     [ebp+var_EC], eax
                jmp     short loc_41183C
loc_41189B:
                cmp     dword ptr[ebp+var_F8], 1
                jnz     loc_411B09
                mov     eax, [ebp+var_B0]
                mov     ecx, [ebp+var_5C]
                add     ecx, [eax]
                mov     [ebp+var_104], ecx
                mov     eax, [ebp+var_B0]
                mov     ecx, [ebp+var_5C]
                add     ecx, [eax+10h]
                mov     [ebp+var_110], ecx
                mov     eax, [ebp+var_110]
                mov     [ebp+var_11C], eax
loc_4118D7:
                cmp     dword ptr[ebp+var_110], 0
                jz      loc_411A8A
                cmp     dword ptr[ebp+var_BC], 0
                jz      loc_411A8A
                mov     eax, [ebp+var_104]
                mov     ecx, [ebp+var_5C]
                add     ecx, [eax]
                mov     [ebp+var_128], ecx
                mov     eax, [ebp+var_128]
                mov     [ebp+var_134], eax
                mov     eax, [ebp+var_134]
                add     eax, 2
                mov     [ebp+var_134], eax
                mov     eax, [ebp+var_134]
                mov     [ebp+var_140], eax
                mov     dword ptr[ebp+var_14C], 1
                mov     eax, [ebp+var_14]
                mov     [ebp+var_158], eax
loc_41193C:
                mov     eax, [ebp+var_140]
                movsx   ecx, byte ptr [eax]
                test    ecx, ecx
                jz      short loc_41199B
                mov     eax, 1
                imul    ecx, eax, 0
                mov     edx, [ebp+var_140]
                movsx   eax, byte ptr [edx+ecx]
                mov     ecx, 1
                imul    edx, ecx, 0
                mov     ecx, [ebp+var_158]
                movsx   edx, byte ptr [ecx+edx]
                cmp     eax, edx
                jz      short loc_41197B
                mov     dword ptr[ebp+var_14C], 0
loc_41197B:
                mov     eax, [ebp+var_140]
                add     eax, 1
                mov     [ebp+var_140], eax
                mov     eax, [ebp+var_158]
                add     eax, 1
                mov     [ebp+var_158], eax
                jmp     short loc_41193C
loc_41199B:
                cmp     dword ptr[ebp+var_14C], 1
                jnz     short loc_4119B2
                mov     eax, [ebp+var_110]
                mov     [ebp+var_74], eax
                jmp     loc_411A42
loc_4119B2:
                mov     eax, [ebp+var_134]
                mov     [ebp+var_140], eax
                mov     eax, [ebp+var_20]
                mov     [ebp+var_164], eax
                mov     dword ptr[ebp+var_14C], 1
loc_4119D1:
                mov     eax, [ebp+var_140]
                movsx   ecx, byte ptr [eax]
                test    ecx, ecx
                jz      short loc_411A30
                mov     eax, 1
                imul    ecx, eax, 0
                mov     edx, [ebp+var_140]
                movsx   eax, byte ptr [edx+ecx]
                mov     ecx, 1
                imul    edx, ecx, 0
                mov     ecx, [ebp+var_164]
                movsx   edx, byte ptr [ecx+edx]
                cmp     eax, edx
                jz      short loc_411A10
                mov     dword ptr[ebp+var_14C], 0
loc_411A10:
                mov     eax, [ebp+var_140]
                add     eax, 1
                mov     [ebp+var_140], eax
                mov     eax, [ebp+var_164]
                add     eax, 1
                mov     [ebp+var_164], eax
                jmp     short loc_4119D1
loc_411A30:
                cmp     dword ptr[ebp+var_14C], 1
                jnz     short loc_411A42
                mov     eax, [ebp+var_110]
                mov     [ebp+var_68], eax
loc_411A42:
                cmp     dword ptr[ebp+var_68], 0
                jz      short loc_411A58
                cmp     dword ptr[ebp+var_74], 0
                jz      short loc_411A58
                mov     dword ptr[ebp+var_BC], 0
loc_411A58:
                mov     eax, [ebp+var_104]
                add     eax, 4
                mov     [ebp+var_104], eax
                mov     eax, [ebp+var_110]
                add     eax, 4
                mov     [ebp+var_110], eax
                mov     eax, [ebp+var_B0]
                add     eax, 14h
                mov     [ebp+var_B0], eax
                jmp     loc_4118D7
loc_411A8A:
                cmp     dword ptr[ebp+var_BC], 0
                jnz     short loc_411B09
                mov     eax, [ebp+var_68]
                mov     ecx, [eax]
                mov     [ebp+var_170], ecx
                mov     esi, esp
                mov     eax, [ebp+var_2C]
                push    eax
                call    dword ptr[ebp+var_170]
                cmp     esi, esp
                mov     [ebp+var_17C], eax
                mov     eax, [ebp+var_74]
                mov     ecx, [eax]
                mov     [ebp+var_188], ecx
                mov     esi, esp
                mov     eax, [ebp+var_38]
                push    eax
                mov     ecx, [ebp+var_17C]
                push    ecx
                call    dword ptr[ebp+var_188]
                cmp     esi, esp
                mov     [ebp+var_194], eax
                mov     eax, [ebp+var_194]
                mov     [ebp+var_1A0], eax
                mov     esi, esp
                push    0
                mov     eax, [ebp+var_44]
                push    eax
                mov     ecx, [ebp+var_50]
                push    ecx
                push    0
                call    dword ptr[ebp+var_1A0]
                cmp     esi, esp
loc_411B09:
                jmp     loc_4117E2
loc_411B0E:
                xor     eax, eax
                pop     edi
                pop     esi
                pop     ebx
                add     esp, 264h
                cmp     ebp, esp
                mov     esp, ebp
                pop     ebp                 
				retn

_Kernel db "KERNEL32.dll",0
_Proc1  db  "GetProcAddress",0

_Load  db  "LoadLibraryA",0

_User  db  "USER32.dll",0

_Message  db  "MessageBoxA",0

_Title1  db  "Hello",0

_Content  db  "You are a bozo",0

signature2 db "SIGNATURE2",0

main endp

end
