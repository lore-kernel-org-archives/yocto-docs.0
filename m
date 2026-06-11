Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053D6CD98CC
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 15:00:59 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47780.1781190052559470492
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 08:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=mMLgSqwU;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dOvXCfXT/TyWwCxVnCmaoxN+CmZKLyY6pAPh3Fsbn18=; b=mMLgSqwUxf3hsuBq+E0+IcQjak
	kP6hGosWf1946KRW7xpOtR+cSGSVeHn7kRIGZ0aDfGvp7l5VXGlAx6Jfd2PnfWu1513mLQTtnvCNC
	dxA7vPyHl7wooEq/Xzn6Cd4vE3DBwfqDkLjwDd6qX102Ggkh1dCCACgOKlKJKr8LWPHkyyTA81Upl
	e6r/ryiIOFJC/hbzE7RIJzsT3dHN9z9fm+DNPHOh0MRLMZAEN9AuI7T3WYDlfs0B1aBcAxplY1LEH
	X9qZke6B57oo7ihocBCR3Ve1lmKCT2+C2TX92gT334pee754YgcM7P0hOMqBw3z4N0jmAmZ7Kt5cK
	X4a0NTIQ==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:60742 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXgth-0000000BsO1-0Kv5
	for docs@lists.yoctoproject.org;
	Thu, 11 Jun 2026 11:00:47 -0400
Date: Thu, 11 Jun 2026 11:00:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATH] dev-manual: mention that "bmap-tools" is transitional
 package
Message-ID: <f1d0db75-5a8d-6811-51e3-6bbda146e55f@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 11 Jun 2026 15:00:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9695


For modern Debian and Ubuntu releases, mention that the "bmap-tools"
package is transitional to the newer "bmaptool" package.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  someone can decide if this is worth adding to the bmaptool section;
i can go either way.

diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-manual/bmaptool.rst
index 87162a49c..1e5ad2bba 100644
--- a/documentation/dev-manual/bmaptool.rst
+++ b/documentation/dev-manual/bmaptool.rst
@@ -24,6 +24,12 @@ system image files much faster.

          $ bitbake bmaptool-native -caddto_recipe_sysroot

+   -  Finally, in modern Ubuntu and Debian releases, the ``bmap-tools``
+      package is a transitional package; it exists solely to ensure
+      backward compatibility and smooth upgrades from older installations.
+      You can safely remove it and install the active package, ``bmaptool``,
+      which contains the actual utilities for flashing block images.
+
 Following, is an example that shows how to flash a Wic image. Realize
 that while this example uses a Wic image, you can use `bmaptool` to flash
 any type of image. Use these steps to flash an image using `bmaptool`:

