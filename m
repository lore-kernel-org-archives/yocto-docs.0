Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79998C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 09:56:27 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.4682.1750758977733196082
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 02:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=DmzTbIkc;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=06QU+eWmEW2GTviBkrheWtteVYLYxoFtf0v0qBaLTPM=; b=DmzTbIkcOtVo7DchHdaJDakdcR
	oztSvrYVGb3eJQ+rSlhCSR8j2Reybp93LwOUIMV46XeomrbZVK2uPENjZ21V27JK+z4pvGQYU6qIB
	YEvNBHGg4OyBQntDraTKKbE9wtCxbABC9yxXL6PsUkwX59VRzyUuB7kefwGLgbEvqwf+Jl+gW6VNg
	NM3hN3ZbsQIYeab5Kto8en6MTvf2Zq7raN1fvMBqnDclfznBxqebdgApQczxM4km5vC9lOYAsT3X4
	pV+w+KeG9MOAla/6V/OJQ9xhCIP+GwUKwKd7W+3o3qne3wgi/Rz/zsRW7WA3RY2gmMw3ksNN2O9m3
	Xp5Sjqdw==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:42024 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uU0Nx-0000000EAU1-3gbD;
	Tue, 24 Jun 2025 05:56:15 -0400
Date: Tue, 24 Jun 2025 05:56:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] should page on "Selecting a Device Manager" mention
 uedev?
In-Reply-To: <fcefedca-075c-4213-bcf1-7770ea16a9dc@cherry.de>
Message-ID: <e20bbbe3-67a7-d08a-2e6d-f25ec31e15b6@crashcourse.ca>
References: <3ee37427-2257-90a8-4ef7-03e344f0e671@crashcourse.ca> <fcefedca-075c-4213-bcf1-7770ea16a9dc@cherry.de>
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
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 09:56:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7207

On Mon, 23 Jun 2025, Quentin Schulz wrote:

> Hi Robert,
>
> On 6/22/25 8:34 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> >
> >    this page on selecting a device manager:
> >
> > https://docs.yoctoproject.org/dev-manual/device-manager.html
> >
> > says nothing about eudev. should it? given that both systemd and eudev
> > PROVIDES = udev, what happens if one selects systemd as the init
> > manager, but selects eudev to provide udev? would that even work?
> > should this be explained?
> >
>
> I'm pretty sure this would result in a build failure because you would have
> two recipes providing the same "feature" and BitBake won't allow that. How
> would BitBake know which one to put in your recipe's sysroot? Both? And what
> if they have files named identically in the same paths (it'll fail, I've
> already had experience with two different packages installing the "same" file
> and BitBake refusing to generate the rootfs).
>
> I'm not sure we need to specify all device managers, but indeed eudev would be
> missing and I would assume that there won't be many popular-enough new device
> managers in the near future? SO it could be fine to add it?

  i just configured a new qemu x86 build from poky, so that would have
selected:

  INIT_MANAGER = "systemd"

and i also added in local.conf:

  PREFERRED_PROVIDER_udev = "eudev"

and "bitbake --parse-only" seemed perfectly happy, i also verified the
settings with "bitbake -e", and that's what it shows. so i'm not sure
how the docs should be changed (if at all) to reflect this.

  what should this do? is it even meaningful?

rday

