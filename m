Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03E9C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 12:51:04 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.12750.1705409455279452276
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jan 2024 04:50:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ayIuuq6W;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EQrfnNd431e0Y+1fk7dQZuBDxq4mrRarl/VUIcoyHlQ=; b=ayIuuq6WhLElKdWI4rh0+y5gWL
	l7qBKsIgD/z89VVGrPyUQAujIs3z96/Uzaq/0PQWE09wW3uxtU++px5sq4j77fBhGxGotxao12rIQ
	HVnetJa6ZRy6Od2AwRq6jB/ZqtlDCdHd02OEWm35jXI5kStDC6ZvKankoU7zi72NGwGBtI7crqV+N
	OI3CTzDEdDTQpruBow5BTqXBwHBoxbwA1H7Urix3tv24eW3K1BrcS8yCGMNvEMCfclyzpR27AsYzM
	qo6TGQa+hynvcC2e7lvtZGsAnx9ZCpmZ8C9VrxT6ekRLSFEff92Kagu4f30FTPDzdts7BcxtSfbWT
	zeps/jDQ==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:49766 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rPiu4-00CFXs-1H;
	Tue, 16 Jan 2024 07:50:53 -0500
Date: Tue, 16 Jan 2024 07:50:46 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] question about EXPORT_FUNCTIONS from bitbake user
 manual
In-Reply-To: <1ac7131af5e1f57c2348455fc2a52847d41b2683.camel@linuxfoundation.org>
Message-ID: <69a31dcd-19f-4fe-8c4b-823ca0c76047@crashcourse.ca>
References: <c2e177fb-6447-98f-fd51-8017ea87294a@crashcourse.ca> <1ac7131af5e1f57c2348455fc2a52847d41b2683.camel@linuxfoundation.org>
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jan 2024 12:51:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4785

On Tue, 16 Jan 2024, Richard Purdie wrote:

> On Tue, 2024-01-16 at 07:11 -0500, Robert P. J. Day wrote:
> >   hoping that bitbake doc questions have been subsumed under the YP
> > docs mailing list ...
> >
> > i'm reading the section, "Flexible Inheritance for Class Functions",
> > here:
> >
> > https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html?highlight=inheritance#flexible-inheritance-for-class-functions
> >
> > and i understand the point of examples like autotools.bbclass defining
> > task functions like "autotools_do_install" so recipes that "inherit
> > autotools" can define their own "do_install" function that, somewhere
> > internally, calls "autotools_do_install".
> >
> >   but what if the recipe that inherits autotools does *not* define its
> > own do_install() function? would it still pick up the
> > autotools_do_install? what if that recipe tried to:
> >
> >   do_install:append = ...
> >
> > would that even make sense? which install function would it be
> > appending to?
> >
> >   in short, while that section explains how to invoke the "base" task
> > function, it is not clear what happens if you don't invoke it that
> > way, and just try to take advantage of the "default" do_install.
>
> If you have:
>
> autotools_do_compile () {
> 	:
> }
>
> EXPORT_FUNCTIONS do_compile
>
> then do_compile will be magically mapped to autotools_do_compile, if
> there is no do_compile function defined by anything.
>
> If you have another similar class (lets say cmake) and have
>
> inherit autotools cmake
>
> then the last one is defined to "win" and do_compile would make to
> cmake_do_compile.
>
> This allows for functions that could do this as well:
>
> do_compile () {
> 	autotools_do_compile
> 	cmake_do_compile
> }
>
> Cheers,
>
> Richard

  ah, that clears things up, thanks. maybe i'll submit a patch to add
that to the doc.

rday

