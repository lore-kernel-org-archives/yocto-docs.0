Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4692C7EE31
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 08:16:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.3473.1750752977541806025
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 01:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=GaJN9I1Z;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q+VKpHVlKfixOqfouWDv6O5qXGQUK1xlde+5/zIEO6Y=; b=GaJN9I1ZJHStE4D/mnyKxtgSty
	otQCZSOSIC2RGASXC/hbt4dXpFhF4OhMrBnbCoR02UQeeiqawU+qdwjuLunWpb6ZgKqOxh4r+Qkc+
	h+WQu2hNs6tPKaBoxSo4q+eqzgn5nQz91haHbcSC5Vc4v+uYI8KBW0Of7aLVdRb3ZDXKmmnvgqkwd
	2XPmQXoNxEGTDrNQoTbmjWc+yp9Ld3zpONTzbe1v/7sTdE5Y4dhphFLsT2Crg+xLJM/4jlr1M2pX+
	xcuIoBqK9/GBio3z6Yn5IxbkOXvrfsf/JLpLLjycQUSReuPQNT4A385rMFSeBeN4GYQO5xUhJ4GZz
	gKfoq3uA==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:54764 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTypB-0000000Dvlo-2AYd
	for docs@lists.yoctoproject.org;
	Tue, 24 Jun 2025 04:16:15 -0400
Date: Tue, 24 Jun 2025 04:16:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] dev-manual: correct statements that source is always
 tarballs
Message-ID: <82eb83e2-a1ac-ce34-d680-7e4e50caf5a3@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 08:16:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7188


Correct two occurrences that imply source is always fetched as
tarballs.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/efficiently-fetching-sources.rst b/documentation/dev-manual/efficiently-fetching-sources.rst
index a15f0a92c..a3366226c 100644
--- a/documentation/dev-manual/efficiently-fetching-sources.rst
+++ b/documentation/dev-manual/efficiently-fetching-sources.rst
@@ -6,7 +6,7 @@ Efficiently Fetching Source Files During a Build
 The OpenEmbedded build system works with source files located through
 the :term:`SRC_URI` variable. When
 you build something using BitBake, a big part of the operation is
-locating and downloading all the source tarballs. For images,
+locating and downloading all of the source code. For images,
 downloading all the source for various packages can take a significant
 amount of time.

@@ -18,7 +18,7 @@ Setting up Effective Mirrors
 ============================

 A good deal that goes into a Yocto Project build is simply downloading
-all of the source tarballs. Maybe you have been working with another
+source code. Maybe you have been working with another
 build system for which you have built up a
 sizable directory of source tarballs. Or, perhaps someone else has such
 a directory for which you have read access. If so, you can save time by

