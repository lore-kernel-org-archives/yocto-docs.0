Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2FF9CD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:29:29 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46845.1778495367933142375
 for <docs@lists.yoctoproject.org>;
 Mon, 11 May 2026 03:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Fm1MIIHf;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JQ6KZJb3m+6pJ8Xn1ef/Q9Rh+WQxYD8kEMtgJvOGiLo=; b=Fm1MIIHfVAf9EYP61LsPLMn0N5
	k94qmmyEcmOo9S9EJgZ49w2Wb6UK3V8Y4qNB1MHhIz0fX4eSqN772rH+TT1qazoFBd/5gela8lQMP
	1RH++grz0pgdky/YPKtKDT7AYZXZvb5bwhj78Ux0k0xWpWh/W/vzpqq/hYQWJBpYEZAz3UNI3RtQE
	/oulMTkCxZCJugJRcM7WcXcibe6lOgvc2u21WfFlHLKXBcDqhMihmuJuR2EiGkW7EU1HBH8IYtpXO
	UG3hmkHfqKN4ufEdlqw+bIyUYHOXk4YPMI9MjcEyOYbiIA/lVp0507e9KowxqKNtpUGA4zqxVn8gG
	fEweqSwQ==;
Received: from [147.129.179.166] (port=47784 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wMNt7-00000004W9i-2Mh3;
	Mon, 11 May 2026 06:29:26 -0400
Date: Mon, 11 May 2026 06:32:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: quentin.schulz@cherry.de
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] What I Wish I'd KNown: Various pedantic
 cleanups
In-Reply-To: <f3864725-4661-4a05-b284-aadc84078d3c@cherry.de>
Message-ID: <44d3a34a-4c8a-e652-6f1f-b30ee156a836@crashcourse.ca>
References: <7492d4a6-6194-d081-2266-98f33dc5ae92@crashcourse.ca> <f3864725-4661-4a05-b284-aadc84078d3c@cherry.de>
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
 <docs@lists.yoctoproject.org>; Mon, 11 May 2026 10:29:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9446

On Mon, 11 May 2026, Quentin Schulz via lists.yoctoproject.org wrote:

> Hi Robert,
>
> On 5/9/26 8:41 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > Tweaks:
> >
> >    - Update "Software Overview" link to go to "Technical Overview"
>
> Why? What's wrong about it?

  Because it simply redirects to the "Technical Overview" page, so the
link label and the title of the destination page don't match.

> No to this one. DISTRO is a variable representing the distro, not its
> features. When we mean DISTRO features, then it's represented by
> DISTRO_FEATURES.
>
> We use distro lowercase throughout the document, so I think this may introduce
> confusion.

  ah, point taken. i can resubmit without that change.

rday

