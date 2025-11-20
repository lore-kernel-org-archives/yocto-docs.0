Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361BACF8860
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 14:03:26 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34732.1763647398040492851
 for <docs@lists.yoctoproject.org>;
 Thu, 20 Nov 2025 06:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=LVVyonKi;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=O0clUfQiPJ5LjD5BLCohQxSkSCq6coJF+6qJ123EgrA=; b=LVVyonKiOPAUC0HOKBzngSSvMh
	ErLsn1z/Co+Ro6nhe8Un3O5g4KTSqZ6iHJrGKVtvM7KFZEJNOmyEhiMiaeVpXaHoFPs6SkHvV2k81
	3kimQkn/oABPKcXqsRqp46w3puCNLZp0gUD1tBiAfiaDo5VV/+YBBwkpSmSL5kMt+S2TQxew3S2JT
	VRazEbxbo3xQX+hNMYnzDVKLkjSR306RZDaMVmn2poZMTchJJti4XXJhSg1i+mcxrwEo72vy5NJd6
	ZVowtRNGFZ5LLpzK8XWbW7zt+vlsjy2yPluYxVOHadK3FTrHR5qtSyGCWX2xmgG/8512sbyVrC8Nk
	pfPg7Jdw==;
Received: from [147.129.179.166] (port=60992 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vM5Fg-000000070T3-2xfN
	for docs@lists.yoctoproject.org;
	Thu, 20 Nov 2025 09:03:16 -0500
Date: Thu, 20 Nov 2025 09:03:52 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] "bitbake-setup" suddenly works differently from QS
 guide
In-Reply-To: <1879BB280272EEDB.1423420@lists.yoctoproject.org>
Message-ID: <98e96c8d-1bcb-fe40-cdfa-20e441b605a9@crashcourse.ca>
References: <1879BB280272EEDB.1423420@lists.yoctoproject.org>
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
 <docs@lists.yoctoproject.org>; Thu, 20 Nov 2025 14:03:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8101

On Thu, 20 Nov 2025, Robert P. J. Day wrote:

>
>   something seems to have changed dramatically since yesterday ... i
> was following along here:
>
> https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/#use-git-to-clone-bitbake-setup
>
> and i'm sure yesterday, the build directory that was created was the
> verbose one as described on that page; something like:
>
> Enter setup directory name: [poky-master-poky-distro_poky-machine_qemux86-64]
>
>   suddenly, it's only "distro-poky-master". i'm confused.

  ah, i see what's happening ... if this is the very first setup for
this top directory, then the setup doesn't see the need to use the
more verbose name. however, if i "init" a second build, that second
build gets the verbose name for the purpose of distinguishing.

  i "init"ed riscv64, then arm64, and the two directories that were
created were:

  distro_poky-master/
  poky-master-poky-distro_poky-machine_qemuarm64/
  site.conf

so the order of creation seems to dictate the directory names used. or
am i misreading something? i'm pretty sure this is not what was
happening yesterday.

rday

