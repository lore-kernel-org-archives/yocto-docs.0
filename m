Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDFDCD4F3C
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 18:32:04 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5820.1779215516130107197
 for <docs@lists.yoctoproject.org>;
 Tue, 19 May 2026 11:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=RSd+D4LO;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rREe72MGzfUAWnfNOrXrx2+d0zW1yF3BDqJ/jPdjqUQ=; b=RSd+D4LOIX6zRuddH/pHLfbANJ
	jMZdUnCgl0fyG2WLCGwYb3sTFyHsKpfuf/TJdwfMVfFKKXUq5Yaz4oMG4K+SPp7SJs55gUvjkSTR1
	xjUDGD3in9Vs8zso5+LxAZlxd+Yi+hkdttABaJU7qaa/vIYQcLOFc1W5supIA/6Cll0j9KN97lvBu
	fUHDUdtK9wmlKEQCJvFWtVp9gQmdWZhenIH+nBYkWeq4nwcZIswI7A9QAUW4s+bs3GS8OwpYn07HQ
	1VVyBWQ0Yrl9zuT79/gwL83G9M1rE4kyHpgiVO6WJaIyHwIaq0RrDds9cZ+lmk5JVadtxcyqUKwLu
	JaMuVSEA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:34834 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wPPEP-00000009bQQ-1HIX
	for docs@lists.yoctoproject.org;
	Tue, 19 May 2026 14:31:54 -0400
Date: Tue, 19 May 2026 14:35:10 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] recipe-style-guide.rst: two minor grammatical tweaks
Message-ID: <adbfd9b9-4f6b-56b3-0a77-232948553cc8@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 19 May 2026 18:32:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9496


Minor rewording in two places.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/documentation/contributor-guide/recipe-style-guide.rst
index d0cb65295..8a896a31c 100644
--- a/documentation/contributor-guide/recipe-style-guide.rst
+++ b/documentation/contributor-guide/recipe-style-guide.rst
@@ -293,7 +293,7 @@ Tips and Guidelines for Writing Recipes
    - then, copy ``X.orig`` back to ``X``,
    - and, finally, modify ``X``.

-   This ensures if rerun the task always has the same end result and the
+   This ensures that rerunning the task always produces the same end result and the
    original file can be preserved to reuse. It also guards against an
    interrupted build corrupting the file.

@@ -403,7 +403,7 @@ CVE patches
 ===========

 In order to have a better control of vulnerabilities, patches that fix CVEs must
-contain a ``CVE:`` tag. This tag list all CVEs fixed by the patch. If more than
+contain a ``CVE:`` tag. This tag should list all CVEs fixed by the patch. If more than
 one CVE is fixed, separate them using spaces.

 CVE Examples

