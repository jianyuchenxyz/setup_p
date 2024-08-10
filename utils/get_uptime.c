// Utility for returning shortened uptime formats.

#include <stdio.h>
#include <errno.h>
#include <sys/sysinfo.h>

long get_sysinfo_uptime() {
    struct sysinfo s;

    int error = sysinfo(&s);
    if(error != 0) {
        printf("code error = %d\n", error);
    }

    return s.uptime;
}

int main(int argc, char *argv[]) {
    const long SECONDS_PER_DAY  = 86400;
    const long SECONDS_PER_HOUR = 3600;
    const long SECONDS_PER_MIN  = 60;

    long u, d, h, m;
    u = get_sysinfo_uptime();

    d = (u/SECONDS_PER_DAY);
    h = (u - d*SECONDS_PER_DAY)/SECONDS_PER_HOUR;
    m = (u - d*SECONDS_PER_DAY - h*SECONDS_PER_HOUR)/SECONDS_PER_MIN;

    if (d > 0) {
        printf("%ldd %ldh %ldm\n", d, h, m);
        return 0;
    }

    if (h > 0) {
        printf("%ldh %ldm\n", h, m);
        return 0;
    }

    printf("%ldm\n", m);
    return 0;
}
