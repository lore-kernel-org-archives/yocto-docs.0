Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD31CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 10:33:44 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17177.1781087621071182234
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 03:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=pEHpWHaT;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tsEfBwUotGQqs7BChBVBzRGZbl2TEc8S/+KDnBLW6DM=; b=pEHpWHaTMg8CNBZ2ALF+Ts2zoT
	AF7iDWBDGoO6WsS73FDyI3MhdZTbPYGbhHLD9ZVBQoNQYJRICihng4xsa3HG4yWOxdAcgUB+HXY/O
	TD5TC0zH0fmG1l8GjCrLIX6RqBBG6SQFrVZ2X9zldPqs2zC002L5TXZ7sqNGIweWeN7ih8ZobTRKe
	qKT8UTjVS995uqWpdog4iRFW/4ByfanSMoZG1Vg1qsRHtG201kvEvwlBYIcWMaHppKuu9T5FT2J1l
	J8rgmdQFs8iNgiuaPOBkMyPgms+r/dVL8n7lQKA4sMDNtH/02fE0fgzUm3czJtQtFqqBatmEAiuqU
	c8XFNKGg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:54292 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXGFe-00000008aNU-132Z
	for docs@lists.yoctoproject.org;
	Wed, 10 Jun 2026 06:33:39 -0400
Date: Wed, 10 Jun 2026 06:33:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: for testing local changes, refer to devtool
 section
Message-ID: <d5b8fa2c-b21c-74ca-edc1-0273e9bfe0e1@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 10 Jun 2026 10:33:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9678


At the end of the "Finding Temporary Source Code" section, refer the
developer to the section on the appropriate use of "devtool".

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/temporary-source-code.rst b/documentation/dev-manual/temporary-source-code.rst
index aecd34099..cb27d2207 100644
--- a/documentation/dev-manual/temporary-source-code.rst
+++ b/documentation/dev-manual/temporary-source-code.rst
@@ -65,3 +65,11 @@ build system uses to build the package would be as follows::

    project/build/tmp/work/qemux86-poky-linux/foo/1.3.0

+.. note::
+
+   If you want to iterate over testing your local changes, the proper way
+   is to use the ``devtool`` utility.
+
+   To learn how to use ``devtool`` to add, modify, upgrade recipes and more,
+   see the :ref:`dev-manual/devtool:Using the \`\`devtool\`\` command-line tool`
+   section of this Development Tasks Manual.

