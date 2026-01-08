Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B02DBD1D495
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 21:34:04 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17687.1767908036891717753
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Jan 2026 13:33:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=sZxErhOV;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aQq10aOzd2pcVLrxcq9Y8gnOLOjss+PXP9405BE9as0=; b=sZxErhOVNaJM7hsNIsES3ignS7
	kcsFdqylQ8g12gjoC+5MdnRVTY87Zi/RhPWbzGg4Ua59Y1ZII21RWWvyaU5mI8MNEyQDRvJH8MBO/
	u/0G66+oeVsnNMMqckZzRc5YMadF4fcwdY6AhLlbBbAl9eNeWfKdo/Z/th9nUYfAhju6aL5hGlXdO
	FqKCJ5T4vmatid3LvrCyZQht3TnPhb+qEIbDCOGfQVP+MFBZvIkpNbP1U5o9it9Eab/6ZH5ukxuc3
	udI8FrMve0djflcFOcPVvhb9IxWoOrHQr/XrsQ4zKAOzmlCtaXRbZKCKF0exmspgmNS4FEe3oiwIL
	/fCgpotw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:50684 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vdxdi-00000002prV-1FdU
	for docs@lists.yoctoproject.org;
	Thu, 08 Jan 2026 16:33:54 -0500
Date: Thu, 8 Jan 2026 16:36:59 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: is there any way to render content in italics in a code block?
Message-ID: <5eef4c2b-95ae-cc22-b44c-a03e29982c79@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Thu, 08 Jan 2026 21:34:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8431


  one aspect of sphinx that gripes my wagger is that there does not
seem to be any easy way to tag something in italics in a code block.

here:

https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html

the code line:

 $ bitbake target

really needs the word "target" in italics to show that it's meant to
be replaced. and, no, this isn't minor nitpicking -- the whole section
on overrides desperately needs to be able to show what things a
developer is meant to replace.

  is there any way to do this?

rday

