#ifndef SDB_PROCESS_HPP
#define SDB_PROCESS_HPP

#include <filesystem>
#include <memory>
#include <sys/types.h>

namespace sdb {

    struct stop_reason {
        stop_reason(int wait_status);
        process_state reason;
        std::uint8_t info;
    };

    enum class process_state {
        stopped,
        running,
        exited,
        terminated
    };


    class process {
        public:
            ~process();
            process_state state() const {return state_;}
            static std::unique_ptr<process> launch(std::filesystem::path path);
            static std::unique_ptr<process> attach(pid_t pid);

            void resume();
            stop_reason wait_on_signal();
            pid_t pid() const {return pid_;}

        private:
            pid_t pid_ = 0;
            bool terminate_on_end_ = true;
            process_state state_ = process_state::stopped;
            process(pid_t pid, bool terminate_on_end)
                : pid_(pid), terminate_on_end_(terminate_on_end) {}

        
        process() = delete;
        process(const process&) = delete;
        process& operator=(const process*) = delete;
    };
}

#endif