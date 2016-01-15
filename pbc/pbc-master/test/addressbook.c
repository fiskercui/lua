#include "pbc.h"

#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <stddef.h>

#include "readfile.h"

static void
dump(uint8_t *buffer, int sz) {
	int i , j;
	for (i=0;i<sz;i++) {
		printf("%02X ",buffer[i]);
		if (i % 16 == 15) {
			for (j = 0 ;j <16 ;j++) {
				char c = buffer[i/16 * 16+j];
				if (c>=32 && c<127) {
					printf("%c",c);
				} else {
					printf(".");
				}
			}
			printf("\n");
		}
	}

	printf("\n");
}

static void
test_rmessage(struct pbc_env *env, struct pbc_slice *slice) {
	struct pbc_rmessage * m = pbc_rmessage_new(env, "tutorial.Person", slice);
	if (m==NULL) {
		printf("Error : %s",pbc_error(env));
		return;
	}
	printf("name = %s\n", pbc_rmessage_string(m , "name" , 0 , NULL));
	printf("id = %d\n", pbc_rmessage_integer(m , "id" , 0 , NULL));
	printf("email = %s\n", pbc_rmessage_string(m , "email" , 0 , NULL));

	int phone_n = pbc_rmessage_size(m, "phone");
	int i;
	const char * field_name;
	pbc_type(env, "tutorial.Person", "phone", &field_name);
	printf("phone type [%s]\n",field_name);

	for (i=0;i<phone_n;i++) {
		struct pbc_rmessage * p = pbc_rmessage_message(m , "phone", i);
		printf("\tnumber[%d] = %s\n",i,pbc_rmessage_string(p , "number", i ,NULL));
		printf("\ttype[%d] = %s\n",i,pbc_rmessage_string(p, "type", i, NULL));
	}

	int n = pbc_rmessage_size(m , "test");

	for (i=0;i<n;i++) {
		printf("test[%d] = %d\n",i, pbc_rmessage_integer(m , "test" , i , NULL));
	}

	printf("tutorial.Ext.test = %d\n", pbc_rmessage_integer(m,"tutorial.Ext.test",0,NULL));
	pbc_rmessage_delete(m);
}

static struct pbc_wmessage *
test_wmessage(struct pbc_env * env)
{
	struct pbc_wmessage * msg = pbc_wmessage_new(env, "tutorial.Person");

	pbc_wmessage_string(msg, "name", "Alice", -1);
	pbc_wmessage_integer(msg, "id" , 12345, 0);
	pbc_wmessage_string(msg, "email", "alice@unkown", -1);
	pbc_wmessage_integer(msg, "testAdd", 7777, 0);

	struct pbc_wmessage * phone = pbc_wmessage_message(msg , "phone");
	pbc_wmessage_string(phone , "number", "87654321" , -1);

	phone = pbc_wmessage_message(msg , "phone");
	pbc_wmessage_string(phone , "number", "13901234567" , -1);
	pbc_wmessage_string(phone , "type" , "MOBILE" , -1);

	pbc_wmessage_integer(msg, "test", -123,0);
	pbc_wmessage_integer(msg, "test", 12345,0);
	pbc_wmessage_integer(msg, "test", 1234567,0);

	pbc_wmessage_integer(msg, "tutorial.Ext.test", 54321 , 0);

	return msg;
}

static struct pbc_wmessage *
test_ClientSevermessage(struct pbc_env * env)
{
	struct pbc_wmessage * msg = pbc_wmessage_new(env, "fgame.C2ServerMsg");

	struct pbc_wmessage * Mov_Req = pbc_wmessage_message(msg, "Mov_Req");
	pbc_wmessage_integer(Mov_Req, "Uin", 1000005, 0);

	struct pbc_wmessage * position = pbc_wmessage_message(Mov_Req, "position");
	pbc_wmessage_integer(position, "y", 0, 0);
	pbc_wmessage_integer(position, "x", 0, 0);

	pbc_wmessage_integer(Mov_Req, "status", 1, 0);

	struct pbc_wmessage * velocity = pbc_wmessage_message(Mov_Req, "velocity");
	pbc_wmessage_integer(velocity, "y", 0, 0);
	pbc_wmessage_integer(velocity, "x", 0, 0);



	return msg;
}


void testOldWrite()
{
	struct pbc_slice slice;
	read_file("addressbooknew.pb", &slice); //ClientSvrMsg
	//read_file("ClientSvrMsg.pb", &slice); //ClientSvrMsg
	if (slice.buffer == NULL)
		return 1;
	struct pbc_env * env = pbc_new();
	int r = pbc_register(env, &slice);
	if (r) {
		printf("Error : %s", pbc_error(env));
		return 1;
	}

	free(slice.buffer);

	struct pbc_wmessage *msg = test_wmessage(env);
	//struct pbc_wmessage *msg = test_ClientSevermessage(env);
	pbc_wmessage_buffer(msg, &slice);
	dump(slice.buffer, slice.len);
	FILE* f = fopen("test.bin", "wb");
	fwrite(slice.buffer, slice.len, 1, f);
	fclose(f);
	f = NULL;
}

void testNewRead()
{
	struct pbc_slice slice;
	read_file("addressbooknew.pb", &slice); //ClientSvrMsg
	//read_file("ClientSvrMsg.pb", &slice); //ClientSvrMsg
	if (slice.buffer == NULL)
		return 1;

	struct pbc_env * env = pbc_new();
	int r = pbc_register(env, &slice);
	if (r) {
		printf("Error : %s", pbc_error(env));
		return 1;
	}
	free(slice.buffer);


	size_t* size = malloc(sizeof(size_t));
	FILE* fp = fopen("test.bin", "rb");
	fseek(fp, 0, SEEK_END);
	*size = ftell(fp);
	*((size_t *)&slice.len) = ftell(fp);
	fseek(fp, 0, SEEK_SET);
	slice.buffer = (unsigned char*)malloc(*size);
	fread(slice.buffer, slice.len, 1, fp);

	test_rmessage(env, &slice);

	pbc_delete(env);

}
//
//int
//main()
//{
//	printf("hello world");
//	struct pbc_slice slice;
//	read_file("addressbooknew.pb", &slice); //ClientSvrMsg


//	//read_file("ClientSvrMsg.pb", &slice); //ClientSvrMsg
//	if (slice.buffer == NULL)
//		return 1;
//	struct pbc_env * env = pbc_new();
//	int r = pbc_register(env, &slice);
//	if (r) {
//		printf("Error : %s", pbc_error(env));
//		return 1;
//	}
//
//	free(slice.buffer);
//
//	struct pbc_wmessage *msg = test_wmessage(env);
//	//struct pbc_wmessage *msg = test_ClientSevermessage(env);
//	pbc_wmessage_buffer(msg, &slice);
//	dump(slice.buffer, slice.len);
//	//FILE* f = fopen("test.bin", "wb");
//	//fwrite(slice.buffer, slice.len, 1, f);
//	//fclose(f);
//	//f = NULL;
//
//	size_t* size = malloc(sizeof(size_t));
//	FILE* fp = fopen("test.bin", "rb");
//	fseek(fp, 0, SEEK_END);
//	*size = ftell(fp);
//	*((size_t *)&slice.len) = ftell(fp);
//	fseek(fp, 0, SEEK_SET);
//	slice.buffer = (unsigned char*)malloc(*size);
//	fread(slice.buffer, slice.len, 1, fp);
//
//	test_rmessage(env, &slice);
//
//	pbc_wmessage_delete(msg);
//	pbc_delete(env);
//
//	return 0;
//}



int main()
{
	testOldWrite();
	testNewRead();
}
