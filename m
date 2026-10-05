Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E2DCA5FCE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 19:16:25 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28243.1791227782464731818
 for <docs@lists.yoctoproject.org>;
 Mon, 05 Oct 2026 12:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=PkQRW4qO;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=s3QMAK9s17oM7I89QGXvXT/x1R+w5J7CJt2AN6URScA=; b=PkQRW4qOunPUlelLm6lZmQoGEa
	jatpcY/Yxv58/0iFnOe31aPoytF0S7jhgG/WnYmi6IUDGjev1oE3yFJYwyOONLEPtabnz6LT85Z8A
	fS08YFJvFLoiD/3GGabdebVSckjZ0eKfRkMREpiNhqD42dQbi/7t2/XasHJLG/9Ci5PGkvEnvxecX
	9jxkiB9RYeyPBQLUCGaamjDGGp+0Md5H8DuBsGK7fxRhaOPU7ZnWhuYUt2KkLorMrJ62k3T7j1FKw
	vJX4qp2wbiEQxmL3bkfBgsfQAceH3QOuVO3VMRVIKwEt9L8V8PN+nz86my4NXAS5OLsxpxxnsr3B8
	4Qd+besA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:39564 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1xDoAd-0000000Coib-2ko3
	for docs@lists.yoctoproject.org;
	Mon, 05 Oct 2026 15:16:20 -0400
Date: Mon, 5 Oct 2026 15:13:44 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: what's the proper nomenclature for .wks versus .wks.in files?
Message-ID: <8db48114-8ca0-ce5b-dc6f-4e704ba05caf@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Mon, 05 Oct 2026 19:16:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10655


  i was going to submit a patch to distinguish between those two
wic-related files, but i see inconsistent naming online, so is it
reasonable to say:

  ".wks" files are wic kickstart files

  ".wks.in" files are wic template files?

rday

