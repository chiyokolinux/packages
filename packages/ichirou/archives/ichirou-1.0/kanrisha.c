/* See LICENSE file for copyright and license details. */
/**
 * kanrisha - a simple service manager
 *            created for the ichirou init system
 *
 * kanrisha list - list all available services
 * kanrisha list enabled - list enabled services
 * kanrisha list running - list running services
 * kanrisha enable service - enable service
 * kanrisha disable service - disable service
 * kanrisha start - start all enabled services
 * kanrisha start service - start service
 * kanrisha stop - stop all running services
 * kanrisha stop service - stop service
 * kanrisha restart service - restart service
**/

#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <sys/types.h>
#include <signal.h>
#include <errno.h>
#include <dirent.h>
#include <sys/stat.h>
#include <stdlib.h>

void help();
char** get_running_servs();
char** get_enabled_servs();
int list(int only_enabled, int only_running);
int enable_serv(char servname[]);
int disable_serv(char servname[]);
int start_serv(char servname[]);
int start_all();
int stop_serv(char servname[]);
int stop_all();
int restart_serv(char servname[]);

#include "config.h"

struct servlist {
    char [MAXSERVICES][256]
};

void help() {
    printf("kanrisha - a simple service manager\n           created for the ichirou init system\n\nkanrisha configure - create directories\nkanrisha list - list all available services\nkanrisha list enabled - list enabled services\nkanrisha list running - list running services\nkanrisha enable service - enable service\nkanrisha disable service - disable service\nkanrisha start - start all enabled services\nkanrisha start service - start service\nkanrisha stop - stop all running services\nkanrisha restart service - restart service\n");
}

char** get_running_servs() {
    char servs[MAXSERVICES][256];

    int dir_count = 0;
    struct dirent* dent;
    DIR* srcdir = opendir("/bin/kanrisha.d/available/");
    if(srcdir == NULL) {
        fprintf(stderr, "error: something went really wrong\n");
        exit(1);
    }

    while((dent = readdir(srcdir)) != NULL) {
        struct stat st;

        if(strcmp(dent->d_name, ".") == 0 || strcmp(dent->d_name, "..") == 0)
            continue;

        if(fstatat(dirfd(srcdir), dent->d_name, &st, 0) < 0) {
            perror(dent->d_name);
            continue;
        }

        if(S_ISDIR(st.st_mode)) {
            char* dirname = strcat("/bin/kanrisha.d/available/", dent->d_name);
            char* pidfname = strcat(dirname, "/pid");
            if(access(pidfname, F_OK) == -1) {
                // servs[dir_count++] = dent->d_name;
                strcpy(servs[dir_count++], dent->d_name);
            }
        }
    }
    closedir(srcdir);
    return servs;
}

char** get_enabled_servs() {
    char servs[MAXSERVICES][256];

    int dir_count = 0;
    struct dirent* dent;
    DIR* srcdir = opendir("/bin/kanrisha.d/enabled/");
    if(srcdir == NULL) {
        fprintf(stderr, "error: something went really wrong\n");
        exit(1);
    }

    while((dent = readdir(srcdir)) != NULL) {
        struct stat st;

        if(strcmp(dent->d_name, ".") == 0 || strcmp(dent->d_name, "..") == 0)
            continue;

        if(fstatat(dirfd(srcdir), dent->d_name, &st, 0) < 0) {
            perror(dent->d_name);
            continue;
        }

        if(S_ISDIR(st.st_mode)) {
            servs[dir_count++] = dent->d_name;
        }
    }
    closedir(srcdir);
    return servs;
}

int list(int only_enabled, int only_running) {
    if (only_enabled) {
        char[][] enabledservs = get_enabled_servs();
        int servc = sizeof(enabledservs) / sizeof(char);
        for (int servid = 0; servid < servc; servid++) {
            printf("%s\n", enabledservs[servid]);
        }
    } else if (only_running) {
        char[][] runningservs = get_running_servs();
        int servc = sizeof(runningservs) / sizeof(char);
        for (int servid = 0; servid < servc; servid++) {
            printf("%s\n", runningservs[servid]);
        }
    } else {
        struct dirent* dent;
        DIR* srcdir = opendir("/bin/kanrisha.d/available/");
        if(srcdir == NULL) {
            fprintf(stderr, "error: something went really wrong\n");
            return 1;
        }

        while((dent = readdir(srcdir)) != NULL) {
            struct stat st;

            if(strcmp(dent->d_name, ".") == 0 || strcmp(dent->d_name, "..") == 0)
                continue;

            if(fstatat(dirfd(srcdir), dent->d_name, &st, 0) < 0) {
                perror(dent->d_name);
                continue;
            }

            if(S_ISDIR(st.st_mode)) printf("%s\n", dent->d_name);
        }
        closedir(srcdir);
    }
}

int enable_serv(char servname[]) {
    char* dirname = strcat("/bin/kanrisha.d/available/", servname);
    char* dirname_fix = strcat(dirname, "/");
    if(access(dirname_fix, F_OK) != -1) {
        char* targetdirname = strcat("/bin/kanrisha.d/enabled/", servname);
        if(symlink(dirname_fix, targetdirname) != 0) {
            if (errno == EACCES) {
                fprintf(stderr, "error: missing permissions\n");
                return 1;
            } else if (errno == EEXIST) {
                fprintf(stderr, "error: %s is already enabled\n", servname);
                return 1;
            }
        }
    } else {
        fprintf(stderr, "error: %s doesn't exist\n", servname);
        return 1;
    }
    printf("service %s has been enabled\n", servname);
    return 0;
}

int disable_serv(char servname[]) {
    char* dirname = strcat("/bin/kanrisha.d/enabled/", servname);
    char* dirname_fix = strcat(dirname, "/");
    if(access(dirname_fix, F_OK) != -1) {
        if (unlink(dirname_fix) != 0) {
            if (errno == EACCES || errno == EPERM) {
                fprintf(stderr, "error: missing permissions\n");
                return 1;
            }
        }
    } else {
        fprintf(stderr, "error: %s doesn't exist\n", servname);
        return 1;
    }
    printf("service %s has been disabled\n", servname);
    return 0;
}

int start_serv(char servname[]) {
    printf("starting service %s...\n", servname);
    char* dirname = strcat("/bin/kanrisha.d/available/", servname);
    char* fname = strcat(fname, "/run");
    char* pidfname = strcat(fname, "/pid");
    if(access(fname, F_OK|X_OK) != -1) {
        if(access(pidfname, F_OK) == -1) {
            if(access(fname, F_OK|W_OK) != -1) {
                pid_t child_pid = fork();
                if (child_pid == 0) {
                    char *const args[] = { "--run-by-kanrisha", "true", NULL };
                    execvp(fname, args);
                    sleep(3);
                    stop_serv(servname);
                    exit(-1);
                } else {
                    FILE *fp;
                    fp = fopen(pidfname, "w+");
                    fprintf(fp, "%d\n", child_pid);
                    fclose(fp);
                }
            } else {
                fprintf(stderr, "error: missing permissions\n");
                return 1;
            }
        } else {
            fprintf(stderr, "error: %s is already running\n", servname);
            return 1;
        }
    } else {
        fprintf(stderr, "error: %s doesn't exist\n", servname);
        return 1;
    }
    printf("service %s has been started\n", servname);
    return 0;
}

int start_all() {
    char[][] servs = get_enabled_servs();
    int servc = sizeof(servs) / sizeof(char);
    int retval;
    for (int i = 0; i < servc; i++) {
        retval += start_serv(servs[i]);
    }
    return retval;
}

int stop_serv(char servname[]) {
    printf("stopping service %s...\n", servname);
    char* dirname = strcat("/bin/kanrisha.d/available/", servname);
    char* fname = strcat(fname, "/pid");
    if(access(fname, F_OK|R_OK) != -1) {
        FILE *fp;
        fp = fopen(fname, "r");

        int pid;
        fscanf(fp, "%d", pid);

        fclose(fp);

        if(kill((pid_t)pid, SIGTERM) != 0) {
            if (errno == EPERM) {
                fprintf(stderr, "error: missing permissions\n");
                return 1;
            }
        }

        int needtokillproc = 1;
        for (int i = 0; i < SIGKILLTIMEOUT; i++) {
            if(kill((pid_t)pid, SIGTERM) != 0) {
                if (errno == ESRCH) {
                    needtokillproc = 0;
                    break;
                }
            }
        }
        if (needtokillproc) {
            printf("service %s won't terminate, killing it\n", servname);
            if(kill((pid_t)pid, SIGKILL) != 0) {
                if (errno == EPERM) {
                    fprintf(stderr, "error: missing permissions\n");
                    return 1;
                }
            }
        }

        if (unlink(fname) != 0) {
            fprintf(stderr, "error: cannot delete pidfile. please remove it manually or problems will occur ( %s )\n", strerror(errno));
            return 1;
        }
    } else {
        fprintf(stderr, "error: %s isn't running\n", servname);
        return 1;
    }
    printf("service %s has been stopped\n", servname);
    return 0;
}

int stop_all() {
    char[][] servs = get_running_servs();
    int servc = sizeof(servs) / sizeof(char);
    int retval;
    for (int i = 0; i < servc; i++) {
        retval += stop_serv(servs[i]);
    }
    return retval;
}

int restart_serv(char servname[]) {
    char* dirname = strcat("/bin/kanrisha.d/available/", servname);
    char* fname = strcat(fname, "/pid");
    if(access(fname, F_OK|R_OK) != -1) {
        stop_serv(servname);
        start_serv(servname);
    } else {
        fprintf(stderr, "error: %s isn't running\n", servname);
        return 1;
    }
    printf("service %s has been restarted\n", servname);
    return 0;
}

int main(int argc, char const *argv[]) {
    if (argc != 2 && argc != 3) {
        help();
        return 1;
    }
    switch (argv[1]) {
        case "start":
            printf("kanrisha start");
            break;
        case "stop":
            printf("stop");
            break;
        case "arg":
            if (argc == 3)
                printf("test %s", argv[2]);
            else
                help();
            break;
        default:
            help();
            break;
    }
    return 0;
}
