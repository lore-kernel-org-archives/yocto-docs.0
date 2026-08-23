Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB719C5DF81
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 20:23:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3041.1787516599716620621
 for <docs@lists.yoctoproject.org>;
 Sun, 23 Aug 2026 13:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=xUGcsa8u;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Hky8+1uNii+slQioFyppDnnOMYY4yJqQ+8Xj9r1cYp0=; b=xUGcsa8ujm9yIiKOlBMK1Kqtq9
	q6dXB+JlMFpbZDOxOQGAZQd5YjV8AKj4bK3K7EEdR+Zeit68Yuo8GM766gG6oNTUloA0yCEp++Y+1
	ewOcesvQlVJLIYc1HaZnR/xh3uciB9ynIdEnqjawumAN6zS6J90ErLnfSlC62GWeLtt948BDXdVwL
	TRdlVwkILYoJnRIa+JJTyiXNfCa/Wl5kuCGlwXuyC1gV3DyiwVYR/9zmHYq8R44RTigSpyBpSn8Mp
	L/T8cJ75tUe2AuaF2nAbBD9Chyx8coci0G4F9DUfdSGv3a71LI/EJkb48QTDXlcGiFpmO3I0eUZ9N
	dU//ep1g==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:54460 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wyEir-000000090pt-2mic
	for docs@lists.yoctoproject.org;
	Sun, 23 Aug 2026 16:23:18 -0400
Date: Sun, 23 Aug 2026 16:21:37 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] what implements the "copy" button in YP docs code
 blocks?
In-Reply-To: <18CE867D2FEE16A2.510612@lists.yoctoproject.org>
Message-ID: <6a1b8766-e89b-c116-9618-65c51f58f5be@crashcourse.ca>
References: <18CE867D2FEE16A2.510612@lists.yoctoproject.org>
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
 <docs@lists.yoctoproject.org>; Sun, 23 Aug 2026 20:23:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10322

On Sun, 23 Aug 2026, Robert P. J. Day wrote:

>
>   perusing another sphinx code base and want to add the YP-common
> feature of, in code blocks. the ability to copy the command (while
> leaving behind the '$' prompt).
>
>   is that all provided by a simple "code-block", or is there some
> special extra config to get that?

  duh ... never mind, "sphinx-copybutton" extension.

rday

