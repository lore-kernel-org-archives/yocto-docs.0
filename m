Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E286CD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:06:10 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46560.1778493959369164822
 for <docs@lists.yoctoproject.org>;
 Mon, 11 May 2026 03:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=sTMQihSL;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oinyPfro5/6EWnHQ1jolXmuvQaw1w/3Ob5qHYDbb1l0=; b=sTMQihSLzq7AOg/vl13sILO2nf
	/M1Q2s+ToHZLHIenGFZ+uSrBqhPfaAcs0AkwOBf3aF1nscj1sNfPuqZWUm8jCjHXiV19QS/gvN8Sx
	GEcwsHsNLNVU+vVTbvrOOo7Svrur9kAU/k3qukMdBaHYy9Y8IiRmYIGWYL8DdjZJYcIKkZxwWakeF
	dK2PcxW/blKScpZX5ovml1pZo+vyFNrQRItRiOtNjh8gbewvJzRF69F1nvhCUBv+0amHgY6CaX0Jg
	KtgBup9rkDlV59VdASgCA4KujdEQaQ4tp8lqTCEJGoZNS6DtUKvsVOIBCDTiCxXcgY10zIvHfnpZ/
	OIQQotkA==;
Received: from [147.129.179.166] (port=33660 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wMNWP-00000004Tj4-05q1
	for docs@lists.yoctoproject.org;
	Mon, 11 May 2026 06:05:57 -0400
Date: Mon, 11 May 2026 06:08:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: replace "naive" with "simple"
Message-ID: <20217fb6-04ea-6f25-37fa-5cdd6d62a92f@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 11 May 2026 10:06:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9442


Replace the word "naive" as it potentially comes across as a bit
patronizing.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/ubuntu-debian-host-packages-nodocs.rst b/documentation/ref-manual/ubuntu-debian-host-packages-nodocs.rst
index 99a1ffdd7..1c99a9e35 100644
--- a/documentation/ref-manual/ubuntu-debian-host-packages-nodocs.rst
+++ b/documentation/ref-manual/ubuntu-debian-host-packages-nodocs.rst
@@ -18,7 +18,7 @@ If this is not the case, you can reconfigure the ``locales`` package to add it
    -  If you are not in an interactive shell, ``dpkg-reconfigure`` will
       not work as expected. To add the locale you will need to edit
       ``/etc/locale.gen`` file to add/uncomment the ``en_US.UTF-8`` locale.
-      A naive way to do this as root is::
+      A simple way to do this as root is::

          $ echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
          $ locale-gen

