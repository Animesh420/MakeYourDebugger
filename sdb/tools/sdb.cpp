#include <iostream>
#include <unistd.h>
#include <string_view>
#include <sys/ptrace.h>
#include <sys/wait.h>
#include <editline/readline.h>
#include <string>
#include <vector>
#include <sstream>
#include <algorithm>



namespace {

    std::vector<std::string> split(std::string_view str, char delimiter){
        std::vector<std::string> out {};
        std::stringstream ss {std::string{str}};
        std::string item;

        while (std::getline(ss, item, delimiter)) {
            out.push_back(item);
        }

        return out;

    }
    bool is_prefix(std::string_view str, std::string_view of){
        if (str.size() > of.size()) return false;
        return std::equal(str.begin(), str.end(), of.begin());
    }
    void resume(pid_t pid){
        if (ptrace(PTRACE_CONT, pid, nullptr, nullptr) < 0) {
            std::cerr << "Couldn't continue\n";
            std::exit(-1);
        }
    }
    void wait_on_signal(pid_t pid){
        int wait_status;
        int options = 0;
        if (waitpid(pid, &wait_status, options) < 0) {
            std::perror("waitpid failed");
            std::exit(-1);
        }
    }



    void handle_command(pid_t pid, std::string_view line){
        auto args = split(line, ' ');
        auto command = args[0];

        if (is_prefix(command, "continue")) {
            resume(pid);
            wait_on_signal(pid);
        }
        else {
            std::cerr << "Unknown command "<< command << std::endl;

        }
    }

    pid_t attach(int argc, const char** argv){
        pid_t pid = 0;

        if (argc == 3 && argv[1] == std::string_view("-p")) {
            std::cout << "Managing pid" <<  std::endl;
            pid = std::atoi(argv[2]);
            if (pid <= 0) {
                std::cerr << "Invalid pid\n";
                return -1;
            } 

            if (ptrace(PTRACE_ATTACH, pid, /*addr=*/nullptr, /*data=*/nullptr) < 0)  {
                std::perror("Could not attach");
                return -1;
            }

        }
        // passing program name
        else {

            const char* program_path = argv[1];
            std::cout << "Forking a child for program " << program_path << " in process "<< getpid() << std::endl;
 
            if ((pid = fork()) < 0) {
                std::perror("fork failed");
                return -1;
            }
          

            if (pid == 0) {
                // In child process
                // Execute debug 
                std::cout << "Entering child process" << " in process "<< getpid() << " pid = " << pid << std::endl;
                if (ptrace(PTRACE_TRACEME, 0, nullptr, nullptr) < 0) {
                    std::perror("Tracing failed");
                    return -1;
                }
                std::cout << "Calling program " << program_path << std::endl;
                
                if (execlp("yes", "yes", nullptr) < 0) {
                    std::perror("Exec failed");
                    return -1;
                }
                std::cout << "Done with child process"<< " in process "<< getpid() << " pid = " << pid   << std::endl;
            }
                
        }
        return pid;
    }
}


int main(int argc, const char** argv) {

    if (argc == 1) {
        std::cerr << "No arguments given\n";
        return -1;
    }

    pid_t pid = attach(argc, argv);
    std::cout << "Pid is read as " << pid << std::endl;
    int wait_status;
    int options = 0;

    if (waitpid(pid, &wait_status, options) < 0) {
        std::perror("waitpid failed");
    }

    char* line = nullptr;
    while ( (line = readline("sdb> ")) != nullptr) {

        std::string line_str;

        if (line == std::string_view("")) {
            std::cout << "handling empty string " << std::endl;
            free(line);
            if (history_length > 0) {
                line_str = history_list()[history_length - 1]->line;
            }
        }

        else {
            std::cout << "handling non empty string " << line << std::endl;
            line_str = line;
            add_history(line);
            free(line);
        }

        if (!line_str.empty()) {
            std::cout << "handling command " << line_str << std::endl;
            handle_command(pid, line);
        }
        
    }
   
}
