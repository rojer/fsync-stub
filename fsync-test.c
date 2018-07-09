#include <stdio.h>
#include <sys/auxv.h>
#include <unistd.h>

int main(int argc, char** argv) {
  const char *platform = (const char *) getauxval(AT_PLATFORM);
  fprintf(stderr, "Platform: %s\n", platform);
  /* fsyncing stdin will normally fail but will succeed with the stub. */
  return fsync(0);
}
