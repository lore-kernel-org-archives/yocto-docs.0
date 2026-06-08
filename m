Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E083CD8CA4
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 19:02:13 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62580.1780945327927667597
 for <docs@lists.yoctoproject.org>;
 Mon, 08 Jun 2026 12:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=qTLPb6w0;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kdSZyCHm8TyHU1U+bNhGD9yCR6CIOZlfprS3kcYk/UU=; b=qTLPb6w0onwO/AhY0n1/2iThE2
	AtFBrowrgGM8WItjnNjujEfcBc2o+gqXEPQmmoplUIxpugTxJpT3guWiYOHTo8ozLLgC7VFGEZgr/
	1DemjTUO5mz+G3mNHJx1n7E3p+NnoEPa2kGF7mV6qFpHYj77RQc4FsD1glZpVnHh8qzMePJ1OPgC1
	zu8yAcovYs9OM/f9eWc/oCAZ46wqzQ5MiZ6LcW89miHwdaEJzVhJG0fF02UfYIruEi2JVpQM9ne3K
	cviuUMo10sdn+EGuqpWApksUvncw08H/xMXI1e51BmIqA3y0/itldwCl9nkkPFFFXAm2q6UdlYf6h
	RUWnFfKg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:46308 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wWfEb-00000004Dtf-4AOq
	for docs@lists.yoctoproject.org;
	Mon, 08 Jun 2026 15:02:06 -0400
Date: Mon, 8 Jun 2026 15:01:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] dev-manual: explain how to properly call
 "bitbake-layers"
Message-ID: <73ed5f17-6d21-1a7c-9c32-e1badd3a4007@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 08 Jun 2026 19:02:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9633


Emphasize right away that calling "bitbake-layers" needs an
initialized build environment to work properly -- that does not seem
to be explained in that section.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  fix stupid typo in subject line ... sorry.

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index b7624cf0e..6d0e207fc 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -11,6 +11,12 @@ see the
 ":ref:`overview-manual/yp-intro:the yocto project layer model`"
 section in the Yocto Project Overview and Concepts Manual.

+Note well that to properly call the ``bitbake-layers`` command explained
+below, you must first initialize a build environment using your project's
+environment setup script. Without an initialized environment, your shell
+would not know where to find the command or your build configuration.
+
+
 Creating Your Own Layer
 =======================


