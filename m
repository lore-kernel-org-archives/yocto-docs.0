Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3BACD98F7
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 12:34:38 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18399.1781786077773911414
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Jun 2026 05:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=FjnY6JSp;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Kl1nqx0oFomEG9CyhbLQ7llsrIeVT/xsM/bcb7r0ldE=; b=FjnY6JSpoYxkA5KbxJzsWXEMNF
	J5FuZgeC5irLRMQkLer1YiNwdi+UW+dZX2QWn9sXgsWySjwVv2Z2ClJc+nKmhUiXmZLOeDhnXhCgh
	wTYepYZ8rpfeEkbdh+hS8y9/xbsCsd3NhKkuq2/gqDlhOKzoQPRK++Vmcp5xdBzodz6pNZ6K2ITGS
	EjAWtLvLjwvYIe/20bEQz4CTLpD4ywvhAAtqNUyWSFLWyQdjbPOuQy7xNquWeez8xXxCCErpavab5
	0DcP/a5PmWFy5ly4BIgVQYvOfoHMCjl5LD8bohi6E+WmawopqeJsgFC3Digev001iqKPCUnY5ZAsm
	dPZMFVHw==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:51832 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1waBx5-000000009yT-2glR
	for docs@lists.yoctoproject.org;
	Thu, 18 Jun 2026 08:34:36 -0400
Date: Thu, 18 Jun 2026 08:34:29 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] ref-manual: explain default value used for SUMMARY
Message-ID: <9e54454f-72b1-06e6-b271-7a14647af536@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 18 Jun 2026 12:34:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9779


Explain that if you do not set a value for the SUMMARY variable in a
recipe file, that will generate a warning and that variable will be
set to a default value from the meta/conf/bitbake.conf file.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index df3666f1c..dc11ea326 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10350,6 +10350,10 @@ system and gives an overview of their function and contents.
       :term:`DESCRIPTION` variable if :term:`DESCRIPTION` is
       not set in the recipe.

+      If you don't set this variable in your recipe file, you will be warned
+      about that and it will be set to a default value from the
+      :oecore_path:`meta/conf/bitbake.conf` file.
+
    :term:`SVNDIR`
       The directory in which files checked out of a Subversion system are
       stored.

