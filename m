Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED6D1C71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 10:44:32 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.5018.1750502665920965782
 for <docs@lists.yoctoproject.org>;
 Sat, 21 Jun 2025 03:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=EoxlUoCv;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=e+cVe+451UfOsCho4MUIj6gGoGaPH9wcbxfrD57TQdI=; b=EoxlUoCv03VDE0mGLoWJcK03Ba
	mGo2hv/NCsyWN7xpRnL+kyeV0FPuL2dh3GmauZYUX5uWDipycpZCAuwBbyOsFbGGetlxQCCnmcdyy
	yCbk2/ZElrI7Soql8boz+kENaSDmuy6xL952ABjAh9dSA72nQvCOI5NVsXtoEAP3zGUPsOkyMxjGk
	StxHF1pd2YMsf/XCpcpU7ly6v/79fw9mXvl/tuL8EmpuejRfPt44m0Jm36YMhjNz3Iz+ngi3rBjCA
	kO5TeLyB0PBaYeo02fM0lx0T0e90/6fTjTY9cPgLKpvrasTextMusVkbB+uPtPeElDqu5uhGR4/7T
	PtTxQLfA==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:40414 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uSvht-000000034Jx-478d
	for docs@lists.yoctoproject.org;
	Sat, 21 Jun 2025 06:44:24 -0400
Date: Sat, 21 Jun 2025 06:44:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev-manual: add real example of "bin_package"-style recipe
Message-ID: <3b0e77d9-f64b-6238-ddc1-375c082ec3f8@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sat, 21 Jun 2025 10:44:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7131


For the section on "Packaging Externally Produced Binaries," end that
section with an actual example of such a recipe from the OE code base.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index c49881efe..5dab196a8 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -1397,6 +1397,25 @@ doing the following:
    where you have installed them and whether those files are in
    different locations than the defaults.

+As a straightforward example of a ``bin_package``-style recipe, consider
+this snippet from the ``wireless-regdb`` recipe file, which fetches
+a single tarball of (architecture-independent) binary content and manually
+installs several files with no need for any configuration or compilation::
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


