Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5890C88E53
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 18:24:37 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46226.1789151068026492963
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 11:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=TOuqZtZs;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XSYp+k+8Zi1RlCgVT0o0IFaMtt/U/uLAOG0HL7g9Jpo=; b=TOuqZtZs+sl21c3xf2iyQU3KYu
	7n3VU+Gvue5enC0wl0mjKgEYJXBcEaIu7LO02skTWt6dcKmgEN46sFufZk9TrnxZACsCPn11nB9Cl
	H56XtJmQX7sbyKQWAzdw3caenDLBJcvLjVAJ6mtoGmIQVG2+39Lc+uK+/PfaboBvq0sl/Lm7Jr+4Z
	9O7sL8/DFYhqipA10olUB2gxiaMdBgaPVOCH3C1MA39fq9lvALHLOXF52zzRUKqQghhm8niXCgQQE
	fIZ1yarYR5P4FfCK2/wOTyGcnLiERdo/cs6gHDb9c89oz8Zi6mdnLi50c3bEt/JTdDuMVAvjMP/S9
	G0O6BTfw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:53440 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1x55vF-00000003qzP-3D65
	for docs@lists.yoctoproject.org;
	Fri, 11 Sep 2026 14:24:26 -0400
Date: Fri, 11 Sep 2026 14:22:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: "Distribution Support" wiki page is wildly out of date
Message-ID: <d5376209-e434-a25a-a2af-2e35a63d905c@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 18:24:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10480


here:

https://docs.yoctoproject.org/dev/dev-manual/start.html#setting-up-a-native-linux-host

point 1 refers the reader to the very old:

https://wiki.yoctoproject.org/wiki/Distribution_Support

should that wiki page be updated, or should the link be quietly
dropped? more generally, should the official docs refer to YP wiki
pages if those wiki pages are not actively maintained?

rday

