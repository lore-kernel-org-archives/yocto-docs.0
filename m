Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF6FCCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 16:11:32 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.15717.1761322286700780243
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 09:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=EA3jlaMt;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=j7eOZTgFqZy28RQ81NzpFTUXGBlddsXfnWGmRNn3KpQ=; b=EA3jlaMtV8L+7NI+eo4ltYOsq0
	RUZrF0ur/6+UO6y0wKDN+ZL3j7RHFtKGuanmFWMRpfCRRWwS6X/0wOFIdNwxkm6ROT2l0xG/U+qAs
	0y82JEZD6P02gKxI8Sg8H/GJjR7i3FesIyCxQVLHoaaEJhE+9LCCqQ58mltzec7dBPf6ZPEMKS9df
	PXoWRjVR58yXzR8lV+VDdgU36/V3Dhw3/kEgPW8BexprOroXTBgYdVrOk/jPvto8ohzH+bKHpTXFh
	A9kQ+qL6pMTJhwHr3lLjnXmwYGYcNCOtLRBnGAS/Dzp5Z34jDbWyGdpjunX58G0P1fSNO2wF7qYmX
	XkaVxrAQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:59248 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vCKNt-0000000GrgW-1Keg
	for docs@lists.yoctoproject.org;
	Fri, 24 Oct 2025 12:11:25 -0400
Date: Fri, 24 Oct 2025 12:13:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v3] overview-manual/yp-intro.rst: update on-target packaging
 info
Message-ID: <acbe686e-f104-d46c-585b-418188efe6e8@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 16:11:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7835


  - drop references to obsolete tar packaging format
  - add references to apt and dpkg utilities for .deb packaging
  - add reference to alternative "dnf" .rpm packaging

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 8fa17b191..85583567e 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -174,11 +174,12 @@ Here are challenges you might encounter when developing using the Yocto Project:
    changes on the development system within the BitBake environment and
    then deploying only the updated packages to the target.

-   The Yocto Project :term:`OpenEmbedded Build System`
-   produces packages
-   in standard formats (i.e. RPM, DEB, IPK, and TAR). You can deploy
-   these packages into the running system on the target by using
-   utilities on the target such as ``rpm`` or ``ipk``.
+   The Yocto Project :term:`OpenEmbedded Build System` produces packages
+   in standard formats (i.e. RPM, DEB and/or IPK). If you included
+   :ref:`runtime package management<dev-manual/packages:using runtime package management>`
+   in your image, you can deploy these packages into the running system on the target
+   by using the corresponding utilities on the target such as
+   ``rpm``/``dnf``, ``dpkg``/``apt`` or ``opkg``.

 -  *Initial Build Times Can be Significant:* Long initial build times
    are unfortunately unavoidable due to the large number of packages

