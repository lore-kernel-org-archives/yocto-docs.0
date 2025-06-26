Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A157C7EE32
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 09:15:11 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.4053.1750929307495332551
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Jun 2025 02:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=vcaLH8SB;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qWe3oQu750KUaPlchZjnghlf4lSxLqLUxTjJoX5yRnY=; b=vcaLH8SBRjVeSB+W7uFY8Z1IYp
	ViggLNf2e1d4S4Cp56uFfIqY8ITssSFlONC39z5owMnOHPzpkFSGdWnD/2vOtPSviRsDdnLMxh4gU
	uVZQmmEWK9eaRklELMfs+yPF5OGMs/nfPshByFwrc+8x50UceqFmBYWMv32YRJuwHUWMpOJQ0KeLs
	vhodmdlwERFdTJyEIP3K2GYf0PesAYmZEe2L39Df2NPnaKVTTQthnnHzBDXOih+6eICMzXu3WXkFS
	aXwH4LilXJe6c5qi1C5G2WvAc1zyqZ5wisXI2mXYw+xOtsVFJXDFaiOWz0oSyohOyZ5UU/sMY8qSY
	Sb0AI3sw==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:46154 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uUih8-00000004Ksm-3x1t;
	Thu, 26 Jun 2025 05:15:05 -0400
Date: Thu, 26 Jun 2025 05:14:51 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Antonin Godard <antonin.godard@bootlin.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [OT] trying to build kas docs, "No module named
 'sphinxarg'"
In-Reply-To: <DAWBUTM7CWGG.3S2D24JNNJ89G@bootlin.com>
Message-ID: <00c8a2e4-6b90-86b9-b424-f581fffd934e@crashcourse.ca>
References: <edad802f-c9fb-a11a-e729-bc505ac97112@crashcourse.ca> <DAWBUTM7CWGG.3S2D24JNNJ89G@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Thu, 26 Jun 2025 09:15:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7227

On Thu, 26 Jun 2025, Antonin Godard wrote:

> On Wed Jun 25, 2025 at 8:34 PM CEST, Robert P. J. Day wrote:
> >
> > Given the abudance of Sphinx expertise here, I'm hoping people will
> > forgive me for a little off-topic querying ... I checked out kas:
> >
> >   https://github.com/siemens/kas.git
> >
> > and tried to build the Sphinx docs with:
> >
> >   $ make html
> >
> > and got:
> >
> > Generate kas-container usage documentation
> > sphinx-build -b html -d _build/doctrees   . _build/html
> > Running Sphinx v7.4.7
> > loading translations [en]... done
> >
> > Extension error:
> > Could not import extension sphinxarg.ext (exception: No module named
> > 'sphinxarg')
> > make: *** [Makefile:53: html] Error 2
> >
> >
> > I've installed python3-configargparse, but no change. Can anyone
> > suggest what I need to fetch and install? Thank you kindly.
>
> You probably just need to install sphinx-argparse.
> https://sphinx-argparse.readthedocs.io/en/latest/

  that's one of the first things i tried yesterday, failed, try it
again this morning, worked just fine. *sigh*.

rday

