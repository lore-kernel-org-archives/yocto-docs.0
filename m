Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA71CF31B5
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 12:08:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5426.1763554099642296005
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 04:08:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=bo8ckSmA;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kuN80abXnBSAVUmkv8PHF9KcBzopTH35dHOwSNu39/k=; b=bo8ckSmAAq6nenDODnfiWaeKbQ
	pXpax9LcWvbs8sHuCUsnY1kzaQi1ICxK+J0rKi0JVFSPp6SiSvvSjrN0fOw/jKLziPBjg16vKmqQZ
	btpiheIYL6rrOcxiVbF7SKZzQBwdaE0lwRCbH4AnBr3uciff43LcL1uNpTWe+wVlKONlL6z3atSZM
	2zxnGnBcUzjY2qrKaF1Nque+4CVfHE3U4aTnjueCOMZOUKJfYliOZ+aadEqGCsAiCdS2fvH+47q3U
	QdfnAoAGJ2f9dDpF6WJpW7myt9+9/Z+KHeF3161DzIEnjn4S4GL60uHORWbQNlo4qviYIb6WSyid5
	0tJXL7kg==;
Received: from [147.129.179.166] (port=58332 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vLgyt-00000002xtV-1KPC
	for docs@lists.yoctoproject.org;
	Wed, 19 Nov 2025 07:08:18 -0500
Date: Wed, 19 Nov 2025 07:08:54 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] Quick Build Guide: Rephrase section title for clarity.
Message-ID: <5713d6f0-643a-2a73-008f-9be0953a7310@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 12:08:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8080


The section title "Use Git to Clone bitbake-setup" is potentially
misleading as it seems to suggest that one will clone a repository
named "bitbake-setup"; rephrase to make it clear that one is cloning
simply the "bitbake" repository.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 211b6d70f..52bc40b32 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -87,13 +87,13 @@ distribution:
    see the :ref:`ref-manual/system-requirements:required packages for the build host`
    section in the Yocto Project Reference Manual.

-Use Git to Clone bitbake-setup
-==============================
+Clone bitbake repositiory to get bitbake-setup
+==============================================

 Once you complete the setup instructions for your machine, you need to
 get a copy of the ``bitbake-setup`` tool to setup the :term:`Poky` reference
 distribution on your build host. Use the following commands to clone
-the bitbake repository.
+the bitbake repository, which provides the ``bitbake-setup`` command.

 .. code-block:: shell



