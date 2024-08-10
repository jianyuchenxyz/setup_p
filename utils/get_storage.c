// Utility for returning shortened storage readings.

#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <sys/statvfs.h>

char* format_size(int64_t size) {
    const int BUF_LEN = 20;
    char* buf = malloc(sizeof(char) * BUF_LEN);

    if (size <= 1024) {
        // no decimal places needed, return integer
        snprintf(buf, BUF_LEN, "%jdB", size);
        return buf;
    }

    // int64_t maximum is 8EB
    const char* UNITS[] = {
        "kB", // kilo, 10^3
        "MB", // mega, 10^6
        "GB", // giga, 10^9
        "TB", // tera, 10^12
        "PB", // peta, 10^15
        "EB"  //  exa, 10^18
    };

    double p = (double)size / 1024;
    int i = 0;
    while (p > 1024) {
        p /= 1024;
        i++;
    }

    snprintf(buf, BUF_LEN, "%.1f%s", p, UNITS[i]);
    return buf;
}

int main(int argc, char* argv[]) {

   /* from: "man statvfs"
   struct statvfs {
       unsigned long  f_bsize;    // Filesystem block size
       unsigned long  f_frsize;   // Fragment size
       fsblkcnt_t     f_blocks;   // Size of fs in f_frsize units
       fsblkcnt_t     f_bfree;    // Number of free blocks
       fsblkcnt_t     f_bavail;   // Number of free blocks for unprivileged users
       fsfilcnt_t     f_files;    // Number of inodes
       fsfilcnt_t     f_ffree;    // Number of free inodes
       fsfilcnt_t     f_favail;   // Number of free inodes for unprivileged users
       unsigned long  f_fsid;     // Filesystem ID
       unsigned long  f_flag;     // Mount flags
       unsigned long  f_namemax;  // Maximum filename length
    }
    */

    const char* dir = "/";
    struct statvfs s;
    statvfs(dir, &s);

    long blocks_used = s.f_blocks - s.f_bavail;
    double used_pct = ((double)blocks_used / s.f_blocks) * 100.0;

    char* avail_size = format_size((int64_t)s.f_bavail * (int64_t)s.f_bsize);
    printf("%.1f%% used (%s free)\n", used_pct, avail_size);

    free(avail_size);

    return 0;
}
