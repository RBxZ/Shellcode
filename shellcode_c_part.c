#include <stdio.h>
#include <Windows.h>



int main() {
	char* kernel = "KERNEL32.dll";
	char* proc = "GetProcAddress";
	char* load = "LoadLibraryA";
	char* user = "USER32.dll";
	char* message = "MessageBoxA";
	char* title = "Hello";
	char* content = "You are a bozo";
	void* base_address = GetModuleHandle(0);
	DWORD* load_address = NULL;
	DWORD* proc_address = NULL;
	PIMAGE_DOS_HEADER dosHeader = (PIMAGE_DOS_HEADER)base_address;
	PIMAGE_NT_HEADERS NTHeaders;
	NTHeaders = (PIMAGE_NT_HEADERS)(dosHeader->e_lfanew + (char*)base_address);
	PIMAGE_OPTIONAL_HEADER32 optionalHeader;
	optionalHeader = (PIMAGE_OPTIONAL_HEADER32) & (NTHeaders->OptionalHeader);
	PIMAGE_DATA_DIRECTORY data_directory = (PIMAGE_DATA_DIRECTORY) & (optionalHeader->DataDirectory[1]);
	PIMAGE_IMPORT_DESCRIPTOR import_array = (PIMAGE_IMPORT_DESCRIPTOR)((char*)(base_address)+data_directory->VirtualAddress);
	int check = 1;
	while (import_array->Name != 0 && check != 0) {
		DWORD dll_name = import_array->Name;
		char* firstdll = (char*)(base_address)+dll_name;
		char* dll_name_backup = firstdll;
		char* kernel_backup = kernel;
		int flag = 1;
		while (*dll_name_backup) {
			if (dll_name_backup[0] != kernel_backup[0]) {
				flag = 0;
			}
			dll_name_backup++;
			kernel_backup++;
		}
		if (flag == 1) {
			PIMAGE_THUNK_DATA original_first_thunk = (PIMAGE_THUNK_DATA)(import_array->OriginalFirstThunk + (char*)(base_address));
			PIMAGE_THUNK_DATA first_thunk = (PIMAGE_THUNK_DATA)(import_array->FirstThunk + (char*)(base_address));
			PIMAGE_THUNK_DATA first = first_thunk;
			while ((char*)first_thunk != 0 && check != 0) {
				DWORD* names_array = (DWORD*)(original_first_thunk->u1.AddressOfData + (char*)(base_address));
				char* name = (char*)names_array;
				name += 2;
				char* name_backup = name;
				int flag = 1;

				char* proc_backup = proc;
				while (*name_backup) {
					if (name_backup[0] != proc_backup[0]) {
						flag = 0;
					}
					name_backup++;
					proc_backup++;
				}
				if (flag == 1) {
					proc_address = &first_thunk->u1.Function;
				}

				else {
					name_backup = name;
					char* load_backup = load;
					flag = 1;
					while (*name_backup) {
						if (name_backup[0] != load_backup[0]) {
							flag = 0;
						}
						name_backup++;
						load_backup++;
					}
					if (flag == 1) {
						load_address = &first_thunk->u1.Function;
					}
				}

				if (load_address != NULL && proc_address != NULL) {
					check = 0;
				}
				original_first_thunk += 1;
				first_thunk += 1;

				import_array += 1;
			}
			if (check == 0) {
				typedef  HMODULE(__stdcall* load_fake)(LPCSTR);
				load_fake f = *load_address;
				HMODULE module = f(user);

				typedef  int(__stdcall* message_fake)(HWND, LPCSTR, LPCSTR, UINT);

				typedef  FARPROC(__stdcall* proc_fake)(HMODULE, LPCSTR);
				proc_fake f2 = *proc_address;
				FARPROC message_address = f2(module, message);

				message_fake f3 = message_address;
				f3(0, content, title, 0);
			}
		}
	}
}
