Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5B2CF34C3
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 14:54:07 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8837.1763564045882343237
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 06:54:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=UZP4Hj3x;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HCD222xFN1ICD/AD2XtshcBV43MG5/a+kR+R5D2G7X0=; b=UZP4Hj3x5dCIoF8scE4++Pscis
	te5Z0M1gr/zIQsI7pTyAJLOFPkTuCPj/wCHaw0LRlQr7uN+RMT7Juvxan/yP12+CHT3PKDGdr262Z
	1aNsEV686YBUBAg9V8tMlD2mtRihv6XN+gc2G/Y+egS+ErstysTrnFhyMQdPlaJ9Jwn2MZtfPwcuZ
	yrOIfhCiBJy8C6fASEbbZQWlfTAF2LHfykPiaW3fbmWfDrOdn/4o/WHTVzjR+C2h3M0L9vbjEVbIB
	adw1/dAL6WPYciZZGQPAb6xhQ9SIiXDG4oUzDbNCjGBsnkvdIC0AMUCeSLhrYf5Sf0LR8h1akka8z
	6dbYlMMw==;
Received: from [147.129.179.166] (port=37362 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vLjZJ-00000003NGk-1jU6;
	Wed, 19 Nov 2025 09:54:04 -0500
Date: Wed, 19 Nov 2025 09:54:37 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Antonin Godard <antonin.godard@bootlin.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] why is "bitbake-setup list" trying to create a bitbake-builds
 directory?
In-Reply-To: <DECR8E8M61T3.3GNZSISKZE9P@bootlin.com>
Message-ID: <3ff38c7e-e0a6-337f-1f80-be446e4cc93c@crashcourse.ca>
References: <dc857b9f-0da4-25f4-6cdd-14a60cb8b179@crashcourse.ca> <DECR8E8M61T3.3GNZSISKZE9P@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 14:54:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8090

On Wed, 19 Nov 2025, Antonin Godard wrote:

> Hi,
>
> The docs list is likely not the right place to report bitbake-setup bugs. Can
> you send this to bitbake-devel@lists.openembedded.org so this can get proper
> attention?

  yeah, i realized that just after i hit ENTER. my bad.

rday

