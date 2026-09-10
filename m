Return-Path: <andrei.lalaev@anton-paar.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAEEC79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 07:42:04 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8514.1789026122158660894
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Sep 2026 00:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=VlxF9uge;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+andrei.lalaev.anton-paar.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 10FD243EDA;
	Thu, 10 Sep 2026 07:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7971C2BCC7;
	Thu, 10 Sep 2026 07:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789026120;
	bh=vsKlD48YbNV/NvfGYUA5cm7Ub2BHy0Ie4PFcJKsRwUo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=VlxF9ugeF5nCL6sgLXCEP0pziwnN4M+dKbs2hVA9m8mulgkXT/bdy05mILhu+KVBJ
	 h10c11ZxRqw4VM0zPtmi8UIEO9OZh1HR8f3wK5wVDrZOizJDXj4C+9C8ARUIGO9U2m
	 raFTtRsgxCohfUJe3M1DVwTdJiKmp0OwebnCdoXO2egUAN96HpCXHl020hji+FOcCq
	 nhgv7ix8jULEw2Kz/guEx3FckaLHTG5W/S1xUJwvkSVzIc2HZymqpoAR3eeZ92HYia
	 /a53c9vVsaMfK8u2a7YaCz1I+Esc/65/YZAIaHfxgiL1TCAhXHTCtzW2HUU+k1CKvU
	 ab3KGnANVF2Ug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF78C88E41;
	Thu, 10 Sep 2026 07:42:00 +0000 (UTC)
From: Andrei Lalaev via B4 Relay <devnull+andrei.lalaev.anton-paar.com@kernel.org>
Date: Thu, 10 Sep 2026 09:41:55 +0200
Subject: [PATCH RESEND] ref-manual: update
 DEBUG_OPTIMIZATION/FULL_OPTIMIZATION
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-master-v1-1-7bf67b4fbebd@anton-paar.com>
To: docs@lists.yoctoproject.org
Cc: Andrei Lalaev <andrei.lalaev@anton-paar.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789026119; l=1856;
 i=andrei.lalaev@anton-paar.com; s=20250820; h=from:subject:message-id;
 bh=trinjwU2PSarYRydVzkoUwZSFKpYANZpkeqa7LktkOI=;
 b=lFzz6C3sUBv7upYZqYnwNXeDvjodRR6nIuQ0wVRxzvxmPAHea5vkq9hw0McDk/MIPN9O8crzP
 zXFZxkrQrbGCPxI/rcKhYXlOdnK/WGGqqWLatjxcy6tYWHJJVESbzkD
X-Developer-Key: i=andrei.lalaev@anton-paar.com; a=ed25519;
 pk=728nZXw7ILalhZmxQ0hPJ77AKRvsdNkq+v6XdryA5fM=
X-Endpoint-Received: by B4 Relay for andrei.lalaev@anton-paar.com/20250820
 with auth_id=496
X-Original-From: Andrei Lalaev <andrei.lalaev@anton-paar.com>
Reply-To: andrei.lalaev@anton-paar.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Sep 2026 07:42:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10447

From: Andrei Lalaev <andrei.lalaev@anton-paar.com>

Commit 9badf68d78d9 ("bitbake.conf: Further cleanup compiler
optimization flags") in openembedded-core changed the default values
of these variables. But documentation wasn't updated.
Update to the correct values.

Signed-off-by: Andrei Lalaev <andrei.lalaev@anton-paar.com>
---
 documentation/ref-manual/variables.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 83bc59efe..e0055920e 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2180,8 +2180,8 @@ system and gives an overview of their function and contents.
 
    :term:`DEBUG_OPTIMIZATION`
       The options to pass in :term:`TARGET_CFLAGS` and :term:`CFLAGS` when
-      compiling a system for debugging. This variable defaults to "-O
-      -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe".
+      compiling a system for debugging. This variable defaults to "-Og
+      ${DEBUG_LEVELFLAG}".
 
    :term:`DEBUG_PREFIX_MAP`
       Allows to set C compiler options, such as ``-fdebug-prefix-map``,
@@ -3811,8 +3811,8 @@ system and gives an overview of their function and contents.
 
    :term:`FULL_OPTIMIZATION`
       The options to pass in :term:`TARGET_CFLAGS` and :term:`CFLAGS` when
-      compiling an optimized system. This variable defaults to "-O2 -pipe
-      ${DEBUG_FLAGS}".
+      compiling an optimized system. This variable defaults to "-O2
+      ${DEBUG_LEVELFLAG}".
 
    :term:`GCCPIE`
       Enables Position Independent Executables (PIE) within the GNU C

---
base-commit: e35e86e9aea4e4ae12e8e0ba8a6391f2b2555b63
change-id: 20260910-master-cf1a97eb6bc2

Best regards,
--
Andrei Lalaev <andrei.lalaev@anton-paar.com>
-- 
Andrei Lalaev <andrei.lalaev@anton-paar.com>



