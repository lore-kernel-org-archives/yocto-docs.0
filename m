Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 168B4C7EE2A
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 08:41:17 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.3723.1750754474543585334
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 01:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=UzAaSHzy;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yle206WUs3Xo7nMk2hMPUIglWVbR50pyULqdCm0VxC8=; b=UzAaSHzyty7HCrnEsk2CQKlLVH
	ggsbiAAigz6ypy7klp+LtmR9MENHpB1cAQ+TkU98IeAiz7a5hi4uwlpcC+x04YQbVz68Tyx+aRYiu
	LLs+D3aq58mmchuICkwPODWlxUNJo3qGQrA7i7/ZGtM8i2Oz2s0X6lLNELbbCbQJM+E76y8tLGyrs
	PBUgn4VCUBqlVqudab1UBr8Lu2O7bbLEMalTbRg6kmzyCAQ4NUmFPgsH66Iz1Xvn997OnWUUXjsQa
	4qBqHOuLmuxBSYFU/eWptZLt7/jd7Pso1iTCNS43HDGdkjso3bnE5vF54C+hih+FWZmSEKX5j62IZ
	7FWY5PtQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:35214 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTzDL-0000000DzOC-0jpi
	for docs@lists.yoctoproject.org;
	Tue, 24 Jun 2025 04:41:12 -0400
Date: Tue, 24 Jun 2025 04:41:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: fix rendering of ${PN}
Message-ID: <27fe44b9-6e5f-9fed-9878-de50ffa72910@crashcourse.ca>
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 08:41:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7193


Current markup generates italic, not monospaced.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/prebuilt-libraries.rst b/documentation/dev-manual/prebuilt-libraries.rst
index a05f39ca1..e5ebddfdc 100644
--- a/documentation/dev-manual/prebuilt-libraries.rst
+++ b/documentation/dev-manual/prebuilt-libraries.rst
@@ -170,7 +170,7 @@ as follows::
 The modifications cause the ``.so`` file to be the real library
 and unset :term:`FILES_SOLIBSDEV` so that no libraries get packaged into
 ``${PN}-dev``. The changes are required because unless :term:`PACKAGES` is changed,
-``${PN}-dev`` collects files before `${PN}`. ``${PN}-dev`` must not collect any of
+``${PN}-dev`` collects files before ``${PN}``. ``${PN}-dev`` must not collect any of
 the files you want in ``${PN}``.

 Finally, loadable modules, essentially unversioned libraries that are linked

