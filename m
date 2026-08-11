Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD357C5CFCF
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 10:02:16 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50893.1786442527894514204
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 03:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=h5H2ksE9;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+v53Ey1a+Zvts+Sh+cHFtAP8cNt/8NL8r+9EPZfHvng=; b=h5H2ksE9Kl38eLKoK6fswbV/0A
	VevXDhnK2xWfwv2JfYwD32ltW9SvT8AEGOzvZREjA//G3yuRjrp+RoMFuu8E8/dnzschHWCe9/qMl
	cXpj4vV/GDO2ZbkZ8nq3tS2tZk6+p7+ak1DTCC/kvE8AIUgac8Rg8mFlwtZCRZ2JizKKEScxdKnz4
	1TCZ1flwq3q7AHDdnC9wOqpZhh/9hvw0Wlro9ixyvcEuYXEPxAAaS/igIyZeucvZpiqHPvhsjglv1
	FM8B76InwmjxCnpmJY1E3AvwwtzRy1E6wAZiZT1GqTnkI79Ojx7SFPMnZxKOaelu+7XuMVlxX/4ST
	2wqxijoA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:34984 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wtjJ6-00000007bEE-22w7;
	Tue, 11 Aug 2026 06:02:06 -0400
Date: Tue, 11 Aug 2026 06:00:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Antonin Godard <antonin.godard@bootlin.com>
cc: docs@lists.yoctoproject.org, 
    Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [docs] [PATCH 2/2] brief-yoctoprojectqs/index.rst: fix a
 replacement typo
In-Reply-To: <20260811-bitbake-setup-pip-v1-2-0c8b350017e4@bootlin.com>
Message-ID: <83cd5f96-dedb-a2a8-3a96-56098cf59403@crashcourse.ca>
References: <20260811-bitbake-setup-pip-v1-0-0c8b350017e4@bootlin.com> <20260811-bitbake-setup-pip-v1-2-0c8b350017e4@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 10:02:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10260

On Tue, 11 Aug 2026, Antonin Godard via lists.yoctoproject.org wrote:

> These two replacements were missing the leading ";" which made them
> appear with their name instead of resolved value.

  Don't you mean trailing ";"?
>
> Fixes: 34eafb89b1e4 ("brief-yoctoprojectqs/index.rst: refresh bitbake-setup outputs")
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  documentation/brief-yoctoprojectqs/index.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
> index 5ecc11791..9af18d744 100644
> --- a/documentation/brief-yoctoprojectqs/index.rst
> +++ b/documentation/brief-yoctoprojectqs/index.rst
> @@ -138,9 +138,9 @@ differ from the examples below.
>
>        Available Configuration Templates:
>        1. oe-nodistro-master   OpenEmbedded - 'nodistro' basic configuration
> -      2. oe-nodistro-&DISTRO_NAME_NO_CAP  OpenEmbedded - 'nodistro' basic configuration, release &DISTRO_RELEASE_SERIES; '&DISTRO_NAME_NO_CAP;' (supported until ...)
> +      2. oe-nodistro-&DISTRO_NAME_NO_CAP;  OpenEmbedded - 'nodistro' basic configuration, release &DISTRO_RELEASE_SERIES; '&DISTRO_NAME_NO_CAP;' (supported until ...)
>        3. poky-master          Poky - The Yocto Project testing distribution configurations and hardware test platforms
> -      4. poky-&DISTRO_NAME_NO_CAP         Poky - The Yocto Project testing distribution configurations and hardware test platforms, release &DISTRO_RELEASE_SERIES; '&DISTRO_NAME_NO_CAP;' (supported until ...)
> +      4. poky-&DISTRO_NAME_NO_CAP;         Poky - The Yocto Project testing distribution configurations and hardware test platforms, release &DISTRO_RELEASE_SERIES; '&DISTRO_NAME_NO_CAP;' (supported until ...)
>
>        Please select one of the above configurations by its number: 3
>
>
> --
> 2.55.0
>
>

