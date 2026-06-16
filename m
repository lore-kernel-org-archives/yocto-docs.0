Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 468C9CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 11:15:27 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.151641.1781608520517559092
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 04:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=C0L77wHN;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+RErXorv8Pfa1llLqK8JEpGI1pWNnOs/vBcgIakzTAk=; b=C0L77wHNPLEGsRV+udX/0Tpf6I
	Jd65FTYagduEJsDYxK781rlqOqeR45TvlVnYd4IIXk/WM9rqxO3UEie6JYJaLsZFhM2DJpreAEebx
	pqqohAGIxTabqVgIeWAT06ZAdD59QJ6qoYabqpzU03OX8vvdh20JRB9dwd6Qn07NIs/+1biLHZhbu
	AGYEERIHOJCXLkUAEnK4/wtqD18jTMm2YzZQNqD341ILR+6HI9ey/CTVpj+3d2RaMS3wRBOtBOEy7
	MclPCyZCjKIHo38oU61H1NEqHA2eHxLAzmzG7il3xRFzcJjshnj/iResuhIfPyXJcBDxENCo3pGdb
	RenU/d/w==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:40230 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wZRlF-00000006maC-3wLw
	for docs@lists.yoctoproject.org;
	Tue, 16 Jun 2026 07:15:18 -0400
Date: Tue, 16 Jun 2026 07:15:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: add note explaining OE will identify missing
 packages
Message-ID: <0abc41e2-cf58-a97f-a3fb-711493c5686f@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 16 Jun 2026 11:15:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9732


Add a note explaining that, if any required host tools are not
installed on the build host, doing a build will let the developer know
what they still need to install.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 5171ca6ba..829b88293 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -160,6 +160,17 @@ large when covering all build scenarios using the Yocto Project. This
 section describes required packages according to Linux distribution and
 function.

+.. note::
+
+   If you don't have all of the required build packages as described below,
+   trying to build will almost certainly generate an error message similar to::
+
+      ERROR: The following required tools (as specified by HOSTTOOLS) appear
+      to be unavailable in PATH, please install them in order to proceed:
+        gawk
+
+   to let you know what's missing.
+
 .. _ubuntu-packages:

 Ubuntu and Debian

