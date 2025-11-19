Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E0A6CF3958
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 16:28:29 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11306.1763569699517470923
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 08:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=w+qQqMQo;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yExhUEHz3a/d2F0Y5fUD4yHvJzeATGmf6LHD3qlNJMw=; b=w+qQqMQoVpdSuPkV8srLQL1ixq
	v6VIt38WxmbaRw7AegrEvn89O6qb4rNz/UlSVKy6y57FmRe4jYcxH78eh6xEcDzZ+Tke92dVNQRTn
	rfuTrTkcNGwZEym26oGXjKXybMYFFldVnq3waXZ4krPgKhiPqjD5n3+Gjz6QobLd9yIixX4CY80b8
	YyyrziKbt4te3Wo7N5JgjHQBsCGbuINg75tYNcsDCaf4D8ACV2xN0bq8g+awr75aT5OS+lgpxyT7c
	C0msy1vgN0IaDsf0sDo0vz6OiwQA3WXEltAdg/GuZYNX8ccbHrJ+P5jGFvOxvRchu1YNCeYsWK3ci
	aATypLCw==;
Received: from [147.129.179.166] (port=60032 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vLl2Q-00000003bit-2DdJ;
	Wed, 19 Nov 2025 11:28:14 -0500
Date: Wed, 19 Nov 2025 11:28:48 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] brief-yoctoprojectqs: shorten and clarify required
 host packages
In-Reply-To: <9fb855e4-3155-4e57-b9ca-34c56c0de58f@cherry.de>
Message-ID: <32fef96c-4f59-cdc8-0b34-4a8303742975@crashcourse.ca>
References: <8a97eda5-0b39-03dc-1e37-76031a747f46@crashcourse.ca> <e84a32a8-2c09-40db-9688-340e96474cb6@cherry.de> <75c51d5b-d1db-71b6-f797-80e21f5033d9@crashcourse.ca> <9fb855e4-3155-4e57-b9ca-34c56c0de58f@cherry.de>
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
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 16:28:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8096

On Wed, 19 Nov 2025, Quentin Schulz wrote:

> On 11/19/25 5:15 PM, Robert P. J. Day wrote:
> >
> >    what about "relatively recent"? that leaves a lot of wiggle room.
> >
>
> Not really. Don't forget that people can still read the documentation for
> older unsupported releases today. What is "relatively recent" today isn't
> something we supported back then and that shouldn't be something we should let
> the user be confused about.

  ok, i'll just word it as "running a supported Linux distribution",
and that is expanded on in the next section. we're not saying that
they *must* be running a supported distro, only that the examples on
this page are assuming a supported distro.

rday

