Return-Path: <beroset@ieee.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FA7C77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 13:59:17 +0000 (UTC)
Received: from drive140.trustyservers.com (drive140.trustyservers.com [64.118.88.4])
 by mx.groups.io with SMTP id smtpd.web10.9288.1686146348179481419
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 06:59:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@beroset.com header.s=default header.b=sMjKPjQe;
 spf=permerror, err=parse error for token &{10 18 _spf.google.com}: parse error for token &{10 18 _netblocks3.google.com}: limit exceeded (domain: ieee.org, ip: 64.118.88.4, mailfrom: beroset@ieee.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=beroset.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RzvX4bEAj2FWmynxhQFnwORh/5dPbyDQiwsECtXrDMU=; b=sMjKPjQe0DAlD7tzA8J5/pIjUS
	D9nvyQZtxB87an0C3OcuNmFOef6m2DfQpolGPxWML26YUhS/JWTQCngf3zP/jgY2gaW7wN1KLsQqr
	++Jprf/molh0Pn2bOo3hG5XUP+OrjtprFP1Q2th7o/P0GU/92fHIuN+NO24LarPmRk/h2oCEcRFEK
	a390a2ZaB8T3ieQTuNB00k5bblKmWZu3ze+u0Oz4jI7+eh9iwhx3TQ3y+VQIi2MbeW8GsPTkH6SAY
	jggWFx+AldjpfJk67cixcwIc8PFhXZqxfuF8fR1d4maeKTd6oKD+T2kB4SBfwOhMfMtXCojXcU4kU
	h+sfoLkg==;
Received: from 104-185-76-86.lightspeed.rlghnc.sbcglobal.net ([104.185.76.86]:33086 helo=flash.attlocal.net)
	by drive140.trustyservers.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <beroset@ieee.org>)
	id 1q6tgq-0001rV-2N;
	Wed, 07 Jun 2023 09:59:07 -0400
From: beroset@ieee.org
To: docs@lists.yoctoproject.org
Cc: Ed Beroset <beroset@ieee.org>
Subject: [PATCH] Add clarification for SRCREV
Date: Wed,  7 Jun 2023 09:58:31 -0400
Message-Id: <20230607135831.519561-1-beroset@ieee.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - drive140.trustyservers.com
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - ieee.org
X-Get-Message-Sender-Via: drive140.trustyservers.com: authenticated_id: eddieieee@beroset.com
X-Authenticated-Sender: drive140.trustyservers.com: eddieieee@beroset.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 07 Jun 2023 13:59:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3989

From: Ed Beroset <beroset@ieee.org>

It was not clear to me what a "full revision identifier" was in the
context of the note documenting SRCREV.  After clarification via IRC,
this submission attempts to clarify what is meant to help future
readers.

Signed-off-by: Ed Beroset <beroset@ieee.org>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6a7888ab4..5b96e4efe 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7942,7 +7942,7 @@ system and gives an overview of their function and contents.
       that if you want to build a fixed revision and you want to avoid
       performing a query on the remote repository every time BitBake parses
       your recipe, you should specify a :term:`SRCREV` that is a full revision
-      identifier and not just a tag.
+      identifier (e.g. the full SHA hash in git) and not just a tag.
 
       .. note::
 
-- 
2.40.1


