Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17493E9B372
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 12:38:45 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.159329.1772455118821839811
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 04:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=uYjXrqxk;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BCMggm3Rg3kICi5ffHe1jDLL1q3XaIDYpjYe1PDb9U8=; b=uYjXrqxktwehIvwJh4Ws2C155P
	wcI2BSVjNCQI9clSxTQouIUkABWYaR9v47a9gxTa6jWA2DjbyJ8vj2+kcg6yddWNSnFdrVDPC3eXl
	k3JiLIbPGXPg7Ho6JzIk4YdG37Utw+5WydSxreBEeam+J/01EGEM8WgB3S/QA7/vNDivw/CQnOkVu
	hhxosG/YeYpUDr93yiyjDRf39CwzUehCZN7NmGaLQM7w++dT9+GGs98Uv1yGFKi71iVZjqTyKxORc
	/baN/wuAZm3o8LS8cWJb+APQqXrC30lGOKHjPSGo/elzW/r+VIp9LweOeovNYdLVuh9QqRvveE/5V
	fBhiNGlw==;
Received: from [147.129.179.166] (port=53410 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vx2Xj-0000000ElAk-3mfl;
	Mon, 02 Mar 2026 07:38:37 -0500
Date: Mon, 2 Mar 2026 07:38:02 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] does PACKAGE_EXCLUDE not handle .deb packages?
In-Reply-To: <1a48de66-a431-451f-ad28-70879392ffe9@bootlin.com>
Message-ID: <ea6a195a-ac68-ffb3-5a52-a1af97e3356b@crashcourse.ca>
References: <929b18be-e9ac-ad9-b8b2-36f95834834a@crashcourse.ca> <1a48de66-a431-451f-ad28-70879392ffe9@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 12:38:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9041

On Tue, 10 Oct 2023, Michael Opdenacker wrote:

> Hi Robert
>
> On 09.10.23 at 07:33, Robert P. J. Day wrote:
> >    from
> > https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGE_EXCLUDE:
> >
> > "This variable is supported only when using the IPK and RPM packaging
> > backends. DEB is not supported."
> >
> >    i just tried it with .deb packages and it *appears* to work.
> > thoughts?
>
>
> Funny, I came across this paragraph last week. Thanks for testing!
> Indeed, the code seems to support this.
> Shall we change the docs if nobody objects?

  From *way* back in 2023, I just noticed this ... the docs still
suggest that PACKAGE_EXCLUDE does not support .deb packaging:

https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGE_EXCLUDE

can someone clarify this?

rday

