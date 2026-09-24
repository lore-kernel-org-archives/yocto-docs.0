Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30355C98326
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 19:29:52 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6569.1790278183695146385
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 12:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=UhvaoM4Y;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-202609241929407fbc43853c00020708-kekbp8@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202609241929407fbc43853c00020708
        for <docs@lists.yoctoproject.org>;
        Thu, 24 Sep 2026 21:29:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=z1ufJX1cttMeJoeBoN+lzI1zqiCzpL/Lsz4jMA8BLVc=;
 b=UhvaoM4Y0IBTfB1EJ/M5N3wclu7fOs0h+Kmaju7TmfWA1kONl2Ca2APiSBPnBa8OyZlRi9
 Rp9ug50A6uxxH69Q8JcE4JpPGE6gtAVjnbBhkGkm2FFK7lCOt1wDG66+bX9CFQVxAxDIQiod
 YScsn8gMheNfcXUa1FHaoAmizyqWquPiUTSeDrQENlE9byufaYwR+GXyZuJWwew5hetCJBnO
 ireEw+EyDzJqM2VWw6NOkCmkQXPrX3WWC5lXxY7FaqCoLXMoctUxWWf1ldffqdkLhAeTuhID
 iyMJf7ERO7kujl/FyMys/zBBqxFr2RI2f1+h2iS12FlKVZ7Ot6xyColw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 0/5] dev-manual/devtool: ide-sdk doc rewrite and Mermaid diagrams
Date: Thu, 24 Sep 2026 21:29:02 +0200
Message-ID: <20260924192929.907566-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 19:29:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10634

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Update the "devtool ide-sdk" section to reflect its current behavior,
and fix outdated non-patch local file handling docs (5.1 change).

Add the sphinxcontrib-mermaid Sphinx extension, add workflow/
architecture diagrams for "devtool ide-sdk", and convert the existing
devtool add/modify/upgrade flow chart PNGs to Mermaid too.

Diagrams render client-side via a CDN-hosted mermaid.js, so the build
server needs no new dependency.

Adrian Freihofer (5):
  dev-manual/devtool: fix non-patch local file handling docs
  dev-manual/devtool: update devtool ide-sdk section for recent features
  conf.py: support mermaid plugin
  dev-manual/devtool: add Mermaid diagrams for the ide-sdk workflow and
    architecture
  dev-manual/devtool: convert add/modify/upgrade flow diagrams to
    Mermaid

 documentation/Pipfile                         |    1 +
 documentation/conf.py                         |    6 +
 documentation/dev-manual/devtool.rst          | 1026 +++++++++++------
 .../dev-manual/figures/devtool-add-flow.mmd   |   73 ++
 .../dev-manual/figures/devtool-add-flow.png   |  Bin 181699 -> 0 bytes
 .../figures/devtool-ide-sdk-architecture.mmd  |   53 +
 .../devtool-ide-sdk-nfs-architecture.mmd      |   58 +
 .../figures/devtool-ide-sdk-workflow.mmd      |   43 +
 .../figures/devtool-modify-flow.mmd           |   77 ++
 .../figures/devtool-modify-flow.png           |  Bin 171676 -> 0 bytes
 .../figures/devtool-upgrade-flow.mmd          |   52 +
 .../figures/devtool-upgrade-flow.png          |  Bin 138917 -> 0 bytes
 .../sphinx-static/theme_overrides.css         |   17 +
 13 files changed, 1046 insertions(+), 360 deletions(-)
 create mode 100644 documentation/dev-manual/figures/devtool-add-flow.mmd
 delete mode 100644 documentation/dev-manual/figures/devtool-add-flow.png
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-architecture.mmd
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-nfs-architecture.mmd
 create mode 100644 documentation/dev-manual/figures/devtool-ide-sdk-workflow.mmd
 create mode 100644 documentation/dev-manual/figures/devtool-modify-flow.mmd
 delete mode 100644 documentation/dev-manual/figures/devtool-modify-flow.png
 create mode 100644 documentation/dev-manual/figures/devtool-upgrade-flow.mmd
 delete mode 100644 documentation/dev-manual/figures/devtool-upgrade-flow.png

-- 
2.55.0


