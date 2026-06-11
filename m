Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35ED8CD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 15:34:53 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48991.1781192082916258923
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Jun 2026 08:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=nJWax+dc;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4yHS2t888Izob7cjGU7t3hqAiDa2/7UN0Y8otc8Usao=; b=nJWax+dc0ev6DY6veD/fgPt2ZY
	LORuLXCw/btJCyqU1ooLcIANoIPLCPtuRTS3XmPC6Z7+mGdXBO/o6iNUwFLGFafQJ/kw34pHRXBEK
	Bh6ijNv17+TlHGyVa7uBxmanUNsrzb9LFeNgi25rIU6i6rtfq27Srth+viw8vat8SNSraYI5bJptw
	6uaYYCziHbdf1p28DoHkQxS5WzXhIR576UzB7ryOew3jik4qZR/ml8S/DC9VWpFT0DFHH5y6uoW6k
	bUB+l4o0xOqgDJmxE78FnE/fn0qvutA6dTo/kK6NHPG6J9wBmU45IYXYOeeur5G2XGQviUNVGsziC
	lza9YI2w==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:46476 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wXhQV-0000000Bw94-0cqe
	for docs@lists.yoctoproject.org;
	Thu, 11 Jun 2026 11:34:40 -0400
Date: Thu, 11 Jun 2026 11:34:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH v2] dev-manual: mention that "bmap-tools" is transitional
 package
Message-ID: <79fecd83-e402-c49f-ef11-ea4024ed77e8@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 11 Jun 2026 15:34:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9697


For modern Debian and Ubuntu releases, mention that the "bmap-tools"
package is transitional to the newer "bmaptool" package.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  sorry about the earlier typo in the subject line

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

