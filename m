Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6406CD6E74
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 17:11:15 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.710.1780593069187244605
 for <docs@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 10:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=XS3meZwd;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WIVsUEPDGnj3eYMAe+RZRDTYdONyhm/o4Difq8LWD8o=; b=XS3meZwdo182kb7RF2i34PIDkF
	vDR/E29HJmz1MQhXZRZq9QjJdoE58nt7TTwATsNOBQ3UwMnIdG3Sbn9qj7Mk5IaiiugFaabDH4l/i
	u0lyKtk3nrk2U1z44Wooes0/ngDdbbPLSmxppPdxE5iNCocAGptnEKmgkJKyYPce+cKftmToey1Bk
	olrd1t+KK2vBbCKxTv+OEgfGwsf12wr6l0F5BA3qt31UzGmSN9UAqMe/eSanWbVaFm2NtUOgYIXgK
	5ZqBJzEQetMnfd1MKlwaCgoYSHxFJ/ZvBkRZo1hlSAlE57IBJz5zI7ITWUlzBo5kGRBzq7y/lsbCK
	fRx+mzYw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:53744 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wVBb0-0000000Bg68-0jsZ
	for docs@lists.yoctoproject.org;
	Thu, 04 Jun 2026 13:11:07 -0400
Date: Thu, 4 Jun 2026 13:11:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] overview-manual: update deploy.bbclass snippet
Message-ID: <bb559e86-8f2b-03cf-cd87-4992e9f38a7a@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 04 Jun 2026 17:11:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9584


The current contents of deploy.bbclass is slightly different so update
the code snippet.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 76ace6fcf..fb9a56607 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1776,7 +1776,8 @@ adding shared state wrapping to a task is as simple as this
        sstate_setscene(d)
    }
    addtask do_deploy_setscene
-   do_deploy[dirs] = "${DEPLOYDIR} ${B}"
+   do_deploy[dirs] = "${B}"
+   do_deploy[cleandirs] = "${DEPLOYDIR}"
    do_deploy[stamp-extra-info] = "${MACHINE_ARCH}"

 The following list explains the previous example:

