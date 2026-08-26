Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A81C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 01:37:12 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3434.1787708229745303041
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 18:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S4KF549m;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92e65e18969so36072685a.1
        for <docs@lists.yoctoproject.org>; Tue, 25 Aug 2026 18:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787708229; x=1788313029; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NFWrIK7q5swhXALBkw1yx9Y3MjbyO0YF6+zCdDPwEa0=;
        b=S4KF549mmIOnwys+0YJ45NNTX9WVfnK6NO2rdg/THopuV4B4/h8r1Is4mTfCGuO9ED
         QBq5Jlk2/7cb0OLNdwBS4iK6sUGq4N9thnbSe8ktjKgnmf0zb8hfaiUw02oKL039NX7r
         v+R8uKwhLl/XSdER8vHdfvsy/ElT6BOjoN949OWX5CxhShR88p5R5T3g7e6dK0KGXM6N
         AS9hUOkui8ALwbHn8I4CEPGlAVlJPB8vTzVGWV/+uyLAxSJw2uhScmB0y1DgI7Qnfmmx
         rlszHvdg5/UCjrjIlFF1rs85hit4NqKTCI7Vsl1Pw+Mwu3U1xoULXsTcWFokn8HKIAjm
         Wwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787708229; x=1788313029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NFWrIK7q5swhXALBkw1yx9Y3MjbyO0YF6+zCdDPwEa0=;
        b=NApBfeJ6exPbYrCouu7pZREtzq2hHAr8mzV3jBsQbQ5QOSeifR3Hsnupba4WlAwOT/
         3MqUpm61Yes/D4q5wv835rf0sIiNc0ggHJU26nvl85TnbiTsWVkUvrip90a2MyXD+eRj
         1R9v57UQNKJAfashC/HdlzPdJ0GeOdNUfhFfA7Bu4SRnwEJSAGBC89hrvxSp+Tsw4k9o
         eDz/VWIkKZzyG1PiWylAmjAct7aoJnyTMoZg+xuyUJQK7GNAHQQOOsAV3ZHIxoup7+Mq
         +om03xxxqCJ09TruSzu8qDfaxQm9D03R4405cEH6syy9x46thXIkFutHWwVPXB2U1k6+
         BFBg==
X-Gm-Message-State: AFuF++n7bVinNKIUL0COhO3A6m6pRdvAfIkQAMQq6ZcytNv6OBAlniDz
	e5k8VKTaBokX5WzYTaZ2u/Sy4srVrarxGu+KfH1rpPcrKeB1lX5CRwLe91tepHGm
X-Gm-Gg: AR+sD101snGA1hMtGNWZBMTPZCH0EvUL9AQJOzDjRc1q61IbNtu2MqyJu75vtRfSmN+
	+hBWDf8z5v6/Ofn1OpNfxSwGNlEhKsA792WnzqEr6n9iirSr3MvIysWfuktsxEPJWMRaNmCra3G
	jqAgX/376Ok4eQg5TKhdl0ceAUXcJ4QUNgxlwQFIMhTq+I6uuw9r5vVsUx6EwAQz4qJ0I7mTpCU
	hEuCI4N38yuT6Tyvv7qXgP9BZeGUMh/p6AyFLRxrEPrfnF9kEJizhgq3CQP4kdvO5mTWnwBqYzc
	++8KAZ3lcKXY4o+PciGjg9BY8ITR/VATuwRM4/EauSQBjQ18+qKJDE+VK1HlR9GP+fpFhEHKf7V
	XIfbPhIr759OxbAwBFGFB3vBqfSm4B3OXkpXSFgxO9Y1238iPGrr3YghkWe2zye+BLgj8aw5jEq
	4no30o6ouHkqGlCRnaPUi3u6VZx+/LQrk11FBRZIB2mtqUhsX3xiz+msydpls3dEjbbW4owoDsQ
	s5CckxNdAC43kdTLC856oryWO9V3+k=
X-Received: by 2002:a05:620a:440f:b0:936:ef9c:8bef with SMTP id af79cd13be357-9376f2fb958mr1235192785a.2.1787708228608;
        Tue, 25 Aug 2026 18:37:08 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e67c50esm103863685a.37.2026.08.25.18.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:37:07 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Cc: bitbake-devel@lists.openembedded.org
Subject: [PATCH 0/4] doc: highlight BitBake snippets with the bitbake language
Date: Tue, 25 Aug 2026 21:36:59 -0400
Message-ID: <20260826013703.2674786-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 01:37:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10356

Pygments 2.21.0 added a BitBake lexer, so BitBake snippets can now say
what they are instead of rendering as plain literal blocks. The user
manual is where the language is documented, so it seemed the wrong place
to leave unhighlighted.

No prose changes, no reflowing, no reindenting - every hunk turns a
literal-block introducer into a code-block directive and nothing else.

Which blocks were converted was decided by reading. Blocks that share
BitBake's assignment shape but are another language were left alone,
including the bitbake-setup settings files, which are INI and already
tagged as such.

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

"doc: state the language of six Python blocks explicitly", sent
separately. That patch stands on its own and can go in independently;
this series is based on it only so the two do not touch the same lines.

One block worth a second opinion
--------------------------------

bitbake-user-manual-ref-variables.rst has two blocks where one real
assignment is followed by a long prose "where: ..." explanation. I have
tagged them, but the same shape elsewhere was deliberately left as a
plain literal block, so I may have called this one wrong.

Trevor Woerner (4):
  doc: bitbake-user-manual-metadata: use the bitbake code-block language
  doc: bitbake-user-manual-ref-variables: use the bitbake code-block
    language
  doc: bitbake-user-manual-fetching: use the bitbake code-block language
  doc: use the bitbake code-block language in the remaining chapters

 .../bitbake-user-manual-execution.rst         |  44 ++-
 .../bitbake-user-manual-fetching.rst          | 124 ++++--
 .../bitbake-user-manual-hello.rst             |  20 +-
 .../bitbake-user-manual-intro.rst             |  24 +-
 .../bitbake-user-manual-metadata.rst          | 372 +++++++++++++-----
 .../bitbake-user-manual-ref-variables.rst     | 188 ++++++---
 6 files changed, 579 insertions(+), 193 deletions(-)


