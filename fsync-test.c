#include <unistd.h>

int main(int argc, char** argv) {
  /* fsyncing stdin will normally fail but will succeed with the stub. */
  return fsync(0);
}
