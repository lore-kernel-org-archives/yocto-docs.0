Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87673C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 16:29:18 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39079.1782491353183743611
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Jun 2026 09:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=fSQPPnqo;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VNFNl/Gp12eZoLJKMrFNfxgMKPxm2tWrrIrc6CnD0Hc=; b=fSQPPnqohfaPMrz7QBEk/Avb+v
	xodHu5TOHZKEo3JPB1bqexyvp9DtcQKrxAAc3yc1IKp5h7ufH/HZqBUdeYpX3P4uzinwFgJkTBGQx
	Wm2gQz2kxZUclBc/dpykiqvS0FISKrMwid9jqHGNRcpnpjA7lb1MPc7aPV/8Bbg6YWSTKSGVmJkSN
	upI4aHXz+i+N6z81e2UYhddktWsYDVXIZCyQcMxS1eA4EhesUvOnfDPMR4q48WGKabwmL8KY8VSHy
	M9EWDXcX0gLhEuOrSv4JXal3Xw2EHW0oziXgECkBbx1dlGYs1uqi8zubt/nHWOT2R3cH+Reetleha
	jyqlJIvg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:56734 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wd9QT-00000003Sf1-1l3a
	for docs@lists.yoctoproject.org;
	Fri, 26 Jun 2026 12:29:11 -0400
Date: Fri, 26 Jun 2026 12:28:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: warn reader about confusing DEPLOYDIR and
 DEPLOY_DIR
Message-ID: <26faff6a-a213-9eac-e244-7aef097a9f33@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 26 Jun 2026 16:29:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9910


Add a couple warnings about mistaking the variables DEPLOYDIR and
DEPLOY_DIR for one another.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b4c6bc957..cd88a20e0 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2276,6 +2276,11 @@ system and gives an overview of their function and contents.
       ":ref:`overview-manual/concepts:application development sdk`" sections all in the
       Yocto Project Overview and Concepts Manual.

+      .. warning::
+
+         Do not confuse this variable with the similarly-named
+         :term:`DEPLOYDIR` variable.
+
    :term:`DEPLOY_DIR_DEB`
       Points to the area that the OpenEmbedded build system uses to place
       Debian packages that are ready to be used outside of the build
@@ -2366,6 +2371,11 @@ system and gives an overview of their function and contents.
       them into :term:`DEPLOY_DIR_IMAGE`
       afterwards.

+      .. warning::
+
+         Do not confuse this variable with the similarly-named
+         :term:`DEPLOY_DIR` variable.
+
    :term:`DESCRIPTION`
       The package description used by package managers. If not set,
       :term:`DESCRIPTION` takes the value of the :term:`SUMMARY`

