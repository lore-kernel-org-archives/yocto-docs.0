Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABCFCCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 11:07:59 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18223.1762168072107540180
 for <docs@lists.yoctoproject.org>;
 Mon, 03 Nov 2025 03:07:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=bnInKglb;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0uNwiTgREin00oBpqPirL8SFxELMw58oet9Z0/gCy7w=; b=bnInKglbSwo29v++r6GYsqAgSJ
	ZHiNwyERlaDQuR48B+qym0t5RoOJmcEpa3nF3ax/lCF2O1YsB7JMK6G+0IAE8LOAnPGP5RiRS4z3X
	Sq4WKPlNrciHHv1zjQdaJRHW0IyMaNmBAFepuXPJtRIGXrYW7tQHOfFsKGQOG5oEgWpbPbTjaLJOo
	xJQqIxUpRkbJG4k3IKRumCleNoWbU7nfl97lL74Xc5T/Wd2TT0JQupLFz6htj5iSmBbQocIb1qo+j
	h6RiCeVyRedT58ZiihAqDWlCD/ezGbiYQuKXq9dFuQ1YahF7Xp/gyTKBRebSurn6UOFt+E7Ix8Ubp
	Tmy+PIpg==;
Received: from [147.129.179.166] (port=45556 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vFsPc-0000000Fmip-0NJd;
	Mon, 03 Nov 2025 06:07:50 -0500
Date: Mon, 3 Nov 2025 06:06:55 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Daniel Turull <daniel.turull@ericsson.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: RE: [docs] tweaking the cve-check documentation
In-Reply-To: <PA3PR07MB107215CBED1BB908E2AB76DE08AC7A@PA3PR07MB10721.eurprd07.prod.outlook.com>
Message-ID: <a147bf7d-b1a1-dcf8-35d9-5326ccaf1355@crashcourse.ca>
References: <2440e0a7-9f89-5fcf-f8e9-78b8c09bf7e1@crashcourse.ca> <PA3PR07MB107215CBED1BB908E2AB76DE08AC7A@PA3PR07MB10721.eurprd07.prod.outlook.com>
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
 <docs@lists.yoctoproject.org>; Mon, 03 Nov 2025 11:07:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7968

On Mon, 3 Nov 2025, Daniel Turull wrote:

> Hi,
>
> In my opinion, we could have all vulnerability related things and
> scripts in
> https://docs.yoctoproject.org/dev-manual/vulnerabilities.html#checking-for-vulnerabilities
>
> At least is where I submitted my patch for the kernel vulnerabilities.

  that would be my choice. that way, we could have individuals
volunteer to write complete and comprehensive sections on some single
topic, and reference manual stuff would just point at it
appropriately without also trying to explain it.

rday

