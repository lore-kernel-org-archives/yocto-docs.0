Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B17CD8CB2
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 19:20:37 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3861.1781032834713273019
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 12:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=opDYt4aW;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+Dzn65JTKzYkQWtX8/Rk3UIiOXYaKV9336Gw+lBfCLs=; b=opDYt4aW+9R9CODS4DcoQvEXSS
	d8HibcZ1PbT3O4fM3aT8cA4gbgHzrtvHeYZaKKM40INBQ6YPbAKYuXRpz5SrPfAArJquC8D4SmygT
	Ad6AeRUNlf+TRcXW/thDfvqT0982bz8i9W+AJVnTWRNQJFtxmwMUIDM2BvGfzUXShIBtlCxjrkkLS
	HU2I5vJUC3MCjn1g6zZLlfZFILmhnRBJzLqd1f2yLOhVs64hPWUQTtDeh9rzK98jzOsq8ahdo6De3
	mz50O2MOZ2OHDS6SjSZolySSyhXYHkOuMlhkITOnUmRPm1bvd31ubA11iDhErumB0SyWNBU8JSolc
	5L6OL16Q==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:47976 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wX200-00000006unV-1dvY
	for docs@lists.yoctoproject.org;
	Tue, 09 Jun 2026 15:20:33 -0400
Date: Tue, 9 Jun 2026 15:20:27 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: add command to force a recipe re-compile
Message-ID: <06ee4e3f-d477-0b55-be14-ff74aa2383c1@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 19:20:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9668


Since this section talks about how to modify unpacked, temporary
source code, it only makes sense to tell readers how to re-build that
modified source.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/temporary-source-code.rst b/documentation/dev-manual/temporary-source-code.rst
index aecd34099..26a96303e 100644
--- a/documentation/dev-manual/temporary-source-code.rst
+++ b/documentation/dev-manual/temporary-source-code.rst
@@ -65,3 +65,11 @@ build system uses to build the package would be as follows::

    project/build/tmp/work/qemux86-poky-linux/foo/1.3.0

+Finally, if you make some changes to a recipe's unpacked source code,
+you can force a re-compile of that recipe with the command::
+
+   $ bitbake -c compile -f recipe-name
+
+The ``-f`` option in the above forces that task to be re-run
+(invalidating any existing stamp file).
+

