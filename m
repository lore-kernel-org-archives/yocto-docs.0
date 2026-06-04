Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954C7CD6E57
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 08:45:06 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6878.1780562702147015213
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 01:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Z+2yjszH;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zPq/gD5QyYOG3mPm199cWvh4InykBR+UJj2/ShDuFXc=; b=Z+2yjszHPBNkfzBHdn4byq63Jg
	CK73JIkT6TjptR/e/vC5BjBDh1lYTJA8DGWry6CYBkO8Qk7KmWmJQSXG/Z8rElBOfqLa/TdYP5KLC
	Q0P3wTtXjTT0oR403J6Y7yuk1TW13UqFjbd9DlKO1xmZ1u4IHY0JsbJj+1O27UDjBkDh04FEkc1D8
	QrQPRHR6phrw3N3xgekjJGz6NuKxoJGUFxRowQDZbn7MuzDFYAdNcy1oQBd0n5iW8kJRjQ/+Zh3Ao
	Sq/E76ntAqfZwQpkUcqr14BmN23+o0CB+zHJqcMqn0g/DFOch0noCGDT4KwJUgJjoB13RhC8wsupc
	Eig31Obw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:51900 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wV3hC-0000000Alrx-3DMV
	for docs@lists.yoctoproject.org;
	Thu, 04 Jun 2026 04:45:00 -0400
Date: Thu, 4 Jun 2026 04:45:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] overview-manual: mention that patch files can be
 compressed
Message-ID: <c9900698-224d-8acc-0c77-7fa1363e341f@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 04 Jun 2026 08:45:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9576


Ensure the reader understands that patch files can be compressed.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index ec5babe4c..0c03c0a9b 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -741,7 +741,8 @@ and the :term:`FILESPATH` variable
 to locate applicable patch files.

 Default processing for patch files assumes the files have either
-``*.patch`` or ``*.diff`` file types. You can use :term:`SRC_URI` parameters
+``*.patch`` or ``*.diff`` file types (or a compressed form of those
+file types). You can use :term:`SRC_URI` parameters
 to change the way the build system recognizes patch files. See the
 :ref:`ref-tasks-patch` task for more
 information.

