Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75475C0015E
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 10:49:03 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.17430.1690282138963583062
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Jul 2023 03:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jwoM/2Yx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7840E0006
	for <docs@lists.yoctoproject.org>; Tue, 25 Jul 2023 10:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690282136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RaRfrLAfbbdkVhcTz9ebvBCRnLnJdkB7bkqkWrl20kM=;
	b=jwoM/2YxE7uMRvuB+kMPVpVi9rJMXuH4RGPrD1LmEAT9H5Uw5GZxJ813doNfaI96jHKtDQ
	CxMdjRNU818EHuX7vnKEOARx0LxmGFDZnw8mWO1m2EXIapg3aOHdIknr0jioYe9IW8Oii+
	uyf/uos3WCGP4n+2PBecpY3vvmJDcsiPlU/79m9O3iwrNUE7u5rK4es9qQSVqRcQa6wtpn
	U11whaH3+c02SotiJuu1vPCyH+VKWWe3tc7yr77xJkLwfvnjRgZTrLtxR4U5+Y0E1rJQ+u
	mEstuQEB5m47KmJ8GB+NpENRGNfd8uvozVsNB241WNTzwvYFMy32qsmgQY9axg==
Message-ID: <edd8ede4-f463-d6d1-02d7-d3cfb3939abb@bootlin.com>
Date: Tue, 25 Jul 2023 12:48:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [docs] [PATCH] [dunfell] ref-manual: ref-system-requirements.rst:
 align with poky.conf
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <177516732202084A.7114@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <177516732202084A.7114@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Jul 2023 10:49:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4078

Hello,

On 25.07.23 at 12:45, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Align with the contents of meta-poky/conf/distro/poky.conf
> which represent the distro versions currently tested.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/ref-manual/ref-system-requirements.rst | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
> index ac963dcdb9..6e1ad8ee21 100644
> --- a/documentation/ref-manual/ref-system-requirements.rst
> +++ b/documentation/ref-manual/ref-system-requirements.rst
> @@ -47,10 +47,6 @@ distributions:
>   
>   -  Ubuntu 22.04
>   
> --  Fedora 28
> -
> --  Fedora 29
> -
>   -  Fedora 30
>   
>   -  Fedora 31
> @@ -67,6 +63,8 @@ distributions:
>   
>   -  CentOS 7.x
>   
> +-  CentOS 8.x
> +
>   -  Debian GNU/Linux 8.x (Jessie)
>   
>   -  Debian GNU/Linux 9.x (Stretch)


I could further reduce the list by removing the distros that we are 
still supposed to test (such as Ubuntu 19.04), but that we obviously 
cannot support any more as they have reached their end of life.
Any thoughts?
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


