Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA64CDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 10:32:12 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17746.1782210726577964960
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 03:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=QEQkgOdM;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sQKIEtt+oNoLcUHqqJTozh0YzLSqhuTTN45000z0LrE=; b=QEQkgOdMlhdc427ZY3N/kB5Tnc
	Ja5ywR31YDrj8F6pzGlqK3OYyDO6Tlj4gX6stieuxwLLROlBnQXLgOiiIc7tT4D5luXxzlCJtfwVo
	tW3dJJL28lU+qX1zYga4ODofb/i2ku+9U0rOsRFDZVVLYdEcP6nXtYS30Sd2sBUe9RC9gEJ3r7y8C
	tv3OEYDxoDX6kMwoxZ2ugXWEfkcoFDDIrNcvoT+zLD72f07uwqxG1alipcqWl/VXn5TJMhQ2Gjrb1
	5g1iDA9w92XuGBszJZJwa1+pc2huaMF5UVke5eT6QaZOT82Gi1+qLxs5gPpl4UgaHbkXd2jSpCGsh
	WdkfbIWA==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:40468 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wbyQF-0000000CiZG-0Pqd
	for docs@lists.yoctoproject.org;
	Tue, 23 Jun 2026 06:32:05 -0400
Date: Tue, 23 Jun 2026 06:31:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: mention bitbake-layers "--example-recipe-version"
 option
Message-ID: <c026a42d-9987-5c77-7249-2d906475265c@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Tue, 23 Jun 2026 10:32:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9840


Since the Layers section mentions the "bitbake-layers create-layer"
"--example-recipe-name" option, it's only fair to document
"--example-recipe-version" as well.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index dab1d2316..dc63478a3 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -149,8 +149,8 @@ Follow these general steps to create your layer without using tools:
    of "6", you can either use the ``--priority`` option or you can edit the
    :term:`BBFILE_PRIORITY` value in the ``conf/layer.conf`` after the script
    creates it. Furthermore, if you want to give the example recipe file some
-   name other than the default, you can use the ``--example-recipe-name``
-   option.
+   name or version other than the defaults, you can use the ``--example-recipe-name``
+   and/or ``--example-recipe-version`` options.

    The easiest way to see how the ``bitbake-layers create-layer`` command
    works is to experiment with the script. You can also read the usage

