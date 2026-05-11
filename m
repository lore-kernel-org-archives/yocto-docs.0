Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B09CD37B9
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 11:08:00 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47431.1778497674385417877
 for <docs@lists.yoctoproject.org>;
 Mon, 11 May 2026 04:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=OrVwJom9;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hqeIcIsy2FZiAY7BW2Yly9z9FNhtrB6EoyaBT4A3FQo=; b=OrVwJom9VPf09aey4GEW75XE0e
	6wLV9wSFbY5YR73ZvvA8OayEfwHraBCBign/tCy50gy/nvTR9ZWmOZPFEFPi3LDbt39S51HZLWwAL
	YpTgS60xReIHjvjXe4ZQM0IdOt4sna4qqjqmYfBMdRYILd+wSIEB4dW/5jWXSRYOUvB2Py+2jAb9p
	eU/oXZmaQai4+j2mm0WnuDF8CED4OWFECwRpRgt/SytFtex3H2qnRy8ADo1cTRKNVtx/TM8y4MSEm
	RxpVIwNNujzgLB1j4iHE6n0ba8YMoj1xk8+B5lxrXWgQPV5ThuuthZ7eL0zaKqcMUF8OgM2jB+rqs
	aeDGeJeA==;
Received: from [147.129.179.166] (port=36640 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wMOUJ-00000004aiJ-38vt
	for docs@lists.yoctoproject.org;
	Mon, 11 May 2026 07:07:52 -0400
Date: Mon, 11 May 2026 07:10:48 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] what-i-wish-id-known.rst: add Git capitalization and grammar
 tweaks
Message-ID: <78481dfe-2916-0f38-7994-dd50fd4ee21c@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 11 May 2026 11:07:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9447


Tweaks:

  - use proper capitalization for "Git"
  - various grammar adjustments in basic skills list

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  i'm submitting this as a new patch and not as a "V2" because it's
sufficiently different from the first one.

  also leaving out the "Software Overview" link update.


diff --git a/documentation/what-i-wish-id-known.rst b/documentation/what-i-wish-id-known.rst
index bdb9e492e..34fdca122 100644
--- a/documentation/what-i-wish-id-known.rst
+++ b/documentation/what-i-wish-id-known.rst
@@ -22,8 +22,8 @@ known before embarking on their first build with Yocto Project. Feel free to
 contact us with other suggestions.

 #. **Use Git, not the tarball download:**
-   If you use git the software will be automatically updated with bug updates
-   because of how git works. If you download the tarball instead, you will need
+   If you use Git, the software will be automatically updated with bug updates
+   because of how Git works. If you download the tarball instead, you will need
    to be responsible for your own updates.

 #. **Get to know the layer index:**
@@ -166,23 +166,23 @@ contact us with other suggestions.

    * deal with corporate proxies
    * add a package to an image
-   * understand the difference between a recipe and package
-   * build a package by itself and why that's useful
-   * find out what packages are created by a recipe
+   * understand the difference between a recipe and a package
+   * build an individual package and understand why that's useful
+   * identify which packages are created by a recipe
    * find out what files are in a package
    * find out what files are in an image
-   * add an ssh server to an image (enable transferring of files to target)
-   * know the anatomy of a recipe
+   * add an SSH server to an image (to enable transfer of files to target)
+   * understand the anatomy of a recipe
    * know how to create and use layers
    * find recipes (with the :oe_layerindex:`OpenEmbedded Layer index <>`)
-   * understand difference between machine and distro settings
+   * understand the difference between machine and distro settings
    * find and use the right BSP (machine) for your hardware
    * find examples of distro features and know where to set them
-   * understanding the task pipeline and executing individual tasks
+   * understand the task pipeline and executing individual tasks
    * understand devtool and how it simplifies your workflow
    * improve build speeds with shared downloads and shared state cache
    * generate and understand a dependency graph
-   * generate and understand BitBake environment
+   * generate and understand the BitBake environment
    * build an Extensible SDK for applications development

 #. **Depending on what you primary interests are with the Yocto Project, you

