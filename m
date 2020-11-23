Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web08.41761.1606163571294185129
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 12:32:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=j+DWD5Ag;
 spf=pass (domain: konsulko.com, ip: 209.85.221.65, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f65.google.com with SMTP id l1so20050249wrb.9
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 12:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RqioirMVVi/SMcKvk0J91fPAdIIXR/E/qvNjB4xN9uA=;
        b=j+DWD5Aguwivv/6Qw8WJD9uX7B76a3lbOCZ4xhGsvys7f4JpMKY8INPn82rYv7u/WG
         Gfo5yW4xtk2ySy4SdqgAIAiNAToJLtdccX8PV0ypMSxltxhP0I3NQVJze4x5zhQDecmy
         srqMAAza34QPnh+gcin7qv4VAfFv5OQrOM4kI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RqioirMVVi/SMcKvk0J91fPAdIIXR/E/qvNjB4xN9uA=;
        b=i75DcBgtUxh5ycdX+duPHRN2L5vODszMpKFLezBBCNmlVhICR0+wnSJ0enZxCmv7q0
         75AU4KB4si2BFHElZ4w9gfkfbTsELYAlMgunu1JpuPhS+vymAL0Zk9mYIWYDGE332gQy
         kXDOI0OVULivVQRg+AJzPesX7nH271zBabVWAsiGTsvb5vgoqP0oSSLEqWx2n4KuGuks
         slXs2y8pQfjTlS6M66rlAYlsxmvkRjzO4wjY8igks/51VhldploWiL/kf+yKLMOG4xkC
         eTsRhv7fgI4FVS+h2b07Jb0prgOqow2q6f7Dx+z0Iq757r8GUPoigrRI/tltVmir/4fs
         Jejg==
X-Gm-Message-State: AOAM531SbS04dq5MsDnFTKCjXUSaHk6eUf0wxOkzsVpqGamUtgARBy7t
	sseoqVKO5ybTNPWkqXB1Mb2amfL2zAHYxA==
X-Google-Smtp-Source: ABdhPJyA819IlKBunSp87JH6i4DquEhr5kM9SsfkybUbetiiPo30z5nfm8KpaUaLai7HLJ2Q9CCRzg==
X-Received: by 2002:adf:f24a:: with SMTP id b10mr1559559wrp.352.1606163568188;
        Mon, 23 Nov 2020 12:32:48 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id s25sm790795wmh.16.2020.11.23.12.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 12:32:47 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH] Drop old presentations from repository
Date: Mon, 23 Nov 2020 20:32:45 +0000
Message-Id: <20201123203245.2900-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The `presentations` directory contained two talks which are now over 7
years old and are unlikely to be relevant to current users of the
project. They don't fit in well with the rest of the contents of this
repository and should be dropped. If anyone wants them, they'll still be
stored in the git history :)

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---

    I created this patch with the --no-binary argument to git-format-patch to
    avoid sending megabytes of redundant data to the list. However that means
    the patch doesn't apply as-is. The following steps work for me:

        git am 0001-Drop-old-presentations-from-repository.patch
        git rm -r presentations
        git am --continue

 .../automotive.pin                            | 369 ------------------
 .../blueprint.jpg                             | Bin 693096 -> 0 bytes
 .../automotive-linux-summit-2012/cables.jpg   | Bin 293433 -> 0 bytes
 .../automotive-linux-summit-2012/cake.jpg     | Bin 445144 -> 0 bytes
 .../automotive-linux-summit-2012/cars2.jpg    | Bin 396234 -> 0 bytes
 .../automotive-linux-summit-2012/cat.jpg      | Bin 374719 -> 0 bytes
 .../automotive-linux-summit-2012/chip.jpg     | Bin 96668 -> 0 bytes
 .../automotive-linux-summit-2012/corridor.jpg | Bin 294956 -> 0 bytes
 .../automotive-linux-summit-2012/cpus.jpg     | Bin 475614 -> 0 bytes
 .../automotive-linux-summit-2012/dash.jpg     | Bin 131336 -> 0 bytes
 .../automotive-linux-summit-2012/dolls.jpg    | Bin 237901 -> 0 bytes
 .../automotive-linux-summit-2012/engineer.jpg | Bin 310702 -> 0 bytes
 .../automotive-linux-summit-2012/group.jpg    | Bin 392570 -> 0 bytes
 .../automotive-linux-summit-2012/hob.jpg      | Bin 561538 -> 0 bytes
 .../automotive-linux-summit-2012/minifigs.jpg | Bin 497571 -> 0 bytes
 .../automotive-linux-summit-2012/none.json    |  50 ---
 .../automotive-linux-summit-2012/owl.jpg      | Bin 339288 -> 0 bytes
 .../automotive-linux-summit-2012/people.jpg   | Bin 268848 -> 0 bytes
 .../automotive-linux-summit-2012/qa.jpg       | Bin 167108 -> 0 bytes
 .../automotive-linux-summit-2012/question.jpg | Bin 505072 -> 0 bytes
 .../automotive-linux-summit-2012/road.jpg     | Bin 188611 -> 0 bytes
 .../automotive-linux-summit-2012/tins.jpg     | Bin 501518 -> 0 bytes
 .../automotive-linux-summit-2012/tools.jpg    | Bin 547380 -> 0 bytes
 .../automotive-linux-summit-2012/tumble.jpg   | Bin 438564 -> 0 bytes
 .../automotive-linux-summit-2012/umbrella.jpg | Bin 311845 -> 0 bytes
 .../automotive-linux-summit-2012/xwing.jpg    | Bin 421747 -> 0 bytes
 .../automotive-linux-summit-2012/yocto.jpg    | Bin 40098 -> 0 bytes
 .../osts-2013-why-use-yocto/advert.jpg        | Bin 649120 -> 0 bytes
 .../osts-2013-why-use-yocto/apple.jpg         | Bin 565059 -> 0 bytes
 .../osts-2013-why-use-yocto/bike.jpg          | Bin 611684 -> 0 bytes
 .../osts-2013-why-use-yocto/bomb.jpg          | Bin 82008 -> 0 bytes
 .../osts-2013-why-use-yocto/cables.jpg        | Bin 293433 -> 0 bytes
 .../osts-2013-why-use-yocto/clay.jpg          | Bin 66128 -> 0 bytes
 .../osts-2013-why-use-yocto/data.jpg          | Bin 432108 -> 0 bytes
 .../osts-2013-why-use-yocto/engineer.jpg      | Bin 310702 -> 0 bytes
 .../osts-2013-why-use-yocto/labquest.jpg      | Bin 35381 -> 0 bytes
 .../osts-2013-why-use-yocto/license.jpg       | Bin 236192 -> 0 bytes
 .../osts-2013-why-use-yocto/minifigs.jpg      | Bin 497571 -> 0 bytes
 presentations/osts-2013-why-use-yocto/qa.jpg  | Bin 167108 -> 0 bytes
 .../osts-2013-why-use-yocto/road.jpg          | Bin 188611 -> 0 bytes
 .../osts-2013-why-use-yocto/train.jpg         | Bin 399452 -> 0 bytes
 presentations/osts-2013-why-use-yocto/tv.jpg  | Bin 392568 -> 0 bytes
 .../osts-2013-why-use-yocto/xeon-phi.jpg      | Bin 158595 -> 0 bytes
 .../osts-2013-why-use-yocto/yocto.jpg         | Bin 40098 -> 0 bytes
 .../osts-2013-why-use-yocto/yocto.pin         | 254 ------------
 45 files changed, 673 deletions(-)
 delete mode 100644 presentations/automotive-linux-summit-2012/automotive.pin
 delete mode 100644 presentations/automotive-linux-summit-2012/blueprint.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/cables.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/cake.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/cars2.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/cat.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/chip.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/corridor.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/cpus.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/dash.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/dolls.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/engineer.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/group.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/hob.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/minifigs.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/none.json
 delete mode 100644 presentations/automotive-linux-summit-2012/owl.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/people.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/qa.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/question.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/road.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/tins.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/tools.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/tumble.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/umbrella.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/xwing.jpg
 delete mode 100644 presentations/automotive-linux-summit-2012/yocto.jpg
 delete mode 100644 presentations/osts-2013-why-use-yocto/advert.jpg
 delete mode 100644 presentations/osts-2013-why-use-yocto/apple.jpg
 delete mode 100644 presentations/osts-2013-why-use-yocto/bike.jpg
 delete mode 100644 presentations/osts-2013-why-use-yocto/bomb.jpg
 delete mode 100644 presentations/osts-2013-why-use-yocto/cables.jpg
 delete mode 100644 presentations/osts-2013-why-use-yocto/clay.jpg
 delete mode 100644 presentations/osts-2013-why-use-yocto/data.jpg
 delete mode 100644 presentations/osts-2013-why-use-yocto/engineer.jpg
 delete mode 100644 presentations/osts-2013-why-use-yocto/labquest.jpg
 delete mode 100644 presentations/osts-2013-why-use-yocto/license.jpg
 delete mode 100644 presentations/osts-2013-why-use-yocto/minifigs.jpg
 delete mode 100644 presentations/osts-2013-why-use-yocto/qa.jpg
 delete mode 100644 presentations/osts-2013-why-use-yocto/road.jpg
 delete mode 100644 presentations/osts-2013-why-use-yocto/train.jpg
 delete mode 100644 presentations/osts-2013-why-use-yocto/tv.jpg
 delete mode 100644 presentations/osts-2013-why-use-yocto/xeon-phi.jpg
 delete mode 100644 presentations/osts-2013-why-use-yocto/yocto.jpg
 delete mode 100644 presentations/osts-2013-why-use-yocto/yocto.pin

diff --git a/presentations/automotive-linux-summit-2012/automotive.pin b/presentations/automotive-linux-summit-2012/automotive.pin
deleted file mode 100644
index c5292fbfe..000000000
--- a/presentations/automotive-linux-summit-2012/automotive.pin
+++ /dev/null
@@ -1,369 +0,0 @@
-#!/usr/bin/env pinpoint
-
-[fill]
-[bottom]
-[font=ITC Kabel Semi-Bold 60px]
-[transition=fade]
--- [yocto.jpg] [duration=15.152699]
-
-# Ross Burton, Userspace Architect for Yocto
-# Open Source Technology Centre at Intel
-# This session is a high level introduction to the Yocto Project
-
--- [cars2.jpg] [duration=18.412748]
-What is the Yocto Project?
-# Appears to be confusion in the automotive community about the Yocto Project.
-# What is is, what it can offer and so on.
-# We were invited by the LF to come here and clarify what Yocto is.
-# So, the Yocto Project is...
-
--- [umbrella.jpg] [duration=13.583521]
-Umbrella project
-# An umbrella project.
-# You don't download or install the Yocto Project itself
-# Just like you don't install the Apache Foundation
-
--- [tools.jpg] [duration=27.991919]
-Build environment
-and development tools
-# An embedded build environment and development tools
-# Specifically, a build system (bitbake), package metadata (oe-core),
-# Eclipse plugin, Application Development Toolkit (deployable toolchain)
-
--- [cpus.jpg] [text-align=center] [center] [duration=49.765675]
-x86 • ARM
-MIPS • PowerPC
-# We support all of the big architectures.
-# oe-core builds for qemu machines for all of these architectures
-# Ensures that the core builds for everything
-# Optional BSPs for specific platform support
-# Everything is cross compiled, so no "but it worked for x86" problems
-
--- [people.jpg] [duration=22.377592]
-Collaboration space
-# Finally YP is a collaboration space, providing a forum
-# for users to share their problems and solutions
-# Public mailing lists and weekly phone conference
-# PAUSE
-
--- [minifigs.jpg] [center] [duration=18.553514]
-So many choices…
-# When picking a platform what's the difference between yocto and
-# android, linaro, tizen, buildroot, baserock, or hacking your
-# favourite desktop distribution...
-
--- [engineer.jpg] [duration=56.184429]
-…why pick the Yocto Project?
-# YP is Linux for embedded, from a small ARM board to mission critical
-#  xeon clusters
-# Builds a custom distro suited to your needs
-# Easy to add, remove, or change components
-# Open development process, no code drops or license complications
-
--- [cables.jpg] [duration=40.872715]
-Some are easy to hack on,
-but you’ll regret it later
-# Especially if your target is x86, it's easy to start with a
-# desktop distribution and chop pieces out
-# Building new pieces and rebuilding the pieces that need changes
-# But when you need to change hardware, or rebuild with different compiler flags
-# It's not that easy any more
-
--- [road.jpg] [top] [duration=47.108444]
-Designed for the long term
-# Yocto is designed for long term use
-# Six monthly release cycle but maintained release branches
-# Commercial support from OSVs
-# Tools to help do the mundane distribution building
-# - Generate package repos and disk images
-# - Static release archives for license compliance
-
--- [tumble.jpg] [top] [duration=45.338825]
-Won’t fall apart in time
-# Yocto won't surprise you late in product development
-# Reproducable builds for the entire system
-# Clear process for updates - easy to make the changes
-# and publish a new image or repo
-# GPL compliant - trivial to public source *and* build instructions
-
--- [group.jpg] [duration=9.779828]
-Who is in the Yocto Project?
-# Not a complete list
-
--- [chip.jpg] [duration=15.615728]
-Hardware manufacturers
-# i.e. Intel, Texas Instruments, Freescale
-
--- [tins.jpg] [duration=26.482639]
-Embedded OSVs
-# i.e. Wind River, MontaVista, Enea Software, Mentor Graphics
-# Commercial supported linux from these vendors
-
--- [cat.jpg] [duration=31.311359]
-Consultants and individuals
-# Consultants, small and large
-# individuals "scratching an itch" for their own projects
-
--- [owl.jpg] [top] [duration=60.471573]
-Advisory Board
-# finally should mention the advisory board.
-# Yocto is a project at the Linux Foundation, not owned by any
-# particular company
-# The advisory board is comprised of reps from member companies
-# working on Yocto
-# The boards first action was to name itself "advisory board" rather
-# than "steering group" to reflect that it offers advice and input and
-# doesn't control the project technical direction entirely in the
-# hands of the architects and maintainers
-
--- [xwing.jpg] [duration=10.061844]
-How does it work?
-# Enough about what the Yocto Project can do
-# How does it work?
-
--- [cake.jpg] [duration=36.383984]
-It’s all about the layers
-# A YP distribution is assembled from a number of layers
-# Layers are modular and you can combine layers from different sources
-# An example
-
--- [blueprint.jpg] [text-align=center] [duration=19.801914]
-Bitbake
-# Build system
-
--- [blueprint.jpg] [text-align=center] [transition=none] [duration=42.480724]
-oe-core
-Bitbake
-# core metadata
-# toolchain, kernel, eglibc, cairo, gstreamer, Xorg, Wayland (soon), gtk/qt
-
--- [blueprint.jpg] [text-align=center] [transition=none] [duration=27.569431]
-meta-intel
-oe-core
-Bitbake
-# unless you happy with a qemu emulated machine you'll need a bsp
-# Intel hardware BSP, such as cedar trail (atom, netbook/industrial), fish river
-# island 2 (atom, digital signage, smart services), jasper forest (xeon, server)
-
--- [blueprint.jpg] [text-align=center] [transition=none] [duration=42.118870]
-meta-yocto
-meta-intel
-oe-core
-Bitbake
-# Distribution policy
-# (Poky in meta-yocto for historial reasons)
-
--- [corridor.jpg] [duration=15.193717]
-Let’s build something!
-# Enough talk, let's pretend to build something.
-
--- [corridor.jpg] [center] [duration=58.901318]
-<tt>$ <b>wget http://downloads.yoctoproject.org/…
-       /poky-denzil-7.0.tar.bz2</b>
-$ <b>tar xjf poky-denzil-7.0.tar.bz2</b>
-$ <b>cd poky-denzil-7.0</b></tt>
-# One of the downloads from the Yocto Project is Poky, a reference
-# distribution.  This is basically Bitbake, oe-core, and meta-yocto
-# glued together for convenience Grabbing and extracting the tarball
-# of the 7.0 "denzil" release is as you'd expect
-
--- [corridor.jpg] [center] [duration=44.895329]
-<tt> $ <b>./oe-init-build-env</b>
- ### Shell environment set up for builds. 
- ### You can now run 'bitbake &lt;target&gt;‘
- Common targets are:
-   core-image-minimal
-   core-image-sato
- …
- $ <b>emacs conf/local.conf</b></tt>
-# First you need to source a shell script to setup the environment. 
-# Now lets have a quick look at the configuration file
-
--- [corridor.jpg] [center] [duration=64.857567]
-<tt> # BB_NUMBER_THREADS = "4"
- # PARALLEL_MAKE = "-j 4"
- 
- MACHINE ??= "qemux86"
- …
- #MACHINE ?= "qemuarm"
- #MACHINE ?= "qemumips"
- #MACHINE ?= "atom-pc"
- #MACHINE ?= "beagleboard"</tt>
-# Just a small fragment of the options available.  Defaults are all
-# reasonable and it will successfully build out of the box.
-# For a faster build, change the parallel options. My build machine is
-# a quad core with hyperthreading, so I set both of those to 8 to keep
-# it busy
-# Default target is x86 on qemu.  This is trivially changed by simply
-# changing the MACHINE variable.
-# Other options include where to keep downloaded tarballs; location of
-# any mirrors; features to enable such as multiarch, installing the
-# toolchain in the image for development, what package format to use,
-# and more.
-
--- [corridor.jpg] [center] [duration=38.235931]
- <tt>$ <b>bitbake core-image-minimal</b></tt>
-# Then, you can run bitbake with the name of the target you want
-# Targets can be anything - images, packages, or operations.
-# Let's build core-image-minimal, a small system that boots to a
-# console good start to build up from if you're making a
-# single-purpose system
-
--- [corridor.jpg] [center] [duration=61.638290]
-<tt>Currently 7 running tasks (5452 of 9438):
-0: webkit-gtk-1.8.2-r1 do_compile (pid 27137)
-1: qt4-embedded-4.8.1-r48.1 do_compile (pid 27129)
-2: qt4-x11-free-4.8.1-r46.1 do_compile (pid 27096)
-3: systemtap-1.8+git1…-r0 do_compile (pid 27130)
-4: gmp-5.0.5-r0 do_package_write_rpm (pid 27131)
-5: libglade-2.6.4-r4 do_package_write_rpm (pid 27134)
-6: nfs-utils-1.2.3-r5 do_unpack (pid 27187)</tt>
-# While bitbake is running you'll see a report of what it's doing,
-# something like this. This isn't actually the output from
-# core-image-minimal but a colleague's world build that happened to be
-# running when I was writing the slides.  Poor guy is in for a long
-# wait, webkit and two qt builds.
-
--- [corridor.jpg] [center] [duration=33.001926]
-<tt>$ <b>ls tmp/deploy/images/</b>
-…
-core-image-minimal-atom-pc-20120918205848.hddimg
-core-image-minimal-atom-pc-20120918205848.iso
-core-image-minimal-atom-pc-20120918205848.rootfs.cpio.gz
-core-image-minimal-atom-pc-20120918205848.rootfs.ext3
-</tt>
-# When it finishes building the results are in the deploy directory
-# Here we can see the constructed root file system as a cpio archive,
-# a bare filesystem, a bootable ISO image, and a disk image.
-# Generally I'd be writing the disk image to a fast USB stick with dd
-# and booting from that for testing.
-# The build output is configurable per build and per machine. This
-# build was for a fairly standard Intel system so the final output is
-# typically bootable on those.  Build for a say beagleboard and you'll
-# get kernel, bootloader and rootfs tarballs to write a SD card.
-# alongside the images directory there is the package repository that
-# was used to construct the root fs. This can be shared on the network
-# and used as a normal repository, ie install some development or
-# debug symbol packages to fix a bug.
-
--- [hob.jpg] [duration=47.693535]
-Hob
-# Hob is a graphical interface to bitbake
-# demo gremlins have decided to break hob on this laptop - works on my build machine
-# 1st iteration, gtk+ application to configure an image and monitor the build
-# 2nd iteration, web-based. currently under development.
-
--- [question.jpg] [duration=17.024797]
-Now what?
-# So that's how to build an image, but what could we do with it?
-# Two quick ideas
-
--- [dolls.jpg] [top] [duration=42.701355]
-Virtualisation
-# I expect virtualisation to be common in next-generation automotive
-# systems as individual processors become more powerful and logically
-# separate systems are ran in virtual machines on fewer physical
-# processors.
-# Because systems built by Yocto can be trivially tuned to be exactly
-# what is required and nothing else they are a good match for
-# virtualised systems, both as a minimal host that does simply manages
-# the virtual machines, or as a specialized virtual machine itself.
-
--- [dash.jpg] [top] [duration=24.712542]
-Specialised subsystem
-# Cars are complicated beasts these days with many processors performing specialised roles
-# Dashboard, engine management, and so on.
-
--- [qa.jpg] [duration=10.726003]
-Q&amp;A
-
--- [yocto.jpg]
-Thanks!
-
-# Credits
-#
-# cars2.jpg
-# http://www.flickr.com/photos/15443451@N00/516336421/
-# Creative Commons 2.0 BY-NC-SA (C) Piyapat Ch.
-# 
-# cables.jpg
-# group.jpg
-# tumble.jpg
-# umbrella.jpg
-# (C) David Stewart, All Rights Reserved, Used with Permission.
-# 
-# tools.jpg
-# http://www.flickr.com/photos/22749993@N08/5386712834/
-# Creative Commons 2.0 BY (C) Jim Pennucci
-# 
-# cpus.jpg
-# http://www.flickr.com/photos/17642817@N00/4553998825/
-# Creative Commons 2.0 BY (C) Jason Rogers
-# 
-# people.jpg
-# http://www.flickr.com/photos/29370225@N03/6292167005/
-# Creative Commons 2.0 BY (C) Roberto Trm
-# 
-# minifigs.jpg
-# http://www.flickr.com/photos/40646519@N00/305410323/
-# Creative Commons 2.0 BY (C) peter dutton
-# 
-# engineer.jpg
-# http://www.flickr.com/photos/39066002@N05/3595313340/
-# Creative Commons 2.0 BY-NC-SA (C) RoberthK
-# 
-# road.jpg
-# http://www.flickr.com/photos/81851211@N00/5861614/
-# Creative Commons 2.0 BY-NC-SA (C) Rick Harrison
-# 
-# chip.jpg
-# http://www.flickr.com/photos/19616961@N00/41549347/
-# Creative Commons 2.0 BY (C) Rodrigo Senna
-# 
-# tins.jpg
-# http://www.flickr.com/photos/75771631@N00/5185871835/
-# Creative Commons 2.0 BY (C) Matthew Hine
-# 
-# cat.jpg
-# http://www.flickr.com/photos/9516941@N08/2286083797/
-# Creative Commons 2.0 BY (C) Tristan Bowersox
-# 
-# owl.jpg
-# http://www.flickr.com/photos/95962912@N00/161060725/
-# Creative Commons 2.0 BY-NC-SA (C) Nuno Barreto
-# 
-# xwing.jpg
-# http://www.flickr.com/photos/55723329@N00/6657150957/
-# Creative Commons 2.0 BY (C) psiaki
-# 
-# cake.jpg
-# http://www.flickr.com/photos/megpi/2690878513/
-# Creative Commons 2.0 BY-NC-SA (C) megpi
-# 
-# blueprint.jpg
-# http://www.flickr.com/photos/71745913@N00/2576799956/
-# Creative Commons 2.0 BY-NC-SA (C) HD41117
-# 
-# corridor.jpg
-# http://www.flickr.com/photos/71865026@N00/1264424156/
-# Creative Commons 2.0 BY-SA (C) Mark Sebastian
-# 
-# hob.jpg
-# http://www.flickr.com/photos/11247388@N00/5436586179/
-# Creative Commons 2.0 BY (C) sunshinecity
-# 
-# question.jpg
-# http://www.flickr.com/photos/65555826@N00/1447024668/
-# Creative Commons 2.0 BY (C) wonderferret
-# 
-# dolls.jpg
-# http://www.flickr.com/photos/30692297@N07/5454308102/
-# Creative Commons 2.0 BY-NC-SA (C) Adrian S Jones
-# 
-# dash.jpg
-# http://www.flickr.com/photos/97856361@N00/167428099/
-# Creative Commons 2.0 BY-NC-SA (C) Albert Lynn
-# 
-# qa.jpg
-# http://www.flickr.com/photos/39039882@N00/22778226/
-# Creative Commons 2.0 BY-NC (C) Tantek Çelik
diff --git a/presentations/automotive-linux-summit-2012/blueprint.jpg b/presentations/automotive-linux-summit-2012/blueprint.jpg
deleted file mode 100644
index be7e9ce85..000000000
Binary files a/presentations/automotive-linux-summit-2012/blueprint.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/cables.jpg b/presentations/automotive-linux-summit-2012/cables.jpg
deleted file mode 100644
index 3fdc7c69c..000000000
Binary files a/presentations/automotive-linux-summit-2012/cables.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/cake.jpg b/presentations/automotive-linux-summit-2012/cake.jpg
deleted file mode 100644
index b0304cbdd..000000000
Binary files a/presentations/automotive-linux-summit-2012/cake.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/cars2.jpg b/presentations/automotive-linux-summit-2012/cars2.jpg
deleted file mode 100644
index 00e3f64cb..000000000
Binary files a/presentations/automotive-linux-summit-2012/cars2.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/cat.jpg b/presentations/automotive-linux-summit-2012/cat.jpg
deleted file mode 100644
index 2d255c001..000000000
Binary files a/presentations/automotive-linux-summit-2012/cat.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/chip.jpg b/presentations/automotive-linux-summit-2012/chip.jpg
deleted file mode 100644
index 6fb58c8c9..000000000
Binary files a/presentations/automotive-linux-summit-2012/chip.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/corridor.jpg b/presentations/automotive-linux-summit-2012/corridor.jpg
deleted file mode 100644
index b9ec29d3a..000000000
Binary files a/presentations/automotive-linux-summit-2012/corridor.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/cpus.jpg b/presentations/automotive-linux-summit-2012/cpus.jpg
deleted file mode 100644
index 65f81ffcb..000000000
Binary files a/presentations/automotive-linux-summit-2012/cpus.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/dash.jpg b/presentations/automotive-linux-summit-2012/dash.jpg
deleted file mode 100644
index 47e91d022..000000000
Binary files a/presentations/automotive-linux-summit-2012/dash.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/dolls.jpg b/presentations/automotive-linux-summit-2012/dolls.jpg
deleted file mode 100644
index 2e8193d63..000000000
Binary files a/presentations/automotive-linux-summit-2012/dolls.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/engineer.jpg b/presentations/automotive-linux-summit-2012/engineer.jpg
deleted file mode 100644
index 71b7350bc..000000000
Binary files a/presentations/automotive-linux-summit-2012/engineer.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/group.jpg b/presentations/automotive-linux-summit-2012/group.jpg
deleted file mode 100644
index d71666a9b..000000000
Binary files a/presentations/automotive-linux-summit-2012/group.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/hob.jpg b/presentations/automotive-linux-summit-2012/hob.jpg
deleted file mode 100644
index 646f79345..000000000
Binary files a/presentations/automotive-linux-summit-2012/hob.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/minifigs.jpg b/presentations/automotive-linux-summit-2012/minifigs.jpg
deleted file mode 100644
index 3c63cbd14..000000000
Binary files a/presentations/automotive-linux-summit-2012/minifigs.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/none.json b/presentations/automotive-linux-summit-2012/none.json
deleted file mode 100644
index ab050bf34..000000000
--- a/presentations/automotive-linux-summit-2012/none.json
+++ /dev/null
@@ -1,50 +0,0 @@
-[{
-  "type":"ClutterGroup",
-  "id":"actor",
-  "rotation-center-z-gravity":"center",
-  "scale-gravity":"center",
-  "children":[
-     {
-       "id":"background",
-       "type":"ClutterGroup",
-       "rotation-center-z-gravity":"center",
-       "scale-gravity":"center"
-     },
-     {
-       "type":"ClutterGroup",
-       "children":[
-     {
-       "id":"midground",
-       "type":"ClutterGroup",
-       "rotation-center-z-gravity":"center",
-       "scale-gravity":"center"
-     }]},
-     {
-       "id":"foreground",
-       "type":"ClutterGroup",
-       "rotation-center-z-gravity":"center",
-       "scale-gravity":"center"
-     }
-  ]}
-  ,{
-  "type":"ClutterState",
-  "id":"state",
-  "duration":1,
-  "transitions":[
-      {
-        "source":null,
-        "target":"pre",
-        "keys": [["actor", "opacity",  "linear", 0]]
-      },
-      {
-        "source":null,
-        "target":"show",
-        "keys": [["actor", "opacity",  "linear", 255]]
-      },
-      {
-        "source":null,
-        "target":"post",
-        "keys": [["actor", "opacity",  "linear", 0]]
-      }
-  ]}
-]
diff --git a/presentations/automotive-linux-summit-2012/owl.jpg b/presentations/automotive-linux-summit-2012/owl.jpg
deleted file mode 100644
index 8eda131ba..000000000
Binary files a/presentations/automotive-linux-summit-2012/owl.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/people.jpg b/presentations/automotive-linux-summit-2012/people.jpg
deleted file mode 100644
index 3c596a2a8..000000000
Binary files a/presentations/automotive-linux-summit-2012/people.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/qa.jpg b/presentations/automotive-linux-summit-2012/qa.jpg
deleted file mode 100644
index 11164d97e..000000000
Binary files a/presentations/automotive-linux-summit-2012/qa.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/question.jpg b/presentations/automotive-linux-summit-2012/question.jpg
deleted file mode 100644
index a0c1991a0..000000000
Binary files a/presentations/automotive-linux-summit-2012/question.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/road.jpg b/presentations/automotive-linux-summit-2012/road.jpg
deleted file mode 100644
index a0e373cab..000000000
Binary files a/presentations/automotive-linux-summit-2012/road.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/tins.jpg b/presentations/automotive-linux-summit-2012/tins.jpg
deleted file mode 100644
index 607a86394..000000000
Binary files a/presentations/automotive-linux-summit-2012/tins.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/tools.jpg b/presentations/automotive-linux-summit-2012/tools.jpg
deleted file mode 100644
index 31f2f9629..000000000
Binary files a/presentations/automotive-linux-summit-2012/tools.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/tumble.jpg b/presentations/automotive-linux-summit-2012/tumble.jpg
deleted file mode 100644
index 3c63f2998..000000000
Binary files a/presentations/automotive-linux-summit-2012/tumble.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/umbrella.jpg b/presentations/automotive-linux-summit-2012/umbrella.jpg
deleted file mode 100644
index e68fd46fa..000000000
Binary files a/presentations/automotive-linux-summit-2012/umbrella.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/xwing.jpg b/presentations/automotive-linux-summit-2012/xwing.jpg
deleted file mode 100644
index e8ada6b8c..000000000
Binary files a/presentations/automotive-linux-summit-2012/xwing.jpg and /dev/null differ
diff --git a/presentations/automotive-linux-summit-2012/yocto.jpg b/presentations/automotive-linux-summit-2012/yocto.jpg
deleted file mode 100644
index 333aec64b..000000000
Binary files a/presentations/automotive-linux-summit-2012/yocto.jpg and /dev/null differ
diff --git a/presentations/osts-2013-why-use-yocto/advert.jpg b/presentations/osts-2013-why-use-yocto/advert.jpg
deleted file mode 100644
index 2288b2521..000000000
Binary files a/presentations/osts-2013-why-use-yocto/advert.jpg and /dev/null differ
diff --git a/presentations/osts-2013-why-use-yocto/apple.jpg b/presentations/osts-2013-why-use-yocto/apple.jpg
deleted file mode 100644
index d3b7c9c99..000000000
Binary files a/presentations/osts-2013-why-use-yocto/apple.jpg and /dev/null differ
diff --git a/presentations/osts-2013-why-use-yocto/bike.jpg b/presentations/osts-2013-why-use-yocto/bike.jpg
deleted file mode 100644
index dd561732f..000000000
Binary files a/presentations/osts-2013-why-use-yocto/bike.jpg and /dev/null differ
diff --git a/presentations/osts-2013-why-use-yocto/bomb.jpg b/presentations/osts-2013-why-use-yocto/bomb.jpg
deleted file mode 100644
index 1fd5e07c5..000000000
Binary files a/presentations/osts-2013-why-use-yocto/bomb.jpg and /dev/null differ
diff --git a/presentations/osts-2013-why-use-yocto/cables.jpg b/presentations/osts-2013-why-use-yocto/cables.jpg
deleted file mode 100644
index 3fdc7c69c..000000000
Binary files a/presentations/osts-2013-why-use-yocto/cables.jpg and /dev/null differ
diff --git a/presentations/osts-2013-why-use-yocto/clay.jpg b/presentations/osts-2013-why-use-yocto/clay.jpg
deleted file mode 100644
index a22a3acb6..000000000
Binary files a/presentations/osts-2013-why-use-yocto/clay.jpg and /dev/null differ
diff --git a/presentations/osts-2013-why-use-yocto/data.jpg b/presentations/osts-2013-why-use-yocto/data.jpg
deleted file mode 100644
index 482059419..000000000
Binary files a/presentations/osts-2013-why-use-yocto/data.jpg and /dev/null differ
diff --git a/presentations/osts-2013-why-use-yocto/engineer.jpg b/presentations/osts-2013-why-use-yocto/engineer.jpg
deleted file mode 100644
index 71b7350bc..000000000
Binary files a/presentations/osts-2013-why-use-yocto/engineer.jpg and /dev/null differ
diff --git a/presentations/osts-2013-why-use-yocto/labquest.jpg b/presentations/osts-2013-why-use-yocto/labquest.jpg
deleted file mode 100644
index 9406a9daf..000000000
Binary files a/presentations/osts-2013-why-use-yocto/labquest.jpg and /dev/null differ
diff --git a/presentations/osts-2013-why-use-yocto/license.jpg b/presentations/osts-2013-why-use-yocto/license.jpg
deleted file mode 100644
index 4d1fd0034..000000000
Binary files a/presentations/osts-2013-why-use-yocto/license.jpg and /dev/null differ
diff --git a/presentations/osts-2013-why-use-yocto/minifigs.jpg b/presentations/osts-2013-why-use-yocto/minifigs.jpg
deleted file mode 100644
index 3c63cbd14..000000000
Binary files a/presentations/osts-2013-why-use-yocto/minifigs.jpg and /dev/null differ
diff --git a/presentations/osts-2013-why-use-yocto/qa.jpg b/presentations/osts-2013-why-use-yocto/qa.jpg
deleted file mode 100644
index 11164d97e..000000000
Binary files a/presentations/osts-2013-why-use-yocto/qa.jpg and /dev/null differ
diff --git a/presentations/osts-2013-why-use-yocto/road.jpg b/presentations/osts-2013-why-use-yocto/road.jpg
deleted file mode 100644
index a0e373cab..000000000
Binary files a/presentations/osts-2013-why-use-yocto/road.jpg and /dev/null differ
diff --git a/presentations/osts-2013-why-use-yocto/train.jpg b/presentations/osts-2013-why-use-yocto/train.jpg
deleted file mode 100644
index c748db1b9..000000000
Binary files a/presentations/osts-2013-why-use-yocto/train.jpg and /dev/null differ
diff --git a/presentations/osts-2013-why-use-yocto/tv.jpg b/presentations/osts-2013-why-use-yocto/tv.jpg
deleted file mode 100644
index 4742383e8..000000000
Binary files a/presentations/osts-2013-why-use-yocto/tv.jpg and /dev/null differ
diff --git a/presentations/osts-2013-why-use-yocto/xeon-phi.jpg b/presentations/osts-2013-why-use-yocto/xeon-phi.jpg
deleted file mode 100644
index 3e914aaec..000000000
Binary files a/presentations/osts-2013-why-use-yocto/xeon-phi.jpg and /dev/null differ
diff --git a/presentations/osts-2013-why-use-yocto/yocto.jpg b/presentations/osts-2013-why-use-yocto/yocto.jpg
deleted file mode 100644
index 333aec64b..000000000
Binary files a/presentations/osts-2013-why-use-yocto/yocto.jpg and /dev/null differ
diff --git a/presentations/osts-2013-why-use-yocto/yocto.pin b/presentations/osts-2013-why-use-yocto/yocto.pin
deleted file mode 100644
index 4ea52b85e..000000000
--- a/presentations/osts-2013-why-use-yocto/yocto.pin
+++ /dev/null
@@ -1,254 +0,0 @@
-#!/usr/bin/env pinpoint
-
-[fill]
-[bottom]
-[font=ITC Kabel Semi-Bold 80px]
-[transition=fade]
--- [yocto.jpg]
-
-# Ross Burton, a senior engineer on the Yocto Project
-#
-# Been working on Yocto for nearly a year, but also worked on the precursor to Yocto, Poky, before working on moblin, meego and tizen.
-
--- [black] [text-align=center] [center]
-Why you should use
-the Yocto Project
-(instead of a desktop Linux)
-for your product
-#I'm talking about why you should use the Yocto Project (instead of a desktop Linux) for your pproduct
-#
-#They say when you can't summarise your talk in three words, why not use thirty, so I added a subtitle
-
--- [bomb.jpg] [text-align=center]
-or,
-How I Learned To Stop Worrying
-And Love Building Distros
-#How I learned to stop worrying and love building distros.
-#
-#Because every conference should have a Dr Strangelove reference.
-#
-#Although this is less funny now that BAE systems have just appeared on the support mailing list.
-
--- [yocto.jpg]
-“It's not an embedded Linux distribution
-— it creates a custom one for you”
-#What is the Yocto Project?
-#
-#YP is not a Linux distribution in the traditional sense, it helps you build a tailored Linux distribution for your embedded Linux product
-#
-#But what do we mean by embedded? Embedded means different things to different people.
-
--- [apple.jpg]
-Not a “PC”
-#Basically, "not general purpose desktop computing".
-#
-#There are many examples where the YP is a good fit
-
--- [tv.jpg]
-Home Media
-#Home media: Televisions, digital video recorders, set-top boxes, wireless speakers, internet radios.
-#
-#Our set-top box division is rebasing their SDK to YP right now, after maintaining their own linux distro.
-
--- [advert.jpg]
-Digital Signage
-#Digital signage, such as the schedule displays you can see in the hallway, airport departure panels, so on.
-#
-#I certainy hope that next year instead of mac minis we're using minnow boards.
-
--- [data.jpg] [text-align=center]
-Telecoms
-Data Centre
-#Telecoms and data centres, where you'll have clusters of xeons running core networking, or other specialised applications
-#
-#These are basically incredible powerful appliances, not general purpose machines. they need every bit of power squeezed out of their hardware, and generalising, even with an enterprise distro, may not be enough.
-
--- [xeon-phi.jpg]
-Intel® Xeon Phi™
-(ding dong ding dong!)
-#Xeon Phi, aka MIC or Knights Corner.
-#
-#Can't get much more embedded than a PCI Express board with 64 x86 cores on. These are for massive number crunching, and each runs a Linux platform built by the Yocto Project.
-#
-#The processor was once upon a time a Pentium but is substantially extended, and the system is totally unlike anything else, so they needed a Linux system that could be massively customised to fit their needs.
-
--- [labquest.jpg]
-Misc and Other
-#The fun thing about YP is you can't predict where people use it.
-#
-#This is the Vernier LabQuest, a flexible science probe for education.
-#
-#webOS, the platform on the palm phone and tablets, is built using YP.
-#
-#If you update the firmware in your Intel SSD, that tool is built with Yocto
-#
-#Concordia, our software defined radio platform, runs on YP.
-#
-#PAUSE.
-#
-#Now we know what sort of products the YP is aimed at, why should you use it?
-
--- [minifigs.jpg] [center]
-So many choices!
-#When picking a platform what's the difference between Yocto and Android, Linaro, Tizen, Buildroot, Baserock, or hacking your favourite desktop distribution such as Fedora or Debian, especially as some have embedded versions such as emdebian.
-
--- [cables.jpg]
-Easy to hack on at first,
-but you’ll regret it later
-#When your processor is x86, it's easy to prototype with a desktop distribution and chop pieces off
-#
-#Building new packages and rebuilding the pieces that need changes
-#
-#By the time the prototype is working well, you've invested enough effort that starting again to remove the hacks is off-putting.
-#
-#But you may end up with a fragile system, or the need to do something invasive such as rebuild the entire product with new compiler flags, it's not that easy any more
-
--- [road.jpg] [top]
-Designed to go
-the distance
-#Yocto is proven technology and designed for long term use
-#
-#The build tool and package metadata (BitBake and OpenEmbedded) have been around for ten years with major deployments
-#
-#Builds on standard hardware (use your laptop to try it out) without any special requirements (eg no VM or root permission), just disk space and a compiler to bootstrap.
-#
-#Commercial support from major OSVs and specialized consultancies
-#
-#Finally no restrictions in it's use, the build system is GPL/MIT, no terms to agree to.
-#
-#Speaking of licensing
-
--- [license.jpg] [center]
-
-Licensing Hell
-#It's easy to accidently break OSS licensing terms, so YP tries to help.
-#
-#Around $100k per violation
-#
-#All recipes need a license statement, and checksums to validate. if a new upstream release changes their license statements and you didn't notice, the build errors and the maintainer must verify the license situation.
-#
-#"No GPLv3" button when building that can will disable v3 features or whole packages if the v3 bothers you.
-#
-# Generate release archives for license compliance, full source and patches.  Easy to split open/closed components and publish the "build instructions" (your build metadata) for true GPL compliance.
-
--- [train.jpg] [top]
-
-Won’t fall apart over time
-#Yocto won't surprise you late in product development
-#
-#Reproducable builds for the entire system. minimal host dependencies and ability to blow away build tree results in same image.
-#
-#Six monthly release cycle with maintained release branches (about to release the first point release of 1.3, and 1.2 is still getting fixes in its branch)
-#
-#Open planning process for future releases, no development in private repos or not-quite open source model.
-
--- [bike.jpg]
-Exactly how you want it
-
-#Numerous functional layers, with more packages (network daemons, multimedia support, selinux). these are all optional, you start from a minimal system and build up instead of from a large system and removing pieces.
-#
-#Entirely override existing packaging in your own layers, or just tweak behavior by appending packaging fragments.
-#
-#Generate a machine configuration for your exact target, so you can compile everything with optimal compiler flags, tuned libraries (jpeg, zlib, etc), specific kernel.
-#
-#meta-intel has BSPs for key Intel platforms with targetted hardware support, such as NUC, FRI2, Xeon and IVB/SNB platforms.
-
--- [engineer.jpg]
-
-Developer friendly
-
-# YP is developer friendly
-#
-# Generate standalone toolchain with headers and libraries so app developers don't actually need to build the whole distro.
-#
-# Development images with compilers/headers, debug images with full symbols and source
-#
-# Eclipse based SDK for anyone who has an irrational fear of emacs and xterm.
-#
-# Bogdan just spoke about hob, the graphical interface to bitbake.  also starting work on webhob
-#
-# Documentation is never finished but we've a paid documentation writer
-#
-# Our autobuild setup is open source and documented, so anyone else can do the same.
-#
-# Fast to build. Highly parallel builds. my consumer i7 does a build in under an hour, pre-built objects can be shared on the network.
-
--- [clay.jpg]
-Malleable
-
-#YP is incredibly flexible.
-#
-#Easily swap or change components, such as systemd for sysvinit, uclibc for eglibc, use Wayland, X11 or DirectFB.
-#
-#choice of packaging system, and no need to keep it on the image.
-#
-#Easily shrinks down to a fastboot few meg filesystem for tiny single-application systems, but can also build a full desktop environment.
-
--- [qa.jpg]
-Q&amp;A
-
--- [yocto.jpg]
-Thanks!
-
-# Credits
-#
-# bomb.png
-# Public Domain, apparently. Fair use, if not, right?
-# http://commons.wikimedia.org/wiki/File:Dr._Strangelove_-_Riding_the_Bomb.png
-#
-# apple.jpg
-# Creative Commons 2.0 BY (C) Steve Jurvetson
-# http://www.flickr.com/photos/44124348109@N01/7515248418/
-#
-# tv.jpg
-# Creative Commons 2.0 BY (C) Sarah Reid
-# http://www.flickr.com/photos/sarahreido/3245498261/
-#
-# advert.jpg
-# Creative Commons 2.0 BY-NC-SA (C) Justin Brown
-# http://www.flickr.com/photos/40708728@N04/8496770124/
-#
-# data.jpg
-# Creative Commons 2.0 BY-SA (C) Leonardo Rizzi
-# http://www.flickr.com/photos/29479498@N05/4381851322/
-#
-# xeon-phi.jpg
-# (C) Intel, press material
-#
-# labquest.jpg
-# www.venier.com, press material
-#
-# minifigs.jpg
-# Creative Commons 2.0 BY (C) peter dutton
-# http://www.flickr.com/photos/40646519@N00/305410323/
-#
-# cables.jpg
-# (C) David Stewart, All Rights Reserved, Used with Permission.
-#
-# road.jpg
-# Creative Commons 2.0 BY-NC-SA (C) Rick Harrison
-# http://www.flickr.com/photos/81851211@N00/5861614/
-#
-# license.jpg
-# Creative Commons 2.0 BY-NC (C) Daniel Hoherd
-# http://www.flickr.com/photos/warzauwynn/2553621029/
-#
-# train.jpg
-# Creative Commons 2.0 BY-NC (C) Ian Britton
-# http://www.flickr.com/photos/freefoto/8488902378/
-#
-# bike.jpg
-# Creative Commons 2.0 BY (C) Gerry Lauzon
-# http://www.flickr.com/photos/26745132@N00/1677527193/
-#
-# engineer.jpg
-# Creative Commons 2.0 BY-NC-SA (C) RoberthK
-# http://www.flickr.com/photos/39066002@N05/3595313340/
-#
-# clay.jpg
-# Creative Commons 2.0 BY-NC (C) Toby Thain
-# http://www.flickr.com/photos/qu1j0t3/47174053/
-#
-# qa.jpg
-# Creative Commons 2.0 BY-NC (C) Tantek Çelik
-# http://www.flickr.com/photos/39039882@N00/22778226/
-- 
2.20.1

