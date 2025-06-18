Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD17BC7115B
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 07:54:44 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.1754.1750233283548939763
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 00:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=FfkILvgC;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uRicGkiaudl9TJakepKxJyx91RX43r4LvU9a0jl99gM=; b=FfkILvgCGxkoPC3adApXR5HePK
	10Rfng4b234xhm1+3oM6Prj6IZlWSnUNjAatn+zPA209pAAdiyV8bvwvl7FHcyijDIK6CA4ORkQGl
	fDNQ0aoZo9RqoOIxH+cwc4ShdNEID27LBP7KfC7KbfaCfScLU7GPsbhANGUraLi9ZI/Ub7D93fdBY
	LXvqSp+L9b1c61K1giIwzcxmWb0KRa5aSIJGQ8KT903O3/28w+hQhD0H1HkfDNPLhaUD2T+CEwqpl
	MtvIE8XZvgVCijG4aQSSyr1G91hXTTv4xqbveTqBt4O4HDZHTFfghuv+XOHSOIW3R3cgGXnKYBSzl
	aBy6WlGw==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:53652 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uRnd3-00000002z89-0QeK
	for docs@lists.yoctoproject.org;
	Wed, 18 Jun 2025 03:54:42 -0400
Date: Wed, 18 Jun 2025 03:54:37 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [PATCH] yp-intro: new doc reference is missing leading slash
In-Reply-To: <b08ac36e-51de-71b6-53ad-a2f05b0d31ae@crashcourse.ca>
Message-ID: <c47da2d1-2878-83e6-4104-1e16a596c855@crashcourse.ca>
References: <b08ac36e-51de-71b6-53ad-a2f05b0d31ae@crashcourse.ca>
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
 <docs@lists.yoctoproject.org>; Wed, 18 Jun 2025 07:54:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7091

On Wed, 18 Jun 2025, Robert P. J. Day wrote:

>
> The new ":doc:" reference for yocto-project-supported-features appears
> to be missing a leading slash, causing HTML generation to fail.
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
> diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
> index 15dfb3a6b..40e9693a8 100644
> --- a/documentation/overview-manual/yp-intro.rst
> +++ b/documentation/overview-manual/yp-intro.rst
> @@ -51,7 +51,7 @@ Here are features and advantages of the Yocto Project:
>     RISC-V and other architectures. Most ODMs, OSVs, and chip vendors create and
>     supply BSPs that support their hardware. If you have custom silicon, you can
>     create a BSP that supports that architecture. See
> -   :doc:`ref-manual/yocto-project-supported-features` for details on the level
> +   :doc:`/ref-manual/yocto-project-supported-features` for details on the level
>     of support for some of these architectures.
>
>     Aside from broad architecture support, the Yocto Project fully
>
  *Sigh* ... never mind, should have checked master-next.

rday

