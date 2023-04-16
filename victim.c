#include <stdio.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <Windows.h>

char shellcode[2000];
int main()
{
    char* shellcode_ptr = shellcode;
    HANDLE hFile;
    DWORD  dwBytesRead = 0;
    OVERLAPPED ol = { 0 };
    char file_name;
    int bytesRead = 0;

    hFile = CreateFileW((LPCWSTR)L"E:\\Sahar\\Shellcode\\test7",             
        GENERIC_READ,          
        FILE_SHARE_READ,       
        NULL,                 
        OPEN_EXISTING,        
        FILE_ATTRIBUTE_NORMAL,
        NULL);                 

    if (hFile == INVALID_HANDLE_VALUE) { return 1; }
    if (!ReadFile(hFile,
        shellcode_ptr,
        1147,
        (LPDWORD)&bytesRead,
        NULL)) {
        return 1;
    }
    GetProcAddress(0, 0);
    LoadLibraryA("User32.dll");
    char* adr = (char*)&shellcode;
    LPVOID lpAddress = (LPVOID)((LONGLONG)adr - ((LONGLONG)adr % 0x1000));
    DWORD loldprotect = 0;
    PDWORD lopfloldprotect = &loldprotect;
    VirtualProtect(lpAddress, 0x1000, PAGE_EXECUTE_READWRITE, lopfloldprotect);
    void(* ptr)(void) = (void(*)(void))(LONGLONG) & shellcode;
    ptr();
    return 0;
} 
