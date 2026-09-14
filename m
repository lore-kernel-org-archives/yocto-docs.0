Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1C9C88E64
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 09:49:11 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16549.1789379348438832870
 for <docs@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 02:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=pR/D8tiT;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=JJrD7HcHIPlJmtYYZNmytKZA/B/JZ6QaQhT78z9+fBw=; b=p
	R/D8tiTYdqoqBCaqMBz00+RoIMcPqkfBn64SrKj6ViH1oU9m2voqafOPTwMpi89jbTTvcxVphWA5L
	YQDjp79y48wae3kKwhWAh6VEi/8xbSKtdWDvU7zHphJAhMiod4b8l9ZKRtyUQhsTw1rN3ssIpXfhn
	YDBv7UebVJNa8pt2Q5gRdjiLC5GXwVU4qymPVhejjnp7mfEYNmROuVSs8Scay8vBruPwHUmjokfOf
	7RqAz9Twrx1h1CjQsqsUX6bmZ6F2F9YiOIxyHnGzEs5l9eRof1Uwu6YarDUPQu7zUxqg9bv8Nl+Eo
	NSJulwER1/iJHSweMT7sLmpkFcb3gy1vA==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:37838 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1x63JC-0000000Ac7I-107S;
	Mon, 14 Sep 2026 05:49:07 -0400
Date: Mon, 14 Sep 2026 05:46:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: antonin.godard@bootlin.com, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] how should one update "dual, six-core Xeons"?
In-Reply-To: <5f70fb6ea6d2c9a4a24f476f463ab1adf02aa7e5.camel@linuxfoundation.org>
Message-ID: <ffbce176-bd78-f316-dd71-dda8ae2dd8f1@crashcourse.ca>
References: <b13f1dcb-14aa-8063-e9da-96817167a9aa@crashcourse.ca>  <DLEWHJ0DKML4.2ITSSJJ00H3ZG@bootlin.com> <5f70fb6ea6d2c9a4a24f476f463ab1adf02aa7e5.camel@linuxfoundation.org>
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
 <docs@lists.yoctoproject.org>; Mon, 14 Sep 2026 09:49:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10490

On Mon, 14 Sep 2026, Richard Purdie wrote:

> On Mon, 2026-09-14 at 10:36 +0200, Antonin Godard via lists.yoctoproject.org wrote:
> > On Fri Sep 11, 2026 at 8:08 PM CEST, Robert P. J. Day wrote:
> > >
> > > here:
> > >
> > > https://docs.yoctoproject.org/dev/dev-manual/start.html
> > >
> > > it's amusing to read, "These systems, in general, should be high
> > > performance (e.g. dual, six-core Xeons with 24 Gbytes of RAM and
> > > plenty of disk space)."
> > >
> > > would someone like to suggest a more modern configuration, and i'll
> > > submit a patch.
> >
> > We could simply say: "&MIN_RAM; Gbytes of RAM, at least &MIN_DISK_SPACE; disk
> > space".
> >
> > Those are replaced by our poky.yaml.in replacements when building.
> >
> > Not sure we need to mention a processor model here, as it would become obsolete
> > in the future.
>
> I think the key is to mention multi cored system, "ideally with at least 16 cores"?

  i can submit a v2 with that info, but would that be hard-coded since
there is no variable in poky.yaml.in that relates to that.

rday

