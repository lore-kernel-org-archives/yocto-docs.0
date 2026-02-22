Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D9FC636C2
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 21:45:01 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22618.1771796693917479967
 for <docs@lists.yoctoproject.org>;
 Sun, 22 Feb 2026 13:44:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ADYHwnrn;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=K7zqFLXw+osJx5X3sw2JY1DVfXY3ufOGg5FxvvDHCQo=; b=ADYHwnrnqIg9vcL/Fb5BMCzYEs
	mXjXclFMn2srymHsqeKMZh+Gpy6fNhcMGHJ8/mxQne9kG76DYtzdHjpxzI1WuUYYd7y1pPdieAfnW
	nU4nGjrLZlHzyea8LrIYSD51wXfDxXz+T9Rf1eGdL9twnzoHyxSxpuJqMv/IudZMer1mUFHYFGzcR
	X5HZhsiIWBmvvyB+rf185s/yScF9mxPBpp0roByDscgBP1zDYC+aTrLT/+5qdacgYHQ+zECObYGrm
	0u7tY4NU1LdxcTy+UhVoMso41qLd98gwocx1p36AzvojUPW/dfzNzhThGmQcyOP0TeNUVmtsISRQK
	bUs+4Asg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:41022 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vuHFz-00000002XdZ-2icP
	for docs@lists.yoctoproject.org;
	Sun, 22 Feb 2026 16:44:52 -0500
Date: Sun, 22 Feb 2026 16:47:02 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: difference between RRECOMMENDS and RSUGGESTS?
Message-ID: <5196619c-a6b5-a5a6-42fd-eb78308e8ffc@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Sun, 22 Feb 2026 21:45:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8949


  the explanation for RSUGGESTS:

https://docs.yoctoproject.org/ref-manual/variables.html#term-RSUGGESTS

does not seem to explain how it differs from RRECOMMENDS:

https://docs.yoctoproject.org/ref-manual/variables.html#term-RRECOMMENDS

  what is the distinction between suggesting and recommending?

rday


