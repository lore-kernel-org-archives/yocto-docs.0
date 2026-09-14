Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F55AC88E64
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 13:03:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19731.1789391000877357914
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 06:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=w10WCVgx;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=lfoOvwNVe5kaevuzKpHMyGqXKi8VjK+a/wN9QZQU9h8=; b=w
	10WCVgxaeZQfpezkN2CvAi5tPU5ycBaUUJxnQQD2PFexkBqIjdBsLt+O4S6khUaOEyfQoFqrslZk6
	GYOLNcgHdg7EuBkVWJhuBZtNdwwLdLzIX86whV1cx9xgm0r0vGjQCfOyQqzFgrw9NHkz71LTdR7SG
	Gwhv9BwnPHJLjIRs5qBVpwv4arY1nPkJ8qACxeZXmhSMl9NQOk/Vh0ttLEITskIoUDsiccekOhP7S
	rvvy0l9wJLu4oQ+6eWuR/F5CR7fJo5YjSa8QkDSwyKDFW0doPmozZQCWm872BCh1IXjPPw1jJ35cE
	EPoF+Ni0Q9O0HFiTrcm4IZo0wa7ULsb/Q==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:38062 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1x66L7-0000000AxuC-1lvw;
	Mon, 14 Sep 2026 09:03:19 -0400
Date: Mon, 14 Sep 2026 09:01:10 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Antonin Godard <antonin.godard@bootlin.com>
cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] how should one update "dual, six-core Xeons"?
In-Reply-To: <DLF1KOQ6EK65.32CUFMXM5545U@bootlin.com>
Message-ID: <5cbbde75-6821-a4e5-f44e-8290522cf53c@crashcourse.ca>
References: <b13f1dcb-14aa-8063-e9da-96817167a9aa@crashcourse.ca> <DLEWHJ0DKML4.2ITSSJJ00H3ZG@bootlin.com> <5f70fb6ea6d2c9a4a24f476f463ab1adf02aa7e5.camel@linuxfoundation.org> <ffbce176-bd78-f316-dd71-dda8ae2dd8f1@crashcourse.ca>
 <DLF1KOQ6EK65.32CUFMXM5545U@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 13:03:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10492

On Mon, 14 Sep 2026, Antonin Godard wrote:

> Hi,
>
> On Mon Sep 14, 2026 at 11:46 AM CEST, Robert P. J. Day wrote:
> > On Mon, 14 Sep 2026, Richard Purdie wrote:
> >
> >> On Mon, 2026-09-14 at 10:36 +0200, Antonin Godard via lists.yoctoproject.org wrote:
> >> > On Fri Sep 11, 2026 at 8:08 PM CEST, Robert P. J. Day wrote:
> >> > >
> >> > > here:
> >> > >
> >> > > https://docs.yoctoproject.org/dev/dev-manual/start.html
> >> > >
> >> > > it's amusing to read, "These systems, in general, should be high
> >> > > performance (e.g. dual, six-core Xeons with 24 Gbytes of RAM and
> >> > > plenty of disk space)."
> >> > >
> >> > > would someone like to suggest a more modern configuration, and i'll
> >> > > submit a patch.
> >> >
> >> > We could simply say: "&MIN_RAM; Gbytes of RAM, at least &MIN_DISK_SPACE; disk
> >> > space".
> >> >
> >> > Those are replaced by our poky.yaml.in replacements when building.
> >> >
> >> > Not sure we need to mention a processor model here, as it would become obsolete
> >> > in the future.
> >>
> >> I think the key is to mention multi cored system, "ideally with at least 16 cores"?
> >
> >   i can submit a v2 with that info, but would that be hard-coded since
> > there is no variable in poky.yaml.in that relates to that.
>
> Right, I think we could hold this value next to MIN_RAM and MIN_DISK_SPACE, so
> we keep all of them in sync.
>
> I think we should add MIN_CPU_CORES in a patch, then use this value next to
> where MIN_DISK_SPACE and MIN_RAM are used in the docs.

  we can do this in two steps, and someone else higher up the food
chain can peruse poky.yaml.in and decide if there are any other
variables that can be added that would be useful in the docs, after
which i'll submit a patch to take care of my little issue and others
can think where else those new variables can be used.

rday

