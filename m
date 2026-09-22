Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677F5C982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 18:32:56 +0000 (UTC)
Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2901.1790101975368803447
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 11:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=a94Kyuqa;
 spf=pass (domain: gmail.com, ip: 74.125.230.235, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb766bfd3so1544791cf.0
        for <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 11:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790101974; x=1790706774; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D6f3v/AIQJG1NFfAPOyzGN0Hic3dBq8xQk96XOGlfo8=;
        b=a94KyuqalrNAh1Hc2ho0TAl4paejLhyD5xMYXEa4UpJUWzH3gkY0QlYjw4O7TGeE0Z
         6SeV+MZZ4XJrTNXAzUsuF8GZsJi7AXEv2TEzy7E+UewyokuUDIrIN5BX6J4sgKmez6Hb
         o8ZC2fBh6Y99CnTrj2lre0VDtRYu2xl6rdY5KhXljnGr4Ax4ZFb7frlkfwP9ewOtIRyI
         c2N5KndTCt2eEAkM89Qfpqu6beKdobh5pCOspIDJxz7W0N0RD9SuO10tnpdRGAE+0iNA
         cTBAEqEcMefbo2Cb542TaM3VtyGcD4VvWGguXCRJxx1ZyrEoi5G6Njm0yM0ohOCIZlkK
         6NGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101974; x=1790706774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D6f3v/AIQJG1NFfAPOyzGN0Hic3dBq8xQk96XOGlfo8=;
        b=bPt82A4uGtvleL6OIl8YHBWVsp1PdhiEMQhT6/diJ8D02YzFGy8dHUXqWOFbuFxmYH
         96zRBwz3d0KErnfjBssODcgU/eUmo4GHvKbozqtf8CSprX2YtTemQvYGHeTuingyx7EW
         7a3GyPulOMG1guocFBo8Swk/cE1+ATTLe7YjFJ320WXUj9SbYbKWI+ZH+SH7Bbw3FOYo
         zym8wvG3TUItgk/mDCJIWLoYfN0KVp8VUaYJGd1/vq1Q2kJVKxac66an06hDDe9yS0e0
         +1YQ6uz0COgFPrtEnhOQvC6PCDwcl7l+uuEminrHGWxs8gf2yoJTiH5JM39325QWjzMF
         Zvsw==
X-Gm-Message-State: AFuF++mTyw9f7BfIjbZmh7odA+OFuhBvKfueW67KERTiXowRnzp2Dveh
	mgqgiBMh9FPhzzMEGwpGVp1RH2TwstftR9s8vMuqvB18zeMIwfOdtFnlIAWGzg==
X-Gm-Gg: AYBFou3s3XNLhhDLOnAr/+7hSmYIVTppcSwhvkcoy4kLk1EEMtIZaszeVU8/AlE7kxp
	NItvlgos+EojRkG/eiB4hYXgQ02IhPefXFzfBzlVPDCAaoyabJ3zTdwtafmY/vE6kpM29buYLsn
	NRY61RJ06QpBDqcs09mCLdKszPJnsQBagp66WOVyAJb0UeYq7YeH2Fa8E2HMKhHxaFO2rKbPaQF
	bvbI1yt/Q6YEVIluAQgQjmslh1INs9912hAx6/wCUMNpIiM3qx6Nfg3hZJHr9hcAaigMMT+GwJh
	7iP9ApdRk6MdwyBBtAjLvtUhglY32EZS7WT2j4nI20EgrVDO741z4yF1Z0JmPSHmL4okg4sfb7V
	LEkJuCn4d7JfQAa+ThvRAEYNsnSOJvszbuOwTUrcbz/qo+ZcJXf+VJnve/HGtRsapFtER1iQS0a
	RqGuQSARfue300tKljw7AVSJ8VWhmURMHscVAuk2Mpp400CUSCIKcgckUZ30ASzms34SrLM3Ph3
	CYqmCavVPiE4fk8W8i1QmqvUxsjoNtYQ9IGmDvqq1XJnCHWg8E=
X-Received: by 2002:a05:622a:4083:b0:532:84d3:abc with SMTP id d75a77b69052e-532eabb3c4bmr6193781cf.3.1790101973858;
        Tue, 22 Sep 2026 11:32:53 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3396f6sm3112821cf.19.2026.09.22.11.32.52
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:32:52 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2 0/8] docs: editorial repairs to the examples
Date: Tue, 22 Sep 2026 14:32:41 -0400
Message-ID: <20260922183249.2433345-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 18:32:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10589

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
  6. real accounts and home directories replaced with /home/user and a
     bare "$"
  7. kernel metadata examples split so each block holds one file, with
     the filename moved to the block's caption
  8. the ARCHIVER_MODE varflag examples given comments BitBake can parse,
     since a "#" after a value is not an inline comment

The first three are related, and the third has been under discussion.
The great majority of command blocks already carry a prompt, so patch 3
finishes a convention rather than proposing one, and patches 1 and 2
remove the cost that convention imposes on a reader.

Patch 2 is the substance: copybutton_prompt_text was the literal "$ ",
so on a block prompted any other way nothing matched, and sphinx-
copybutton then falls back to copying every line, prompt and output
alike. That took in the root prompts, the Windows sessions in
dev-manual/start.rst and the pydevshell session, so the pattern now names
each prompt shape the manuals use. A mouse selection is left alone, so it
still takes the output; that is deliberate, and was your call on the v1
thread.

Patch 1 comes first because patch 2 treats "#" as a prompt only when a
preamble precedes it. That is not a shortcut: a bare "#" opens a root
prompt, a comment and a line of program output alike, and the manuals
use it for output and for comments far more often than for a prompt.
Giving the stragglers the preamble the rest already use makes the rule
true rather than approximate.

Every commit builds with zero warnings under -W, which is the Makefile
default, and each was built on its own rather than only at the tip.
sphinx-lint over the touched files is unchanged from master-next.

changes in v2:
 - rebased on master-next, which is where it now applies; the one
   conflict was the ARCHIVER_MODE block, where d5216e3fd4be had already
   removed the srpm varflag
 - dropped the two already applied, "partition" and the list
   continuation, so this is eight patches rather than ten
 - patch 2 no longer touches the stylesheet: a mouse selection keeps the
   output, and only the copy button is changed
 - patch 7 takes the theme's whole font stack for the caption
 - patch 1 uses a generic root@machine prompt where the surrounding text
   names no board

Signed-off-by: Trevor Woerner <twoerner@gmail.com>

Trevor Woerner (8):
  docs: give the root prompts a preamble
  docs: copy only the command from a console block
  docs: show a prompt on commands the reader is meant to type
  docs: write an elided passage as a comment
  docs: mark the placeholders in examples
  docs: remove real accounts from the examples
  kernel-dev: give each example block one thing to hold
  ref-manual: put the ARCHIVER_MODE comments on their own lines

 documentation/brief-yoctoprojectqs/index.rst  |   2 +-
 documentation/bsp-manual/bsp.rst              |   4 +-
 documentation/conf.py                         |  28 +++-
 .../contributor-guide/recipe-style-guide.rst  |   2 +-
 .../contributor-guide/submit-changes.rst      |  62 ++++----
 .../dev-manual/creating-fragments.rst         |   4 +-
 documentation/dev-manual/debugging.rst        |  13 +-
 documentation/dev-manual/devtool.rst          |   8 +-
 documentation/dev-manual/disk-space.rst       |   4 +-
 documentation/dev-manual/hashequivserver.rst  |   2 +-
 documentation/dev-manual/layers.rst           |  12 +-
 .../dev-manual/limiting-resources.rst         |   2 +-
 documentation/dev-manual/new-recipe.rst       |   6 +-
 documentation/dev-manual/packages.rst         |   2 +-
 .../dev-manual/python-development-shell.rst   |   1 -
 documentation/dev-manual/qemu.rst             |  10 +-
 documentation/dev-manual/start.rst            |   2 +-
 .../dev-manual/upgrading-recipes.rst          |  18 +--
 documentation/dev-manual/wayland.rst          |   6 +-
 documentation/dev-manual/wic.rst              |  44 +++---
 documentation/kernel-dev/advanced.rst         | 139 ++++++++++--------
 documentation/kernel-dev/common.rst           |  37 +++--
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
 documentation/ref-manual/qa-checks.rst        |   4 +-
 documentation/ref-manual/variables.rst        |  35 +++--
 documentation/sdk-manual/extensible.rst       |   6 +-
 .../sphinx-static/theme_overrides.css         |  28 ++++
 .../test-manual/reproducible-builds.rst       |   2 +-
 documentation/test-manual/runtime-testing.rst |   4 +-
 42 files changed, 320 insertions(+), 255 deletions(-)

-- 
2.50.0.173.g8b6f19ccfc3a


