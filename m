Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02C5CD37BE
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 16:31:32 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54617.1778517088342865754
 for <docs@lists.yoctoproject.org>;
 Mon, 11 May 2026 09:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=lTbJtZ9x;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=X/Eg4SYjOSIaqM5MLYxj/4kSo9tUEJi/u5GnqU/umWc=; b=lTbJtZ9xO8va6OP54rnjYQGagW
	bGNr56CqlSQOtbMYOsy6z+QGz2RYhv/YAmHN2TzfTf73+yQ5JbpMan6SerXa4TDFzLwDlwBlHftoh
	TCtI7+EkGlzKLguJuEEVRqz3F7brpqU4S1IWq1yQd2cWVV4QOMPSW8QWuJjnb3ViDykFyGx7ckkAX
	WjWFmbXaIWclzGa2jPwu2ElWEYMBgpw+S2Y9MUOEAvAtplbIJ9eJSX3kbOWxts2dhevBD+PLfVCGg
	9bjdkIGRapNVXs6V2tKCk+Qj1OKPaTvNvR5iU7jIfZO0ua4XTt9fisTdCdWAYpx6cbAQYvcKtVmr/
	Iae0vHUw==;
Received: from [147.129.179.166] (port=33828 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wMTXP-00000005GuD-3yPI
	for docs@lists.yoctoproject.org;
	Mon, 11 May 2026 12:31:26 -0400
Date: Mon, 11 May 2026 12:34:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] index.rst: correct "Software Overview" link to point to
 newer page
Message-ID: <c6015c16-8033-8e1f-d84a-7b6ba4359e89@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 11 May 2026 16:31:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9452


Once upon a time, the docs page "Yocto Project Software Overview" link
used to point to an appropriately-named URL,
"www.yoctoproject.org/software-overview." These days, following that
link redirects to
https://www.yoctoproject.org/development/technical-overview/, a page
with the title "Technical Overview" which does not match the name of
the link.

Change the link name and underlying URL to match the current
destination page.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/index.rst b/documentation/index.rst
index 7d933acc0..46b775711 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -17,7 +17,7 @@ Welcome to the Yocto Project Documentation
    Quick Build <brief-yoctoprojectqs/index>
    what-i-wish-id-known
    transitioning-to-a-custom-environment
-   Yocto Project Software Overview <https://www.yoctoproject.org/software-overview/>
+   Yocto Project Technical Overview <https://www.yoctoproject.org/development/technical-overview/>
    Tips and Tricks Wiki <https://wiki.yoctoproject.org/wiki/TipsAndTricks>

 .. toctree::

