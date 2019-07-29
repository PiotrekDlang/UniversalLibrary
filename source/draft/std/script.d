module draft.std.script;

import std.stdio;
import std.process;


struct Command
{

	string program;
	string[] options;
	string[] args() { return program ~ options;};	
}

struct Result
{
    bool success;
	int result;
}

Result executeCommand(Command command)
{
    auto pid = spawnProcess(command.args);
	auto errorCode = wait(pid);
	Result result = {success: true};
	return result;
}

void step(Script script)
{
	script.logDebug("step");
	
	Command command  = { program: "ls", options: ["-al"]},

	executeCommands(command);
}


