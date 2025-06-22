Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DF2C7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 14:35:01 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.27137.1750602893741750267
 for <docs@lists.yoctoproject.org>;
 Sun, 22 Jun 2025 07:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=SzTJZ+Oe;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=c5yKdv+fwG5YLSPHa+Szeo2kK7L8ueDDwCiu2hl9rYQ=; b=SzTJZ+OeOzdISWfoWUGrbDalp/
	yO+kU8Pw0aQnDyjL7d3G/47pqg9UviKz5K8MPOQ/0VBfRHoOopeKaHFZ9v2TnspUcULClyoebM/7l
	Ha9tigdpc5yasRG6qJNSwMqUSlQd4SJn7wpVYTPLxnYn1X9NEYBm5aUff894ZTLsowGI4WE6VTHj9
	ldi1RFcw1BjSrJm6lmXYGoV7l9laypjnCOMR4tzIRrhqQfR5XKc/HzZ7geR7noMwLFCA8KT0uoKUB
	zbErng/De1aKMRr0LGi4N1qirEJaX8T7ceAzpMH969rp4kGQAvH5nIYQozc74E1fecVS/JvRzSccH
	nBN9UbLA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:49300 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTLmS-00000007pWj-0BCC
	for docs@lists.yoctoproject.org;
	Sun, 22 Jun 2025 10:34:51 -0400
Date: Sun, 22 Jun 2025 10:34:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: correct misspelled reference to
 sstate-cache-management.py
Message-ID: <bca142bb-16d5-d893-5d4b-a0538b38720c@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sun, 22 Jun 2025 14:35:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7139


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/disk-space.rst b/documentation/dev-manual/disk-space.rst
index efca82601..ba3afa5a2 100644
--- a/documentation/dev-manual/disk-space.rst
+++ b/documentation/dev-manual/disk-space.rst
@@ -52,7 +52,7 @@ such as BSD based NAS::
    sstate-cache-management.py --remove-duplicated --cache-dir=sstate-cache

 This command will ask you to confirm the deletions it identifies.
-Run ``sstate-cache-management.sh`` for more details about this script.
+Run ``sstate-cache-management.py`` for more details about this script.

 .. note::


