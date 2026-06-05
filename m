Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379C1CD6E5D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 11:40:38 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6160.1780659628583476051
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 04:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=CSESfR35;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ey+6QaPfrgswhxlSk55K2uG9m6nxnNIlzlkj+WBvYJE=; b=CSESfR35l6p1rQDn8X7VDPy5hx
	v6hSf+A9SydQHCZAmqooWxMTNVyMSKQRuSc2HtFJ9SvwxqKGW3SA3EGl2LR5Zu7AR8AGriNw6kmHT
	LmY2v/XNd35MYI0kSsTnHqxKzYveALkUQi8yNvdhWNI3qbq0ixboiz1LYMGPsP0oW95y2PHXV9p9S
	5/h5XD9J36Mnf66IE2q9eucOi5AJLpg1Rhx8Vx8b1ddHSzna6uFOKdaJJxpxjZyEirVHo/hZ4tAQk
	Dz/29KXcPrjEXiBIGAs9bHomX3TO2Yc6uVt1DRAshJ79ugNovfqamIKeU657gFrk8lhD+52+pFulx
	84YVCicQ==;
Received: from [147.129.179.166] (port=49014 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wVSuV-0000000DYKY-3n82
	for docs@lists.yoctoproject.org;
	Fri, 05 Jun 2026 07:40:27 -0400
Date: Fri, 5 Jun 2026 07:40:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: "Required Variables" aren't really "required"
Message-ID: <8571c31b-3d25-c00c-df7a-68b61c48cb63@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 11:40:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9586


here:

https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#required-variables

the section "Required Variables" goes on to say that four variables
"should" be included in all recipes ("should" does not equal "must"),
but a quick test build showed that none of those four variables seemed
to be required for successful parsing -- only a missing "LICENSE"
triggered a parse error during my testing.

rday

