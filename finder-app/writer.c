#include<stdio.h>
#include<syslog.h>

int main(int argc, char *argv[]) {
    openlog("writer", LOG_PERROR | LOG_CONS, LOG_USER);

    if (argc != 3) {
        syslog(LOG_ERR, "You must provide 2 arguments: filename and the string to be written in the file\n");
        return 1;
    }

    FILE* fp = fopen(argv[1], "w");
    if (fp == NULL) {
        syslog(LOG_ERR,"Error trying to open file %s", argv[1]);
        return 1;
    }
    
    syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);
    int n = fprintf(fp, "%s", argv[2]);
    if (n < 0) {
        syslog(LOG_ERR, "Error trying to write file. fprintf returned value %d", n);
        return n;
    }

    fclose(fp);
    closelog();

    return 0; 
}
