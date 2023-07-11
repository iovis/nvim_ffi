extern int name_to_color(const unsigned char *name, int *idx);

char *hello_world(void) { return "Hello from C!"; }

int get_magenta(void) {
  int dummy;
  return name_to_color((unsigned char *)"Magenta", &dummy);
}
