Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0393C6FA8B
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 17:26:36 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.730.1662917186590391790
 for <docs@lists.yoctoproject.org>;
 Sun, 11 Sep 2022 10:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MhEwrO7N;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id d2so11878734wrn.1
        for <docs@lists.yoctoproject.org>;
 Sun, 11 Sep 2022 10:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xo4Ydk0mIxW4leGUM3+K68nwjZ1Dcyf4PtO8Dcda5s8=;
        b=MhEwrO7Nob+EbtJuU6eF4jZ91MT8VzZ+NisqzsN+cIUjC3Ku3n8IRlfX70xGIHtaGM
         pYsGqG8kqzJ7csuSugo+X8hLvkncpXmeinz9Sx9KpvmbyXtRetuGhAn1BGguap6NkShR
         UOjTqXL0gIusMQLOtR6D9C67Ji92NIJ+e+5d2uWZRU05AQl4YmbICzwzJY3uT/b1qeMm
         aqX27M5NVAPSQAJFovb9hMBEP1pQMG+E4TW/C6ynpj44cnyHi1iaYq/4cVHS92RuRW5A
         n4ywIarP1onKd8SZ8ZdIHigWA0j9s7Zt0hSH2oaxCkEJpikAz94nSOGwfjkF10l27m2j
         hglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xo4Ydk0mIxW4leGUM3+K68nwjZ1Dcyf4PtO8Dcda5s8=;
        b=nguyDg7ktGamWcU8VnbOlbsAFq91KhOpQ3t4Ojc95FTvMVyCXZFz7Hye5JofAgm+e2
         oGNkwSqUIPL0H9WjJVVAq6heYh9mmgkLdKPm/DG+mGljq9fiME1ZqAU3hy8SMb5hHFqU
         D2gKEzp0OkviCctO0WDiHcDBz8iwIJD8Ttz40jhId0YWiXZW/K8ybr98KbwOJMdKObmB
         a3DKQF2fDOd3dsbPhVvR4qC4HJagCyGTLd2iShEIcrp6K524+9CjeiY2k6aDYZOLyu+a
         /h+sSsR0HF6NeZJ0/LLD5z0Pup5NOn6D8BXMVeC0EszshleODYyw9TQAt7Nfw4pDifMq
         YhiA==
X-Gm-Message-State: ACgBeo1Ny3KtwADb2pZmzgaYkGO0P0oBA/6IE8whDwZYBr1y+LghOp6B
	s2OSpiz4UscqrlokFOK4IzIgQcjE0n4=
X-Google-Smtp-Source: 
 AA6agR4r2/6IZ4n4EbRgJwfkBGVxeu69Qu/snWcSVDp2uPHmO1TDnJHTlA6MZLSkhsHbOyR76MyaxA==
X-Received: by 2002:a5d:684f:0:b0:228:d83f:5e3c with SMTP id
 o15-20020a5d684f000000b00228d83f5e3cmr13005637wrw.318.1662917184913;
        Sun, 11 Sep 2022 10:26:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a5d4885000000b00228de58ae2bsm5280395wrq.12.2022.09.11.10.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 10:26:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/5] common-tasks.rst: drop the output of 'bitbake-layers
 --help'
Date: Sun, 11 Sep 2022 19:26:05 +0200
Message-Id: <20220911172608.2542076-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220911172608.2542076-1-alex@linutronix.de>
References: <20220911172608.2542076-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 11 Sep 2022 17:26:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3148

This is really not needed as the sub-commands are described in
greater detail just below, and is prone to become outdated.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/dev-manual/common-tasks.rst | 33 -----------------------
 1 file changed, 33 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index bdc528b72..c2afec946 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -653,39 +653,6 @@ For help on the BitBake layer management tool, use the following
 command::
 
    $ bitbake-layers --help
-   NOTE: Starting bitbake server...
-   usage: bitbake-layers [-d] [-q] [-F] [--color COLOR] [-h] <subcommand> ...
-
-   BitBake layers utility
-
-   optional arguments:
-     -d, --debug           Enable debug output
-     -q, --quiet           Print only errors
-     -F, --force           Force add without recipe parse verification
-     --color COLOR         Colorize output (where COLOR is auto, always, never)
-     -h, --help            show this help message and exit
-
-   subcommands:
-     <subcommand>
-       layerindex-fetch    Fetches a layer from a layer index along with its
-                           dependent layers, and adds them to conf/bblayers.conf.
-       layerindex-show-depends
-                           Find layer dependencies from layer index.
-       add-layer           Add one or more layers to bblayers.conf.
-       remove-layer        Remove one or more layers from bblayers.conf.
-       flatten             flatten layer configuration into a separate output
-                           directory.
-       show-layers         show current configured layers.
-       show-overlayed      list overlayed recipes (where the same recipe exists
-                           in another layer)
-       show-recipes        list available recipes, showing the layer they are
-                           provided by
-       show-appends        list bbappend files and recipe files they apply to
-       show-cross-depends  Show dependencies between recipes that cross layer
-                           boundaries.
-       create-layer        Create a basic layer
-
-   Use bitbake-layers <subcommand> --help to get help on a specific command
 
 The following list describes the available commands:
 
-- 
2.30.2


