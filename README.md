# gromgit's macOS FUSE stuff

This tap exists to support macOS FUSE-related software that have been dropped from Homebrew core.

---

# !!! WARNING: Reduced Build Coverage !!!

All my old Intel Mac hardware is dead, and I'm not inclined to spend additional resources spinning up VMs or building Hackintoshes at this stage. As of 2025-Feb-10, the only bottles built will be for those macOS versions supported by GitHub runners (currently Ventura on Intel and Sonoma on ARM). Sorry.

---

## How do I install these formulae?

First, if you've already installed FUSE formulae from the core tap _before_ they were disabled, you might _not_ want to switch over to my formulae, because:
1. As far as I know, Homebrew will not remove them from your system, even after the formulae themselves are deleted.
2. Many of these formulae are rather old, so you're unlikely to find updates anyway.

But if you _do_ want to install my formulae over the core ones, you should uninstall the core formulae first.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

## FAQ

### Why is XYZ not available?

It's probably available, but with a `-mac` suffix to avoid name clashes with Homebrew core (e.g. `sshfs` becomes `sshfs-mac`).

If you can't find it under its new name, possible reasons include:
1. All available versions of `XYZ` require version 3 of the libfuse API, but macFUSE only supports v2.
2. I might not have gotten around to getting it up. [File an issue](https://github.com/gromgit/homebrew-fuse/issues/new/choose) to get my attention. 😀

### Why is XYZ so old?

Possible reasons:
1. Current `XYZ` requires libfuse v3, so I found and bottled the last version that requires libfuse v2.
2. `XYZ` was abandoned by its authors. If you know of a revived fork of such software, [file an issue](https://github.com/gromgit/homebrew-fuse/issues/new/choose) with the details and I'll see what can be done.
3. I might not have gotten around to updating it yet. [File an issue](https://github.com/gromgit/homebrew-fuse/issues/new/choose) to get my attention. 😀

### Why is the XYZ formula called `XYZ-mac`?

To avoid a naming conflict with the formula called `XYZ` that still exists in Homebrew core.

### Why is the XYZ _program_ installed as `XYZ-mac`?

`brew info gromgit/fuse/XYZ-mac` and read the _Caveats_ section.

### Why does Homebrew say I need to build `XYZ-mac` from source?

All my old Intel Mac hardware is dead, so I'm relying now on the free GitHub runners to build bottles.

### Why can't I build XYZ on an ARM Mac?

Homebrew currently [filters out `/usr/local` entirely during ARM-based builds](https://github.com/Homebrew/brew/blob/04532cb6216b69a5b067aa7a4e22cff0944b257d/Library/Homebrew/shims/super/cc#L266-L270). I've devised a workaround for this, that seems to work well on both Intel and ARM GitHub runners. If you still can't build it, please [file an issue](https://github.com/gromgit/homebrew-fuse/issues/new/choose).
