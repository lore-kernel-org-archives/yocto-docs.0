Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E48CDB471
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 20:32:06 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30531.1782246719603098495
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 13:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=tG5fmJkP;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=E8TKucDqiL/SRVmKTzqtMOQLdEHp9nySPXSinaxtdnE=; b=tG5fmJkPFbs0bEQp8VF0Zz0foq
	fogrgd0Mg4CPFr40ssNz2pNc8L5UBRizmgjQ81oL6/+nWPqvdHJR2iQLroo6j9N9/wMAxq8hpzv1K
	UH6gPaG96YkMFHH6TYDRx2kS/bUGLFthUp+9Z/5JIcIGrS9sLrLuqs+T5XbSoFxtx0woeh89+q5H7
	D/GiLgNfZLi00wT1OMVCusG2UKbQ5xjXWAv9/x2o03U2QHGYzUVqfTbkSL9vsoV6GlPBppslATdBs
	dnsUblMTSCEZ4TGabJZy3NNpsnV8ctqV0Dd7TH74BzfYLOG+2qap3+1Hob+lD4UlGPc9OKw9lwZ9V
	kEjmtqig==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:36692 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wc7mf-0000000DqPh-2dOm
	for docs@lists.yoctoproject.org;
	Tue, 23 Jun 2026 16:31:58 -0400
Date: Tue, 23 Jun 2026 16:31:43 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: various cleanups to test "Welcome" section
Message-ID: <0f65bf28-d050-e239-3d15-40082ec24e79@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 23 Jun 2026 20:32:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9845


  - grammar fixes
  - hyphenation fixes
  - delete redundant text

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  mostly innocuous changes, but given the missing word "with", might
as well just add more cleanup.

commit 8612346ddf305ac6ce0cd0e0aadbc6a7c27ca67d
Author: Robert P. J. Day <rpjday@crashcourse.ca>
Date:   Tue Jun 23 16:27:43 2026 -0400

    test_1

diff --git a/documentation/test-manual/intro.rst b/documentation/test-manual/intro.rst
index d55540c8d..68a0827a4 100644
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
+   independent of any CI system, which means the code can work with
+   `Buildbot <https://docs.buildbot.net/current/>`__,
    Jenkins, or others. This repository has a branch per release of the
-   project defining the tests to run on a per release basis.
+   project defining the tests to run on a per-release basis.

 Yocto Project Autobuilder Overview
 ==================================


