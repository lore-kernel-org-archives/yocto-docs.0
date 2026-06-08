Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2B8CD8C9F
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 18:25:36 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61768.1780943126064480786
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Jun 2026 11:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=bem/r3MW;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HUwzjTGVSYe7jv+wY0nvZ1TczYi3gCp9jPfCHAzFSNU=; b=bem/r3MWEn/OZ4vJO9j35ruK90
	5O6UfGH/cJSdWiWKZFWt2DJK1WGooUwfh5ywddbeN4yUIJYo0+xokV7VIQK6MbxRQfp0Eymz2AcK5
	8ZU3AEt/3B9hp1ifbv2a0nMgOEN2wmA9FnFoMHMW73cwPhWVBW7HHakFwN0/zb7FGHQ51zGJK58VL
	N8z27l73r0QS5/NYf8oVaWmSDEVCI9x1Eh2HxKp8U3NY4dncoy4K/sWfSfT9wwudTReZuE+vBGrj2
	6fyWl7r/CWadZxDPYe8cAE/KeHYVjH0+wNUQHvDMRrwdTXECyILFthw8Tkyv2ST8ISr2pvF/u+tYc
	X4lq9hQA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:57702 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wWef4-000000049kS-2JWn
	for docs@lists.yoctoproject.org;
	Mon, 08 Jun 2026 14:25:23 -0400
Date: Mon, 8 Jun 2026 14:25:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: correct example of "bitbake-layers"
Message-ID: <afa37918-28f2-c2a9-f311-0ce6f9f160ea@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 08 Jun 2026 18:25:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9631


By default, "bitbake-layers" creates layer in current directory,
not home directory.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index b7624cf0e..b8842012e 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -59,7 +59,7 @@ Follow these general steps to create your layer without using tools:
    configuration.

    As an example, the following command creates a layer named ``meta-scottrif``
-   in your home directory:
+   in your current directory:

    .. code-block:: console


