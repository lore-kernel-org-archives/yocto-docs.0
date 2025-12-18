Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145E0D6D22A
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 14:01:25 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42568.1766066479700605592
 for <docs@lists.yoctoproject.org>;
 Thu, 18 Dec 2025 06:01:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ByAM0L1y;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dPxBS03lzyCBj/mC70QFvZDe/1H2+ls70H7NNc1PgOM=; b=ByAM0L1ywRJTmIrtUgERKKAVFQ
	3CXzi8UcSkVXbKn+C5Ck/3p5ZCgI0LXSuYt2dnIFuE6a3ll/M5xtgAcfRhieO8EweneIp7y1J8pWO
	IffxmrWLGV5lVgF8crwlXwVkA34At/Pcq8GYET8L7Oa0IS+oyh3+tdtBasc7H60i/SgQ+ridydpmz
	cGC6RBrmyLJE8H+zhW66KC/htBubfhMRCA8dYxZsMCn7Fm3tJLvZFwb+Ah3twiAvtLbpqSjHMR0tg
	euXmRyEaP+fkx+XBV21uozIrliK+WWOEbqGzfCDZk6IN8TuPWcvMvhdPuf3vdhpey3B4xQH8kH5P7
	hjHzRnVw==;
Received: from [147.129.179.166] (port=57958 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vWEZB-0000000ETlr-3uDB
	for docs@lists.yoctoproject.org;
	Thu, 18 Dec 2025 09:01:18 -0500
Date: Thu, 18 Dec 2025 09:03:21 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: significance of leading slash in BBMASK examples?
Message-ID: <3b9d5e4b-700a-5d75-d29a-dea8b8ddea9d@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 18 Dec 2025 14:01:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8303


here:

  https://docs.yoctoproject.org/ref-manual/variables.html#term-BBMASK

the first sample usage of BBMASK does not include a leading slash:

  BBMASK = "meta-ti/recipes-misc/"

while the next few examples do:

  BBMASK += "/meta-ti/recipes-misc/ meta-ti/recipes-ti/packagegroup/"
  BBMASK += "/meta-oe/recipes-support/"
  BBMASK += "/meta-foo/.*/openldap"

that section doesn't really clarify whether that leading slash
is significant.

rday

