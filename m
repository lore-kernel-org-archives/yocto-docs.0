Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8303BC982F1
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 02:03:53 +0000 (UTC)
Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1389.1790042625043858633
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Sep 2026 19:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pwoK62pm;
 spf=pass (domain: gmail.com, ip: 74.125.230.205, mailfrom: twoerner@gmail.com)
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939109f067fso469619385a.2
        for <docs@lists.yoctoproject.org>; Mon, 21 Sep 2026 19:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042624; x=1790647424; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3iLdOi4WWgEYzCM7n3QFHdM1VC3z84E3S5OhcBzg+yg=;
        b=pwoK62pmRV5Pt7xkx73iI/O60idzO6RPUbYZwvAG2lfDdAf1YxNcSnoVdQphQzn9kl
         rV3p5moNtUiruFGv7x3TxhTKe6vW/r/WyoQa3ag8pCKwvSR6I4slOpY9+SslxR5HxSYQ
         BqhEWxBTuIWVEJO3j47OsMnpR90LZDGazpTVvaY6e9tH5dLT6y6A0JlF+aTkTKzyeDfP
         KFm8Q+5BpUh0FcM0Xm0EBJC7/chDsTikOKVO9mT/78avMIgJMNdwnxGBrDRnA0mX0LRk
         RVYhr9bP6dK4uAb7JyMjE9seR/T70Z80VEfbER93vEDc60eO7QePwEoI/PgFu0ZhxOCF
         B/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042624; x=1790647424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3iLdOi4WWgEYzCM7n3QFHdM1VC3z84E3S5OhcBzg+yg=;
        b=evLfQnkcJWnfYKDibxYfEJ06W18+PUtKf0sRsqY8IKF7Bl3/WFfKccmJu8DFBW4uif
         BQurJSUUZLdXTXm9ViGvU8WccP4VSZno0ai1SnFAcw4Jp5Jzz7ZvepwwGVs5x9fZrykH
         9YTOnSus8JI8AB6gjsWqqoopNYUxzr91l+lfrSf3JGqtwp1oFaWqofKW/20NKGbAOuE9
         Iz/0xfTslB8SjN4gDA2idZU8231Tk/7fgg6FIaG8yp/cJWfdPH6rEJCEKVLn0szMQooe
         CNvtiZIDctiE+Lx66VVkQoezkXWxBS3/334NsB/DdES4ONeHyGID8qwnk6fMqimiJQPt
         GFmQ==
X-Gm-Message-State: AFuF++nxXG6WlSTbNG0PYOpsW8GZRpP5uMzpOZJ8jfpUaNo17ZW5G6LX
	JqwY/YkHVbqHOYvXXFZFTugLTBuq9Ca1BVmH2XG+ERB5G8RcHtPnGjo0/x4z5A==
X-Gm-Gg: AYBFou0I5Y4Gbuu9HITVfB+UmGTiFpwvuY5rjN0j4VxZj4muFx+1XRzA7VGZ535+F50
	TCB1LAEfpk00Bv1zPqx0v2OzFFAtDuDWQjQhvGWjt33pXL/DA5OA1SsgplewjDZXS9JPhCUxJDk
	vBvl9Y1rEvNaYmuVecXrZCwDC+6d9sSRCYxkLIoTiHJMMAmU5Re955JZRTtv7TniguUdZ6OtD/X
	8WI5Zvwtv/y2cCFjvOxaPtO2dvtVjejxUKmW8n4zuGz00ZbCUCwIkQiy0h0KXtllaCVfVvyJ/+a
	yz2WiPVl2Anr7mN4LEBARtb7jc9mPQNMNP3PEfkOqDE8lppZlFy9H60sioxl2DeXwUKqLr6xHub
	bU6oPYePMojvbFg1s5MDQ4wNj7tez+8uiKpE3jX8Xe9e/GjXoPPSVW80KI7LAHCd4lhz2YHvgs0
	/wSzXIa65FpuTtSgP9vUM/ZbtTN0i5fmWwYGhFFsk9zWv5W2bP48n7A8SE2M2zSDZQj/IlbG9Qj
	YHomKHwr/fi7Ph8rmxk1cL4FQ5ClPgQV+VgOonw
X-Received: by 2002:a05:620a:2603:b0:936:dfbf:85b0 with SMTP id af79cd13be357-93c15e9ca9cmr391543685a.35.1790042623869;
        Mon, 21 Sep 2026 19:03:43 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c1d253165sm16817185a.46.2026.09.21.19.03.42
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:03:43 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 00/10] docs: editorial repairs to the examples
Date: Mon, 21 Sep 2026 22:03:29 -0400
Message-ID: <20260922020339.481929-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 02:03:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10559

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
  2. the copy button and a mouse selection both reduced to the command,
     for every prompt shape rather than just "$ "
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
  9. "partition" dropped as a wic kickstart command; wic has rejected it
     since the pykickstart parser was replaced in 2016
 10. a list continuation indented, so its "::" stops swallowing the
     paragraph and the note beneath it

The first three are related, and the third has been under discussion.
The great majority of command blocks already carry a prompt, so patch 3
finishes a convention rather than proposing one, and patches 1 and 2
remove the cost that convention imposes on a reader.

Patch 2 is the substance: copybutton_prompt_text was the literal "$ ",
so on a block prompted any other way nothing matched, and sphinx-
copybutton then falls back to copying every line, prompt and output
alike. That took in the root prompts, the Windows sessions in
dev-manual/start.rst and the pydevshell session, so the pattern now names
each prompt shape the manuals use. Selection had the opposite defect: it
took the output along with the commands, which the button never did.

Patch 1 comes first because patch 2 treats "#" as a prompt only when a
preamble precedes it. That is not a shortcut: a bare "#" opens a root
prompt, a comment and a line of program output alike, and the manuals
use it for output and for comments far more often than for a prompt.
Giving the stragglers the preamble the rest already use makes the rule
true rather than approximate.

Every commit builds with zero warnings under -W, which is the Makefile
default, and each was built on its own rather than only at the tip.
sphinx-lint over the touched files is unchanged from origin/master.

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
 documentation/conf.py                         |  21 ++-
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
 documentation/dev-manual/packages.rst         |   4 +-
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
 documentation/ref-manual/kickstart.rst        |   9 +-
 documentation/ref-manual/qa-checks.rst        |   4 +-
 documentation/ref-manual/variables.rst        |  40 +++--
 documentation/sdk-manual/extensible.rst       |   6 +-
 .../sphinx-static/theme_overrides.css         |  36 +++++
 .../test-manual/reproducible-builds.rst       |   2 +-
 documentation/test-manual/runtime-testing.rst |   4 +-
 43 files changed, 329 insertions(+), 263 deletions(-)

-- 
2.50.0.173.g8b6f19ccfc3a


