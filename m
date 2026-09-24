Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A0EC98325
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 17:29:09 +0000 (UTC)
Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3760.1790270938856125499
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 10:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XEWEQBpa;
 spf=pass (domain: gmail.com, ip: 74.125.227.42, mailfrom: twoerner@gmail.com)
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e5059f9so1411856e0c.2
        for <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 10:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270938; x=1790875738; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YjMdF+qWGeh1jZoHSfKXTu+VJJmrrk59Oi5mWso1MAY=;
        b=XEWEQBpahMmBteF+04BJ6lBKcZux6V7tL0FA06/iQAwn8ZgsWT/94Qz7xryO+7/Ot7
         OyoKwPjEYmBSqx/S4q+rX9bv3Vi7d9A2wlaf6bvJ+Rl+UjFnC6JE47WmcSWEWAT5RGkH
         NOWirlictLwz4TAh5pAJp6iBreOFyyrc+1zr/huzzKDn1Ya3cjYcdIqU79/QFroNAvcD
         dKAHgErqKBGsWq0XW23okR7kM6lNTpFIk7yCZmfUG+6k/8xCFoYqXPbtDq2WI34fVdVg
         h7CcchREWTKG4hUfZMBHjVQiL9kUZF+Aucw9e6rwq86lKwnpJLASFHruunQhpK/due0p
         63bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270938; x=1790875738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YjMdF+qWGeh1jZoHSfKXTu+VJJmrrk59Oi5mWso1MAY=;
        b=xHB2V4YUElOgTe50uvl41GgExkBT0Uxa4xANYGHmlUFzvFcVsTaM1LghUy9L6H1nlV
         vYYr6z4EUvSA0W3Kfqlc4VjMVn6pvhEvLJmOv778uYED6ZXUNQnMmMy3nL945yRmF449
         Fy3eaWcPTybJuC/8WbwYe0+vFdqowa77zzlx8zltDZ7l6oQsycQTIXfPmp9tCHKsJ3FJ
         4i7Qkix19nyPeJ5wD2vs82P5lywxKSSg//DdNuj+KWR0ByVWQS1HL7eXm3KTLBScCLxl
         G6elInAkHubJv91N6bhGtSfEbo73YRT/T8dNUqJsekkIdy9TYybOhkLHuC6jm3xm49l1
         9QGA==
X-Gm-Message-State: AFuF++nj81tgwAQtbJWr3/e1L0iBUEc2br08ULzuuNIcxV+TnvrXZ0kk
	cR94Oi+daWYmbDh9E7XDLsjH40tl4cdXI4BuwwI3JNE2KCVnKBYFDAMi20qRFw==
X-Gm-Gg: AYBFou1pfhj0IUbbbrwghL4klliZFFz98iqmS6hk6ZYAY2OSVKOZ82YNWxJ9dKxowD2
	Dts9ee87FZsHh/BSW5TpRYEjotLenKskId8otHVt8n2zbm25ncC+//6CKDCr6FkMUL9JKwyf/RT
	VebRmuLxtdbjN6mH41nj9sbQBLlSsMxaGQkJtL7OrJbjbg/ChhGnUF/+t3+BZgJcnddB/b+WBqG
	CaBUgUaWDm8oAK7YKo0rD92rH4VrXuXCiY6a7kGSDWhsfpFbJeeWYjaQttMPIO8N47LSxcS3SBh
	TVcfInlFz/DLfACegmJ3H7JEIC/2mR+p4KLz4B7hiCVq82aDNkqgTiaY4f5YMxH7BP4HMx2mUiy
	fpUOQh+eIx8greKJp2xAFmfL5ojAOnFuEQkWrbooxfskGve1geaTRJAlo77w9eQedttlbcZC2ds
	NLVpZkLMRK7jdJC4iwzX3woD171mGdUz7l75GXF+2FPYAlN2dJWqbEpdcwrhug60thncf4kS02v
	Yl09Ihz+Tq+OHT5cp/4HzRa95eUaX/AxgxdXWFw78D2S0vDn/g=
X-Received: by 2002:a05:6102:2914:b0:7a6:e08f:9fa with SMTP id ada2fe7eead31-7af1cc992f3mr1549850137.13.1790270937541;
        Thu, 24 Sep 2026 10:28:57 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98530725838sm1797974241.0.2026.09.24.10.28.56
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:28:56 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v3 00/10] docs: editorial repairs to the examples
Date: Thu, 24 Sep 2026 13:28:43 -0400
Message-ID: <20260924172853.2665062-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 17:29:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10623

These are repairs to the examples themselves. No block is given a
language and no block changes how it is highlighted; what changes is the
text of the examples. Each commit stands on its own: a reader is better
served by every one of them whether or not anything else in this area
lands.

They also clear the way for a later series that states the language of
each code block. A block cannot say it is a console session without a
prompt, or C with a bare "..." in place of the code it omits, or anything
at all while it holds more than one file under a single "::". These
remove exactly those obstacles.

  1. a preamble on the root prompts written as a bare "#", which the
     rest already carry
  2. the copy button reduced to the command, for every prompt shape
     rather than just "$ "
  3. a prompt on the command blocks the prose says to run, and on
     transcripts only the opening line, plus dropping the bare trailing
     "$" a returning prompt leaves behind
  4. elided code written as a comment in the language around it
  5. placeholders the reader must replace put in angle brackets
  6. real accounts and home directories replaced with /home/user
  7. kernel metadata examples split so each block holds one file, with
     the filename moved to the block's caption
  8. the ARCHIVER_MODE varflag examples given comments BitBake can parse,
     since a "#" after a value is not an inline comment
  9. "partition" dropped as a wic kickstart command; wic has rejected it
     since the pykickstart parser was replaced in 2016
 10. a list continuation indented, so its "::" stops swallowing the
     paragraph and the note beneath it

The first three are related, and the third has been under discussion.
The great majority of command blocks already carry a prompt, so patch 3
finishes a convention rather than proposing one, and patches 1 and 2
remove the cost that convention imposes on a reader.

A command run on the target takes the full user@machine:path prompt,
mirroring the root prompt beside it, and one run on the build host takes
a bare "$" unless its working directory is part of the instruction. The
copy button and a mouse selection already handle both forms, so which
prompt a block carries does not change what copying it gives you.

Patch 2 is the substance: copybutton_prompt_text was the literal "$ ",
so on a block prompted any other way nothing matched, and sphinx-
copybutton then falls back to copying every line, prompt, and output
alike. That took in the root prompts, the Windows sessions in
dev-manual/start.rst, and the pydevshell session, so the pattern now
names each prompt shape the manuals use. A mouse selection is left
alone, so it still takes the output; that is deliberate, and was your
call on the v1 thread.

Patch 1 comes first because patch 2 treats "#" as a prompt only when a
preamble precedes it. That is not a shortcut: a bare "#" opens a root
prompt, a comment, and a line of program output alike, and the manuals
use it for output and for comments far more often than for a prompt.
Giving the stragglers the preamble the rest already use makes the rule
true rather than approximate.

Every commit builds with zero warnings under -W, which is the Makefile
default, and each was built on its own rather than only at the tip.
sphinx-lint over the touched files is unchanged from master-next.
changes in v3:
 - patches 9 and 10 are back. You applied them on 2026-09-22 and the
   master-next rewind of 2026-09-23 took them out again, so they are
   unapplied; re-sending rather than risk losing them
 - patch 1 also prompts the kernel-dev "make scripts" block Quentin
   spotted
 - patch 2's comment is a third of the length and no longer contradicts
   itself about scope, and a ">>> " alternative covers the one Python
   interpreter example
 - patch 2 gains a "(gdb) " alternative. The console lexer already marks
   that prompt, so a selection skipped it while the button copied it;
   the two now agree on the one block where they still differed
 - patch 3 prompts the weston block, which had none, and gives the
   commands run on the target the full user@machine:path prompt rather
   than a bare "$"
 - patch 5 leaves the DMARC From: header alone. Nothing in it is for the
   reader to replace, so it needed neither a placeholder nor anonymising
 - patch 5 writes the git config name as <firstname> <lastname>, and
   says the SRCREV values are commit SHAs
 - patch 6 leaves the prompt on the setup-layers example. Its command is
   a relative path, so the working directory in the prompt is what says
   where it runs
 - patch 8 separates each comment from the setting above it

changes in v2:
 - rebased on master-next, which is where it now applies; the one
   conflict was the ARCHIVER_MODE block, where d5216e3fd4be had already
   removed the srpm varflag
 - patch 2 no longer touches the stylesheet: a mouse selection keeps the
   output, and only the copy button is changed
 - patch 7 takes the theme's whole font stack for the caption
 - patch 1 uses a generic root@machine prompt where the surrounding text
   names no board

Signed-off-by: Trevor Woerner <twoerner@gmail.com>

Trevor Woerner (10):
  docs: give the root prompts a preamble
  docs: copy only the command from a console block
  docs: show a prompt on commands the reader is meant to type
  docs: write an elided passage as a comment
  docs: mark the placeholders in examples
  docs: remove real accounts from the examples
  kernel-dev: give each example block one thing to hold
  ref-manual: put the ARCHIVER_MODE comments on their own lines
  ref-manual: drop "partition" as a wic kickstart command
  dev-manual: indent a list continuation so the code block ends

 documentation/brief-yoctoprojectqs/index.rst  |   2 +-
 documentation/bsp-manual/bsp.rst              |   4 +-
 documentation/conf.py                         |  19 ++-
 .../contributor-guide/recipe-style-guide.rst  |   2 +-
 .../contributor-guide/submit-changes.rst      |  63 ++++----
 .../dev-manual/creating-fragments.rst         |   4 +-
 documentation/dev-manual/debugging.rst        |  13 +-
 documentation/dev-manual/devtool.rst          |   8 +-
 documentation/dev-manual/disk-space.rst       |   4 +-
 documentation/dev-manual/hashequivserver.rst  |   2 +-
 documentation/dev-manual/layers.rst           |  10 +-
 .../dev-manual/limiting-resources.rst         |   2 +-
 documentation/dev-manual/new-recipe.rst       |   6 +-
 documentation/dev-manual/packages.rst         |   4 +-
 .../dev-manual/python-development-shell.rst   |   1 -
 documentation/dev-manual/qemu.rst             |  10 +-
 documentation/dev-manual/start.rst            |   2 +-
 .../dev-manual/upgrading-recipes.rst          |  18 +--
 documentation/dev-manual/wayland.rst          |   8 +-
 documentation/dev-manual/wic.rst              |  44 +++---
 documentation/kernel-dev/advanced.rst         | 139 ++++++++++--------
 documentation/kernel-dev/common.rst           |  41 +++---
 .../migration-guides/migration-2.1.rst        |   4 +-
 .../migration-guides/migration-2.5.rst        |   4 +-
 .../migration-guides/migration-3.2.rst        |   2 +-
 .../migration-guides/migration-4.0.rst        |   2 +-
 .../migration-guides/migration-5.2.rst        |  16 +-
 .../migration-guides/migration-5.3.rst        |  10 +-
 .../migration-guides/release-notes-4.2.rst    |   2 +-
 .../migration-guides/release-notes-5.3.rst    |   2 +-
 documentation/overview-manual/concepts.rst    |   2 +-
 documentation/profile-manual/usage.rst        |   4 +-
 documentation/ref-manual/classes.rst          |   8 +-
 .../ref-manual/devtool-reference.rst          |  10 +-
 documentation/ref-manual/faq.rst              |   6 +-
 documentation/ref-manual/fragments.rst        |  16 +-
 documentation/ref-manual/kickstart.rst        |   9 +-
 documentation/ref-manual/qa-checks.rst        |   4 +-
 documentation/ref-manual/variables.rst        |  43 ++++--
 documentation/sdk-manual/extensible.rst       |   6 +-
 .../sphinx-static/theme_overrides.css         |  28 ++++
 .../test-manual/reproducible-builds.rst       |   2 +-
 documentation/test-manual/runtime-testing.rst |   4 +-
 43 files changed, 326 insertions(+), 264 deletions(-)

-- 
2.50.0.173.g8b6f19ccfc3a


