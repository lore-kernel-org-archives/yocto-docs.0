Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C95C5DF93
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 15:51:55 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10470.1787327509877006127
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Aug 2026 08:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=b+OOzvOL;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Fa57+Q7HHyUOfSHopXka/PCLY4RfNkhdmnk200DKL+Q=; b=b+OOzvOLWJuGP/iaHDUDzoUChD
	HlZoohSIjYZ/UNU1xYD5+VAfcEjtBmZXqKAtCWf7TeddDVij9Q4TGgvQdnbTRb/rwzxeeI2RmzWnA
	BmHYXR6KHDcsLVkRzKwqUyPz5KxI/DeURBDNr71ROYIGx81aOdUrRdE8VCE/m1S+OltWEOhswlw/d
	Z6MYUmT4h2GL3bMBYTHfeTNzd5Uusr2FpdS82Amt6GTiy5XD06iiKiv06SZS2d2vTCSB7rKO4NAwf
	FYx3OELyUEdUSqFDDUJRpNW2mR97CWc+miwDgNQZxpmkysG912HE2+m2OolSeeuMfbrAoyS9IIl80
	aC/ffX/Q==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:56636 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wxRX0-000000039dt-3iRA
	for docs@lists.yoctoproject.org;
	Fri, 21 Aug 2026 11:51:48 -0400
Date: Fri, 21 Aug 2026 11:50:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] README: add references to recent security documents
Message-ID: <8ca675d0-b3b5-5602-5b0b-07099df7aff4@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 21 Aug 2026 15:51:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10314


To the list of doc folders in the README file, add the newer:

  - security-manual
  - security-reference

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/README b/documentation/README
index a3301b662..208d42358 100644
--- a/documentation/README
+++ b/documentation/README
@@ -26,6 +26,8 @@ Here the folders corresponding to individual manuals:
 * sdk-manual           - Yocto Project Software Development Kit (SDK) Developer's Guide.
 * toaster-manual       - Toaster User Manual
 * test-manual          - Yocto Project Test Environment Manual
+* security-manual      - Yocto Project Security Manual
+* security-reference   - Yocto Project Security Reference
 * migration-guides     - Yocto Project Release and Migration Notes

 Each folder is self-contained regarding content and figures.

