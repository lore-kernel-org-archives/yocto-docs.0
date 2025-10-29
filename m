Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F128FCCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 10:56:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.3751.1761735386087533135
 for <docs@lists.yoctoproject.org>;
 Wed, 29 Oct 2025 03:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=EhjKWTXE;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NZmKSAirNXmRlVIAzU7W/4Tzv25SZWaXqENHbuuijGs=; b=EhjKWTXEkcwFF7lJsBE0pEM8TS
	JzPDVriU+hAEDvA95HzaOx4gf0MKcwVtmGy4/Gj+BSe2v8TJvtMWnTYmr/UZxzy2Yk1iPUt8MdKrJ
	vCTJhyl8rfgKV4GutRyKBFHB8hs8gQVYqH32hwOg//Bh7owD331FzXYCMxrt/M6GAICCqp7lwH3k1
	A0haacK8AiuVRt7h2ZDMCvNamSFrO/Gc8XOlYJ4UxgqHTY9dTQHIVzgCgBWdD1Y8+5hYwybCgq0/x
	Cmt3Pwyizx4nH2tC0x/d7xKLme2p3XiRhsCkdMl4+uteWXs1yA8Itm0HT1SuNbiqv7JPek3WQ7fVg
	0M5qctgw==;
Received: from [147.129.179.166] (port=44276 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vE3qn-0000000FwkK-0l5R;
	Wed, 29 Oct 2025 06:56:24 -0400
Date: Wed, 29 Oct 2025 06:59:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] dev-manual/new-recipe.rst: replace 'bitbake -e'
 with 'bitbake-getvar'
In-Reply-To: <219f6279-799e-4ba5-959d-37bba26d293b@cherry.de>
Message-ID: <88bfbe6d-05bb-a49e-1740-1194e12319d3@crashcourse.ca>
References: <fa6e98c8-8edb-d7c0-5407-b1f27ce83078@crashcourse.ca> <219f6279-799e-4ba5-959d-37bba26d293b@cherry.de>
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
 <docs@lists.yoctoproject.org>; Wed, 29 Oct 2025 10:56:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7899

On Wed, 29 Oct 2025, Quentin Schulz wrote:

> Hi Robert,
>
> On 10/29/25 11:29 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> > Replace the legacy call to 'bitbake -e' to get the value of a recipe's
> > variable with the newer call to 'bitbake-getvar'.
> >
>
> It'd be nice if we could catch all instances of `bitbake -e` we can replace
> and fix them.
>
> documentation/kernel-dev/common.rst has one we should be able to get rid of.
>
> Ditto for documentation/ref-manual/variables.rst (OVERRIDES) and
> documentation/dev-manual/debugging.rst.
>
> One thing I'm not sure bitbake-getvar does is show functions? I vaguely
> remember finding something in bitbake -e output helpful for recipe functions,
> but it's been a long time :)

$ bitbake-getvar -r gawk do_install

... snip ...

do_install() {
    # Export function set
    autotools_do_install
	# remove the link since we don't package it
	rm /home/rpjday/oe/builds/qemuarm64/tmp/work/cortexa57-poky-linux/gawk/5.3.2/image/usr/bin/awk
	# Strip non-reproducible build flags (containing build paths)
	sed -i -e 's|^CC.*|CC=""|g' -e 's|^CFLAGS.*|CFLAGS=""|g'
/home/rpjday/oe/builds/qemuarm64/tmp/work/cortexa57-poky-linux/gawk/5.3.2/image/usr/bin/gawkbug
}

