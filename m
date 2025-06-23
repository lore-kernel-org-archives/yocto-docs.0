Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB45C7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 17:41:20 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.1224.1750700470373419167
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 10:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=nbfCWH+4;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=d/lMZ07MtJ4j5FSFxcXth1/Dkq73HnosZp7iDyiiPOg=; b=nbfCWH+4suWxql+SCkhE9LjvYt
	LZO8vgAgPKa5x93Gn7Y5qXEKRcpW/r4VbXoS+8m9IftYqTqxTAQAxMlBA/56mXQjJyMfIj2xb7coG
	R5ch1sKdHFLn4wXay1pa/RlijA9xtUolhUucPihg94d68hHa8qpTzQSwt2KBNcTZ/8jBqcNPuC+cd
	aAnXEI6udJvRSgcP0APD17j0J0uYAWfjOTxZVicBAGZkgMs4R28fDFkzfPGcSEu4kFLIPkAF2CEZz
	kr0JlNl0WZJv0N7n5gTOfpVfn5OLrp2WymW+cyFFyY22Yh1kH0N0Py9NMAsR0cGZIENQhQojRbBD9
	dxYYLymw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:44506 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uTlAH-0000000BlAX-1HDl
	for docs@lists.yoctoproject.org;
	Mon, 23 Jun 2025 13:41:09 -0400
Date: Mon, 23 Jun 2025 13:40:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: show bin_package example wireless-regdb recipe
Message-ID: <0639bb4b-2e1c-2dde-098d-ac99d62bb646@crashcourse.ca>
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 17:41:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7172


Add a snippet from the wireless-regdb recipe to demonstrate a simple
example of a bin_package recipe.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index c49881efe..2d7a7efdf 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -1397,6 +1397,26 @@ doing the following:
    where you have installed them and whether those files are in
    different locations than the defaults.

+As a basic example of a :ref:`ref-classes-bin-package`-style recipe, consider
+this snippet from the
+:oe_git:`wireless-regdb </openembedded-core/tree/meta/recipes-kernel/wireless-regdb>`
+recipe file, which fetches a single tarball of binary content and manually
+installs with no need for any configuration or compilation::
+
+   SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
+   SRC_URI[sha256sum] = "57f8e7721cf5a880c13ae0c202edbb21092a060d45f9e9c59bcd2a8272bfa456"
+
+   inherit bin_package allarch
+
+   do_install() {
+       install -d -m0755 ${D}${nonarch_libdir}/crda
+       install -d -m0755 ${D}${sysconfdir}/wireless-regdb/pubkeys
+       install -m 0644 regulatory.bin ${D}${nonarch_libdir}/crda/regulatory.bin
+       install -m 0644 wens.key.pub.pem ${D}${sysconfdir}/wireless-regdb/pubkeys/wens.key.pub.pem
+       install -m 0644 -D regulatory.db ${D}${nonarch_base_libdir}/firmware/regulatory.db
+       install -m 0644 regulatory.db.p7s ${D}${nonarch_base_libdir}/firmware/regulatory.db.p7s
+   }
+
 Following Recipe Style Guidelines
 =================================


