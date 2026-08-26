Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0221C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 01:35:11 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3399.1787708107491416190
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 18:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U3kHqU65;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92f0b5ed131so33052585a.3
        for <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 18:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787708106; x=1788312906; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uo3fmIIveUqVTiMUzlmgC16Yiy4TlsjW2EPjmWX4Iqc=;
        b=U3kHqU65/D+Pd/ji1ACjq6aGRVuO9HITcKLN/zgtOgDNCm7r3bgfcFJrbHxJKCqc6X
         Qq6XdQ148mMylkLHzrZjT1VMC7zlCOhBpVleP2oejBTl8jJA95Sh03dpxp+n2gvDRhKw
         jM+rTRVw+lQE5oaCorhWg9fE+lOt3NB46XG3OTOjrAnlQ2VLsdk5/J4Z7NbL/ygIODKu
         WQeIg/cAGpuOD5r/f+xE+qd9xjr9NLt8yjUpnWYrYHVqLxzvsmEmUzrtD0ZSVTlGhBqF
         jZE4sMEEAIPt1LyLdtLGGfvqGRiPbwwFmk82y6WC+gD8xsrpE2j+878hQFaM5YFoQnmo
         kLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787708106; x=1788312906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uo3fmIIveUqVTiMUzlmgC16Yiy4TlsjW2EPjmWX4Iqc=;
        b=S+oVkf2p1TfC3+olItaAbk54mu70rbPdQ6S2vpq/4F5uPCgw0EXWt8KSd6HkFNIdNf
         QM8FNB0q788Y8rBQZFC/xLNlJkxc9edvTuKOgeAJMBGtSF2iMsqvvzTgtnSC9ptekBp+
         gf/8YLCwr26BGogbW1EVVmDsKxHpalaNaoW6OT6SVGjqf1LCCR3FJZql1JMZkUos6PRN
         zZiZ/yw7nS6a34GUW9K6JWmdktvVxQnZohdjTxr+VYQxgNP8JY+s+h/NFc14yV87+svQ
         w0Pvrv+kHA9MNgns/3SQuR+4eQBKG71cvEKlBvRJpw/9kLp/WAiLSTzYmgbcvmsxjpdi
         wmpw==
X-Gm-Message-State: AFuF++maxLRZXa3zA0JpO/nyaWbK377yRMbGUOA9HnM1MUIxlP2T3pSf
	HuJF9B9sGJOT6A6eDTWE7PCL3lDk9qfK4+KmLJ7QTEHnQb0YXdzFInYVNZex/3A6
X-Gm-Gg: AR+sD10TC6bDgTRod6PQz64X+k/FvPuoksw+Oj+bZ+ssdRFsAI0ETyGIoJlYqHo1yDQ
	4OJvw7aWFKZodFyheC40HwWZy3SakQ8qIihEQbnXCks83kViaP2Os7K/PlnxcI5zpNEAjOv9Uox
	E089Jt3wHkajqAXYDIed7yM9OJS/vO3tTm4fuoduCV2gf4Jr7nNCEUi7QQysD1BaHvzlGBoz0mM
	6MnFAUSG+7AEmLxO8sHdpv7vLVNvibADm48mxDWBOdmnAElSAzvh2qurk5ESegMKanPpFxVzTPV
	e8SFBS1/Jh7DijVJe9TsG1m1bF9B8J1UNldFTBtjYaVZUoXOPGK2HZTuukGUCkvBhhY0510cK6Z
	MMFLimD6yJOh5IV32yICIvbxTnd0i09wK2/SCdkzOtmcehkMd3mS/Lkj0E6jAjUoUHTXoj8TGCV
	aMA9TZmLvKoy5rZg+5dGXlh2DqlSwuiAVxFL3q2OUmsjpR3h2defsAnhC/xzcO4tW/bBwJqUn/w
	kSTrHn8+PmeA/aCTLPquFbXxrNi8xGK3anz/dwfyw==
X-Received: by 2002:a05:620a:240c:10b0:936:e192:e394 with SMTP id af79cd13be357-9378047c277mr223557085a.31.1787708106251;
        Tue, 25 Aug 2026 18:35:06 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e68053dsm104323785a.39.2026.08.25.18.35.05
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:35:05 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 00/10] docs: highlight BitBake snippets with the bitbake language
Date: Tue, 25 Aug 2026 21:34:45 -0400
Message-ID: <20260826013502.2674000-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 01:35:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10345

Pygments 2.21.0 added a BitBake lexer, so BitBake snippets can now say
what they are instead of rendering as plain literal blocks. This tags
the ones in yocto-docs.

One patch per manual, which is also roughly one reviewable unit per
patch. No prose changes, no reflowing, no reindenting - every hunk turns
a literal-block introducer into a code-block directive and nothing else.

Which blocks were converted was decided by reading, not by pattern
matching. Blocks that share BitBake's assignment shape but are another
language were left alone: a Makefile, Django settings, an Automake
fragment, a wic kickstart include, kernel .scc metadata, U-Boot Image
Tree Source. So were blocks an author had deliberately marked "none",
which usually means "this is not purely code" rather than "nobody got
round to it".

Please do not apply this yet
----------------------------

The autobuilder builds the docs with a pinned buildtools tarball that
currently carries Pygments 2.19.2, which predates the BitBake lexer.
run-docs-build also passes SPHINXOPTS="-j auto", dropping the -W the
Makefile defaults to, so on that toolchain every one of these blocks
would publish unhighlighted and the build would still succeed. I have
asked separately about refreshing that tarball.

Sending now for review rather than to be merged. Once the toolchain can
render it, this applies as-is.

Depends on
----------

"docs: state the language of nine literal blocks explicitly", sent
separately, which gives some non-BitBake blocks their correct language.
That patch stands on its own and can go in independently; this series
is based on it only so the two do not touch the same lines.

Not included
------------

Six blocks in ref-manual/ trip a defect in the released BitBake lexer,
fixed upstream but not yet in a release. They are a separate patch, held
until that release, so the rest is not blocked behind them.

Trevor Woerner (10):
  ref-manual/variables.rst: use the bitbake code-block language
  ref-manual: use the bitbake code-block language
  dev-manual: use the bitbake code-block language
  migration-guides: use the bitbake code-block language
  kernel-dev: use the bitbake code-block language
  test-manual: use the bitbake code-block language
  overview-manual: use the bitbake code-block language
  security-manual: use the bitbake code-block language
  sdk-manual: use the bitbake code-block language
  docs-wide: use the bitbake code-block language

 documentation/brief-yoctoprojectqs/index.rst  |    4 +-
 documentation/bsp-manual/bsp.rst              |   28 +-
 .../contributor-guide/recipe-style-guide.rst  |   24 +-
 documentation/dev-manual/bblock.rst           |    4 +-
 documentation/dev-manual/bmaptool.rst         |    4 +-
 documentation/dev-manual/build-quality.rst    |    8 +-
 documentation/dev-manual/building.rst         |   44 +-
 .../dev-manual/creating-fragments.rst         |    6 +-
 .../dev-manual/custom-distribution.rst        |    4 +-
 .../dev-manual/customizing-images.rst         |   32 +-
 documentation/dev-manual/debugging.rst        |   40 +-
 documentation/dev-manual/device-manager.rst   |   12 +-
 documentation/dev-manual/devtool.rst          |    8 +-
 documentation/dev-manual/disk-space.rst       |    4 +-
 .../dev-manual/error-reporting-tool.rst       |   12 +-
 documentation/dev-manual/external-scm.rst     |   20 +-
 .../dev-manual/gobject-introspection.rst      |   12 +-
 documentation/dev-manual/hashequivserver.rst  |   12 +-
 documentation/dev-manual/init-manager.rst     |   16 +-
 documentation/dev-manual/layers.rst           |   56 +-
 documentation/dev-manual/libraries.rst        |   12 +-
 documentation/dev-manual/licenses.rst         |   60 +-
 .../dev-manual/limiting-resources.rst         |    4 +-
 documentation/dev-manual/multiconfig.rst      |   40 +-
 documentation/dev-manual/new-machine.rst      |    4 +-
 documentation/dev-manual/new-recipe.rst       |  160 +-
 documentation/dev-manual/packages.rst         |   44 +-
 .../dev-manual/poky-manual-setup.rst          |    4 +-
 .../dev-manual/prebuilt-libraries.rst         |   12 +-
 documentation/dev-manual/qemu.rst             |    4 +-
 documentation/dev-manual/quilt.rst            |    4 +-
 documentation/dev-manual/sbom.rst             |    4 +-
 .../dev-manual/speeding-up-build.rst          |    4 +-
 .../dev-manual/sstate-mirrors-setup.rst       |   16 +-
 .../dev-manual/temporary-source-code.rst      |    8 +-
 .../dev-manual/upgrading-recipes.rst          |   12 +-
 documentation/dev-manual/wayland.rst          |    8 +-
 documentation/dev-manual/x32-psabi.rst        |    4 +-
 documentation/kernel-dev/advanced.rst         |   48 +-
 documentation/kernel-dev/common.rst           |   88 +-
 documentation/kernel-dev/faq.rst              |    8 +-
 .../migration-guides/migration-1.3.rst        |    8 +-
 .../migration-guides/migration-1.6.rst        |   12 +-
 .../migration-guides/migration-1.7.rst        |    4 +-
 .../migration-guides/migration-1.8.rst        |   12 +-
 .../migration-guides/migration-2.0.rst        |    8 +-
 .../migration-guides/migration-2.1.rst        |    4 +-
 .../migration-guides/migration-2.2.rst        |   11 +-
 .../migration-guides/migration-2.3.rst        |   12 +-
 .../migration-guides/migration-2.5.rst        |    4 +-
 .../migration-guides/migration-2.6.rst        |   12 +-
 .../migration-guides/migration-3.0.rst        |    4 +-
 .../migration-guides/migration-3.1.rst        |   12 +-
 .../migration-guides/migration-3.2.rst        |    8 +-
 .../migration-guides/migration-3.3.rst        |    8 +-
 .../migration-guides/migration-3.4.rst        |   16 +-
 .../migration-guides/migration-4.0.rst        |   12 +-
 .../migration-guides/migration-4.1.rst        |    8 +-
 .../migration-guides/migration-4.2.rst        |   12 +-
 .../migration-guides/migration-5.1.rst        |   12 +-
 .../migration-guides/migration-5.2.rst        |   24 +-
 .../migration-guides/migration-5.3.rst        |   36 +-
 .../migration-guides/migration-6.0.rst        |   44 +-
 .../migration-guides/migration-6.1.rst        |   12 +-
 .../migration-guides/release-notes-4.0.rst    |    4 +-
 .../migration-guides/release-notes-4.3.rst    |    4 +-
 .../migration-guides/release-notes-5.0.rst    |    4 +-
 .../migration-guides/release-notes-5.3.rst    |    8 +-
 documentation/overview-manual/concepts.rst    |   68 +-
 documentation/profile-manual/intro.rst        |   16 +-
 documentation/ref-manual/classes.rst          |  168 +-
 .../ref-manual/devtool-reference.rst          |    4 +-
 documentation/ref-manual/faq.rst              |   20 +-
 documentation/ref-manual/features.rst         |   12 +-
 documentation/ref-manual/qa-checks.rst        |   20 +-
 documentation/ref-manual/tasks.rst            |   20 +-
 documentation/ref-manual/variables.rst        | 1635 ++++++++++++-----
 .../appendix-customizing-standard.rst         |    4 +-
 .../sdk-manual/appendix-customizing.rst       |   16 +-
 .../security-manual/read-only-rootfs.rst      |    8 +-
 .../security-manual/securing-images.rst       |    8 +-
 .../security-manual/sstate-signing.rst        |   16 +-
 .../security-manual/vulnerabilities.rst       |   32 +-
 documentation/test-manual/intro.rst           |    4 +-
 documentation/test-manual/ptest.rst           |   24 +-
 .../test-manual/reproducible-builds.rst       |    8 +-
 documentation/test-manual/runtime-testing.rst |   52 +-
 87 files changed, 2505 insertions(+), 843 deletions(-)


