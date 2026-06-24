Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1A4CDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 17:51:02 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13427.1782323452516354284
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 10:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=cbGXepzM;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bXus7lhC/jpjeAiOVhL1AytSfDfQVYFQ5tBMLGNm+Tw=; b=cbGXepzMdFcUFkyqoJmFBdfF/L
	5ThNEzpWTVlGivo1GyDZJIaWpVz+nzojOjmPbGU7SEprAXcl88228fdPg3j4M6lb6ZM/e9zaXG+bH
	wOOCrUYEVM48wzuKy92GR2N89yJM5wY6dfjLT5GEgveyyBZLETZnRGBe33roMSZKS01WlZIJtSvdU
	7KyjxO/W3tgMWjK4vhmGfQaFSqknggLNR3WpfEgF/EU/LW/KrJPTLgDJyCQ5ZDnWFNntJ+qCiThMj
	cPg0WCHmc+wFVxl0b6hhbuBKjh8/AgodKfUKWuk3rtaFi/WNcLpYDxGSJo0LTsPOJeNf4jwJywvVC
	C9QBTArw==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:38784 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wcRkO-0000000G50B-3cHj;
	Wed, 24 Jun 2026 13:50:50 -0400
Date: Wed, 24 Jun 2026 13:50:43 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref_manual: add "fragments" and "templates"
 directories to structure
In-Reply-To: <f550e65b-d09b-4890-94f6-7fbc3a932765@cherry.de>
Message-ID: <b04acd4e-a311-071e-f95e-1b5b094dd0ad@crashcourse.ca>
References: <21c2164f-ac8d-256d-f8ef-c15336fbba3e@crashcourse.ca> <f550e65b-d09b-4890-94f6-7fbc3a932765@cherry.de>
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
 <docs@lists.yoctoproject.org>; Wed, 24 Jun 2026 17:51:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9869

On Wed, 24 Jun 2026, Quentin Schulz wrote:

> Hi Robert,
>
> On 6/23/26 7:43 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > Add two new entries for the meta/conf/{fragments,templates}
> > directories to the structure of OE-Core metadata.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> >    I didn't bother with the "multiconfig" directory since all it
> > contained was an empty default.conf file. So let's just go with these.
> >
> > diff --git a/documentation/ref-manual/structure.rst
> > b/documentation/ref-manual/structure.rst
> > index ff84b250b..96f9c9f34 100644
> > --- a/documentation/ref-manual/structure.rst
> > +++ b/documentation/ref-manual/structure.rst
> > @@ -862,6 +862,25 @@ it is possible to extend that support to other SDK
> > hosts by adding
> >   additional configuration files in this subdirectory within another
> >   layer.
> >
> > +.. _structure-meta-conf-fragments:
> > +
> > +``meta/conf/fragments/``
> > +~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +This directory contains a number of
> > +:term:`configuration fragments <Configuration Fragment>` ---
> > +top-level build configuration features that can be independently enabled
> > +and disabled using standard tooling.
> > +
>
> What standard tooling?

  i simply copied the text verbatim from the opening sentence here:

https://docs.yoctoproject.org/dev-manual/creating-fragments.html

rday

