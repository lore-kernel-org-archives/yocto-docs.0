Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3F6CCD1AB
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 10:56:00 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.7306.1761303356145045388
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 03:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=EYDGEfsU;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QQiEhx8ade7i8JjwQWGmKCPOGkvpLKI7UESW/mMv5aA=; b=EYDGEfsUYsCzCbl9kj5bLwcWI1
	42oOe/8Ft78ZAtEyGYxEE5JrbUNnGwNCxXRR19DmKEfnfZn2imR+wKNpMPgsWtu4kIztJpiiKfSzB
	J0ov13ncJBnB7qc8qn0ZO30Wy5QJkN8xxWHzlsT+ZZZPdo3hgobhJfqyCU4RVXlV2E9NR92A7SMG+
	D0oUU6nbbgOYGfhUz9bS2NvP6CBfOueIwSTBa6fnRDD1jylSOEDJ3zM9iLgcU67SxRquBRwntuYEY
	+oimkeeKmhsQczpL6bUKfRriNbvb3zkF6u/UZt2z5tTxr9Zr+zv0PfgBwZqov69CzQOU4XrkDnuq0
	K5Vsf+/A==;
Received: from [147.129.179.166] (port=59388 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vCFSY-0000000G1hw-3TUe
	for docs@lists.yoctoproject.org;
	Fri, 24 Oct 2025 06:55:54 -0400
Date: Fri, 24 Oct 2025 06:58:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] overview-manual/yp-intro.rst: update on-target packaging
 info
Message-ID: <f94df486-b32b-d301-fc6b-b1a5d560298a@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 10:56:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7813


  - drop references to obsolete tar packaging format
  - add reference to on-target "apt" utility for .deb packaging

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 8fa17b191..ed50aff93 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -174,11 +174,11 @@ Here are challenges you might encounter when developing using the Yocto Project:
    changes on the development system within the BitBake environment and
    then deploying only the updated packages to the target.

-   The Yocto Project :term:`OpenEmbedded Build System`
-   produces packages
-   in standard formats (i.e. RPM, DEB, IPK, and TAR). You can deploy
-   these packages into the running system on the target by using
-   utilities on the target such as ``rpm`` or ``ipk``.
+   The Yocto Project :term:`OpenEmbedded Build System` produces packages
+   in standard formats (i.e. RPM, DEB and/or IPK). If you included the
+   "package management" feature in your image, you can deploy
+   these packages into the running system on the target by using the
+   corresponding utilities on the target such as ``rpm``, ``apt`` or ``opkg``.

 -  *Initial Build Times Can be Significant:* Long initial build times
    are unfortunately unavoidable due to the large number of packages


