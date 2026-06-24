Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10AF1CDB47C
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 09:59:22 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3460.1782295155335111171
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 02:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=FFbkk0qY;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TfAm8CzyUpbE0hm7p6r2HuV5AnWiJt4bXvN3AWfTNNI=; b=FFbkk0qYneTvrTh8JSLKW8hHgS
	lyPpXuuQFcSmgF6kWi6lUNAZxm5ZX5ywoJ6x4Po+MZPwsDh5BDtenswWym9JDdmCqCfzvx93AA77c
	x2yiDYvRBIXFzBOk148A3QMTuV89AMo3a7+0BV4VJ9j+ua2Nlc00lhTcNajwmkvPOoCQ/NifVEiwC
	e40ry+55fb2UuzY7tD8x/vCwGZxKyXWjcCUMe3daEDj6F+ThpvVGjP9duUb06213DhHpGk6Eo+l5S
	Qrjz2Yh40I0X3iKTEu56/X0fdDy4Gq07CChbtp1HFkYXaKOymoQvS5Zg4lQ147xOVk+rS/sgI34fP
	K0lHud1Q==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:42628 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wcKNs-0000000FDE5-2cBQ
	for docs@lists.yoctoproject.org;
	Wed, 24 Jun 2026 05:59:13 -0400
Date: Wed, 24 Jun 2026 05:59:00 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] test-manual: grammatical and URL tweaks/additions in "Welcome"
 section
Message-ID: <fba6cfe7-72f7-a120-7861-1ec02c4cb3c0@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 09:59:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9857


Changes to "Welcome" section of Yocto Project Test Environment Manual:

  - add missing word "with"
  - shorten to not mention this is a "work in progress" twice
  - add links to Autobuilder repositories
  - add reference to Wikipedia "Jenkins" article, as is done
    elsewhere in the docs

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index d55540c8d..0868abe8c 100644
--- a/documentation/test-manual/intro.rst
+++ b/documentation/test-manual/intro.rst
@@ -7,8 +7,8 @@ The Yocto Project Test Environment Manual
 Welcome
 =======

-Welcome to the Yocto Project Test Environment Manual! This manual is a
-work in progress. The manual contains information about the testing
+Welcome to the Yocto Project Test Environment Manual,
+which contains information about the testing
 environment used by the Yocto Project to make sure each major and minor
 release works as intended. All the project's testing infrastructure and
 processes are publicly visible and available so that the community can
@@ -19,27 +19,28 @@ environment used by the Yocto Project to create their own automated,
 production test environment, building upon the foundations from the
 project core.

-This manual is a work-in-progress and is being initially loaded with
+This manual is a work in progress and is being loaded initially with
 information from the README files and notes from key engineers:

 -  *yocto-autobuilder2:* This
    :yocto_git:`README.md </yocto-autobuilder2/tree/README.md>`
    is the main README which details how to set up the Yocto Project
-   Autobuilder. The ``yocto-autobuilder2`` repository represents the
-   Yocto Project's console UI plugin to Buildbot and the configuration
-   necessary to configure Buildbot to perform the testing the project
-   requires.
+   Autobuilder. The :yocto_git:`yocto-autobuilder2 repository </yocto-autobuilder2>`
+   represents the Yocto Project's console UI plugin to
+   Buildbot and the configuration necessary to configure Buildbot
+   to perform the testing the project requires.

 -  *yocto-autobuilder-helper:* This :yocto_git:`README </yocto-autobuilder-helper/tree/README/>`
-   and repository contains Yocto Project Autobuilder Helper scripts and
-   configuration. The ``yocto-autobuilder-helper`` repository contains
+   and repository contains Yocto Project Autobuilder Helper scripts and configuration.
+   The :yocto_git:`yocto-autobuilder-helper repository </yocto-autobuilder-helper>` contains
    the "glue" logic that defines which tests to run and how to run them.
    As a result, it can be used by any Continuous Improvement (CI) system
    to run builds, support getting the correct code revisions, configure
    builds and layers, run builds, and collect results. The code is
-   independent of any CI system, which means the code can work `Buildbot <https://docs.buildbot.net/current/>`__,
-   Jenkins, or others. This repository has a branch per release of the
-   project defining the tests to run on a per release basis.
+   independent of any CI system, which means the code can work with
+   `Buildbot <https://docs.buildbot.net/current/>`__,
+   :wikipedia:`Jenkins <Jenkins_(software)>`, or others. This repository has a
+   branch per release of the project defining the tests to run on a per-release basis.

 Yocto Project Autobuilder Overview
 ==================================

