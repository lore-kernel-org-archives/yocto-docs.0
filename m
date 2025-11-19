Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853CFCF31AF
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 11:44:46 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4757.1763552679055006942
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 03:44:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=N5UxIyeB;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mfSSUbQllssoNbW0LMwd66R9BEThr2N4uG6TwW9Q/xk=; b=N5UxIyeBURhtGL1CapCNC6VwmV
	gcU5hEMRXnf04L7T5rE/g2u0WVleQnCQdunmiWgDNmPtvP8mBBhB36Dg7XaOHq6WINrAVfW1VUTDb
	DYDfuKqSNYgbUfaQy2jBRn0RkMra2YfdMYhB3YE6BgJbWw8M2GclITcozHv/ZCPHBRyN+bi4htQaR
	eQsr6KZ9Rzm8dQQrWOx0J3oeEcFNUUbgCly5YM+zEMFkWW2wYAYLGyc8K5VA8A1IsNsAq+q5ZzKVD
	NfVPjj95PFS9zBaBEKDvg0Dd7cbTpV/yXR/C/k2pKwPFlmOcXCIa/Z/rMUI3ggyK6MaI1A9ROtOD9
	sXgNxbyA==;
Received: from [147.129.179.166] (port=43404 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vLgbu-00000002uN5-2iDt;
	Wed, 19 Nov 2025 06:44:33 -0500
Date: Wed, 19 Nov 2025 06:45:10 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: quentin.schulz@cherry.de
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] can the assumption of building on ubuntu be relaxed to
 debian?
In-Reply-To: <318bddb4-bd28-4be5-87bb-4262076bd495@cherry.de>
Message-ID: <3ae9ad48-13bf-1afc-6ccc-3bff1fddc8a1@crashcourse.ca>
References: <24bb11b9-85c3-9dc8-e655-b630dbbcbe9d@crashcourse.ca> <318bddb4-bd28-4be5-87bb-4262076bd495@cherry.de>
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
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 11:44:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8078

On Wed, 19 Nov 2025, Quentin Schulz via lists.yoctoproject.org wrote:

> Hi Robert,
>
> On 11/19/25 12:25 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    i ask this only because i recently moved off of ubuntu and onto
> > generic debian 13 ("trixie").
> >
> > here:
> >
> >    https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/
> >
> > one reads in that initial note:
> >
> > "The examples in this paper assume you are using a native Linux system
> > running a recent Ubuntu Linux distribution."
> >
>
> I think it can be relaxed to "a native Linux system running one of the
> officially supported Linux distribution listed under" pointing at
> https://docs.yoctoproject.org/dev/ref-manual/system-requirements.html#supported-linux-distributions
> which is what we test BB/YP/OE with through the autobuilder as far as I
> understood.

  i wouldn't go that far as the examples in that guide do indeed use
debian-based commands ("apt"). i'll give this some thought.

rday

