#include <kamek.hpp>

BootHook *BootHook::sHooks = NULL;
SectionLoadHook *SectionLoadHook::sHooks = NULL;
RaceLoadHook *RaceLoadHook::sHooks = NULL;
RaceFrameHook *RaceFrameHook::sHooks = NULL;
kmBranch(0x800074d4, BootHook::exec);
kmBranch(0x805320d0, RaceLoadHook::exec);
kmBranch(0x8053369c, RaceFrameHook::exec); //RaceInfo::Update()
kmBranch(0x8063507c, SectionLoadHook::exec);

