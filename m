Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEA6CCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 16:20:39 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.16393.1761668435068714470
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 09:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=LlE6p1xl;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yDdTHMGD0QTQfwOLqhU4JjSefLLW9kryyc77DAHwZiI=; b=LlE6p1xlt8/lQBjihl3NDyiCca
	esgkzNGzBjqMqW7/p4Vn26VNzDa53stlmM5PRqbovAxb0g7UuDJJufSgUOMbTb0t2NI497Mhlbq/p
	3vmyMyt3zZ24s+r4q4fUyp1IC1mNXOEumX38Pp4H1n3yEm1yeMbkObQLqskg3wkTgCW1FtTwgNoS4
	2Zhvyr5GrmgjQd+W/LyYRbl0/3fpnJxFScApOmNMLN15IBSXRYFI1Xmhm6Bznhs3AaFSjRsem5n4U
	QMTrFkxaOjrtaPtVhZ1AMvPVJWgBgPPfEwK+qtlnfynmbT625e9fW2+ULpuV/masEAkKQ1CrpPX8T
	gtesUTZg==;
Received: from [147.129.179.166] (port=33180 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vDmQw-0000000DGHH-3DJJ;
	Tue, 28 Oct 2025 12:20:33 -0400
Date: Tue, 28 Oct 2025 12:23:21 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Khem Raj <raj.khem@gmail.com>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] should meta-xfce layer use dynamic-layers feature?
In-Reply-To: <CAMKF1srkRqQPwQht0X452xPbL-J_Vz_kbuir=ua7ApDfSrMc5A@mail.gmail.com>
Message-ID: <9cd1d1bd-32fd-e683-ef1d-c1650bc4f0e0@crashcourse.ca>
References: <a49eeec2-9048-1b31-a317-de344e7c0bd1@crashcourse.ca> <CAMKF1srkRqQPwQht0X452xPbL-J_Vz_kbuir=ua7ApDfSrMc5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-297861291-1761668604=:3896708"
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
 <docs@lists.yoctoproject.org>; Tue, 28 Oct 2025 16:20:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7886

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-297861291-1761668604=:3896708
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 28 Oct 2025, Khem Raj wrote:

> On Tue, Oct 28, 2025 at 3:54 AM Robert P. J. Day via
> lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
> wrote:
> >
> >
> >   not afraid to embarrass myself but as i was perusing dynamic layers,
> > i ran across this in the meta-openembedded/meta-xfce layer:
> >
> > https://git.openembedded.org/meta-openembedded/tree/meta-xfce/README.md
> >
> > which reads, in part:
> >
> >   meta-xfce depends on meta-oe, meta-gnome and meta-multimedia in this
> >   repository.
> >
> >   To avoid dependencies on meta-multimedia you need to mask recipes by
> >   adding this to local.conf:
> >
> >   BBMASK = "meta-xfce/recipes-multimedia"
> >
> > isn't that exactly what dynamic layers are supposed to address? the
> > conditional inclusion of recipes based on which layers you include? or
> > is the above doing something different?
>
> The above describes the way to mask the recipes from a layer en-masse
> dynamic-layers provide a mechanism in a layer to add tweaks that are only
> effective when concerned layer, to which they make changes, is enabled
> in a project via BBLAYERS

  ah, quite so, i suspected i was misreading.

rday
--8323329-297861291-1761668604=:3896708--

