Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D2CCCF9F1
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 11:21:36 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web01.20335.1761823293157170889
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 04:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=vtTr3oD5;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7s1QqTtcjr5C4ArEJ96kPS9u1YNUM/9UtK7dG+qF0Cc=; b=vtTr3oD58vYH80SACHG2/FbAFC
	OTi2X60bDOf+3H01fmB9+lJmz74zC/IPnkNzUIn/jKucYVgQ/be3FQ5RHYZpwlZvWLn3YdTJVhb67
	uZdEMlW4wu7LGYUpDJc1ES2b6isInkLUE8jNQDDZKBQi8fXhEVX8TFp2rnThz+LG1Vh2drX6bVMDZ
	E0BMwVO27gollGPv+aC796G+u+wT2sNDuIIFK5+nNd+/1neIFnG6RxMMOrt+lmM2Cht2GmRqmJDLX
	hSGsOReicz76VIJce+7xiUqOW6XCucc4wew2fvDRO+hIb7QQu1gz9HI1LWAe/14SWwnUUOYjnfZ2s
	kvvdzQsQ==;
Received: from [147.129.179.166] (port=54310 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vEQia-00000001thM-2w1j;
	Thu, 30 Oct 2025 07:21:31 -0400
Date: Thu, 30 Oct 2025 07:24:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] i may take a crack at writing a section on
 FILESOVERRIDES
In-Reply-To: <2c92a61a-25ac-4b38-97fd-03af06f38bb0@cherry.de>
Message-ID: <90026cf2-57d6-3d45-2836-ebb5b4614e56@crashcourse.ca>
References: <e91d023a-dc34-656c-cbf6-05bc0fd15a71@crashcourse.ca> <2c92a61a-25ac-4b38-97fd-03af06f38bb0@cherry.de>
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
 <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 11:21:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7915

On Thu, 30 Oct 2025, Quentin Schulz wrote:

>
>
> On 10/30/25 11:50 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    related to my earlier whining about how much documentation was being
> > (IMHO, inappropriately) dumped into the reference manual, i'm looking
> > at the section on fetching:
> >
> > https://docs.yoctoproject.org/dev-manual/new-recipe.html#fetching-code
> >
> > and how there is that lonely sentence referencing FILESOVERRIDES:
> >
> > "The OpenEmbedded build system uses FILESOVERRIDES for scanning
> > directory locations for local files in SRC_URI."
> >
> >    i think that feature merits a comprehensive sub-section under
> > fetching (pulling out most of what is in the reference manual).
> >
> >    also, as much as possible, i think the docs should refer to actual
> > examples ripped from oe-core -- for this feature, i would bolster the
> > explanation with the perfect example of using FILESOVERRIDES:
> >
> > https://git.openembedded.org/openembedded-core/tree/meta/recipes-bsp/formfactor
> >
> >    not going to do all that right this instant, but i'm convinced it's
> > worth doing.
> >
>
> Note that there is some surprising behavior when using the layout allowed by
> FILESOVERRIDES and bbappends and I think it really is important to document
> that.
>
> https://pretalx.com/media/yocto-project-summit-2022-05/submissions/SCYYWD/resources/Demystifying_the_OVERRIDES_mec_2lZOP3n.pdf
> slides 102 and 103

  that's why i think there are quite a few places where something that
is explained in only a couple of paragraphs needs to be broken out and
turned into a full sub-section. that's not something that can be
dashed off, it needs someone to sit back and think about how to do
that while keeping the flow.

rday

