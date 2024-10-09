Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51178CEDD9E
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 14:28:21 +0000 (UTC)
Received: from aye.elm.relay.mailchannels.net (aye.elm.relay.mailchannels.net [23.83.212.6])
 by mx.groups.io with SMTP id smtpd.web11.18014.1728484092646736754
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 07:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=Sf2qi4rP;
 spf=pass (domain: rootcommit.com, ip: 23.83.212.6, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id C76BB8C387D
	for <docs@lists.yoctoproject.org>; Wed,  9 Oct 2024 14:28:11 +0000 (UTC)
Received: from nl-srv-smtpout8.hostinger.io (100-96-86-20.trex-nlb.outbound.svc.cluster.local [100.96.86.20])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id C94F38C3871
	for <docs@lists.yoctoproject.org>; Wed,  9 Oct 2024 14:28:09 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1728484090; a=rsa-sha256;
	cv=none;
	b=TwQ7BbopMG1Zzkjl5FjhrXKvQlcaRaA3yjzdjpOVdf/ApRWv8D9of0GI1hxg6RmCeoMFrq
	6ZB7hBE1rlZEUmzhCYSqKhWRk4bYfoTuSLyop56QETyXz8soYTptui71eO0Vd5wggKSKd7
	izFSCh2Kbqfsn/CvGLiDk4nPd/gBb3kk88WMK+6lPaPeE14Jm+tJK9g5e+sCqH7vMhxoIn
	2SK8pwfHlgR14Zm74pxM2lqLTSknk+XFbK20Zpx6XfkX+ZcEww43xrOBMzHnBOYYBQRp2+
	h0EeumJmEsyxJ8ew37urR1A0ZzG60OTeIKNHsjLX7nTXs5ymd91YtYDTT7Napg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1728484090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=UsDyrUwlEluvkfPXU23hbafUY0FnXZc2glFNFiyrvrg=;
	b=cgJPkKabZCYxWdNUXKWDME5W7I0wH4vbC5r7tO3opyVisqfvuIO9lwe+zQcmwYBn7lcdIi
	ulR4VasxPmHEhH/u920/aBo6EFSgi859B2LG23VcOXGuQ8VGn1N5rNBsx0d9kPp7u3MMWY
	ZVsTrpb34rcdfAosQcHbOJowfDCFf5+LJEzrZzJ+yOcoA9JlwR06KdpPo1/cqKDz5C7sJC
	IsaHxhWYN0u+keuMZnqePqtPWX/3Ny6DvmrTAMwjlAWavGIcwXH9rfkBZp5638Snfz76LL
	DYvCFnSWjVkdHtmw4wwcSDzl8ZgdbE3mACrZKN4hXu7UysNYtkdfeIVwj0cfUg==
ARC-Authentication-Results: i=1;
	rspamd-b4cd7f459-bjmfz;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Rock-Language: 2905865a7507d0a7_1728484090300_2946850949
X-MC-Loop-Signature: 1728484090300:2550639496
X-MC-Ingress-Time: 1728484090300
Received: from nl-srv-smtpout8.hostinger.io (nl-srv-smtpout8.hostinger.io
 [45.87.82.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.86.20 (trex/7.0.2);
	Wed, 09 Oct 2024 14:28:10 +0000
Message-ID: <7b229531-3d0f-4507-a7a8-090bc08ac45e@rootcommit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1728484088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UsDyrUwlEluvkfPXU23hbafUY0FnXZc2glFNFiyrvrg=;
	b=Sf2qi4rPziQF3X8oB0fZfNPU7uJfKtLHkOJbE7Yb81kh3ZjKbUkbiINsLaw21ptZkBgYRv
	wmJyy4afVAhPdD1OrnYHQFOwspEc989VSX8MdshE0Yp9zCw1Z/EVaZrOzlJDTYnaSVcPEz
	Da/kpkRob1Ldx4FoxsYrbzCmzJiB3kriEdm1Ce9XeUk4p6E4xkMqjqrxdjWhxqu6XkoOqk
	2GXRY0I+2ad4rGPnP9AylfWiMIKOE/n9QTjhD0HTNgkX9nZ1Tjv6zoPwbJyGklrbX9ETU7
	oEvFasy8R5koV7rKFzcOrueOZxwrMOC/Va9KRJVh0eNePBiO80ldfNSV7fNsQg==
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, ross.burton@arm.com,
 paul.eggleton@microsoft.com, thomas.petazonni@bootlin.com
Subject: Re: [docs] [PATCH 12/16] ref-manual: add missing variable
 PRSERVER_UPSTREAM
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
References: <20241009074120.866786-1-antonin.godard@bootlin.com>
 <20241009074120.866786-13-antonin.godard@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <20241009074120.866786-13-antonin.godard@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 09 Oct 2024 14:28:07 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=bZY5U/PB c=1 sm=1 tr=0 ts=670692f8 a=FxzzrTkVuG1G0rBnFVKeJA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=d70CFdQeAAAA:8 a=eoUnUxXY7LWQXigNUboA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfDgC0euyW3cFYi5svxGGvPZzTRU4nTlVQ1t4+wXZctWVw3giKR5zaoONytProHVTUwL4HZJws4nBaNFQfFRPBCD3degPSZn3lHpLzo6X+qMLcz6t3tXm MXngjTmLAAgreUYUMHZqx37CA2JZY4G+NU7qVOV/Y2KBTl4n7Z+N0VKxrS2DXAIDyYf30QAnDIa65xBwBK8Yq/PY21UxFrSc+LulwbcwFJPKcxOLhQcgOE4j XuxqBZqIJIt0lCUip858skAeXbcHuRPLcYQagl0cCnUpr8FU4r7N0tAiW1ddVR5ZdvW5FLfCcuHsrVwmYhlqqlXsDeJhGQd7RVlIisCybZjMhALkIzgkdRVK 2bbJ6EQTiFkF5Vhubx0Lre8v7h1OfJFLTVGlKNpBnP3UsJmvrx4t5gyXH8sjT0X10udcoBo1Rl+Oc+tKsKydcycpfKh/ICmzpCvUS/xhb7NuOjWnhB7K6nKL noAGXeE3zOk8uSIsR6cfa28Rsl1AsfmJ6xWJgYBwX+UCl/K+SC4YoAdzb8Q=
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 14:28:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5425

Hi Antonin

Thanks for the update!

On 10/9/24 09:41, Antonin Godard via lists.yoctoproject.org wrote:
> From: Antonin Godard <antonin.godard@bootlin.com>
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   documentation/ref-manual/variables.rst | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 72781d93b..985fec5d6 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6878,6 +6878,11 @@ system and gives an overview of their function and contents.
>         service <dev-manual/packages:working with a pr service>`. You can
>         set :term:`PRSERV_HOST` to other values to use a remote PR service.
>   
> +   :term:`PRSERVER_UPSTREAM`
> +      This variable can be used to specify an upstream PR server for the local
> +      PR server to connect to, in the form of ``host:port``.
> +
> +      This makes it possible to implement local fixes to an upstream package.


Actually, the right variable should be PRSERV_UPSTREAM (instead of 
PRSERVER_UPSTREAM), as used in the rest of the BitBake code.
I've submitted a patch last week to fix this in bin/bitbake-prserv, but 
it hasn't been merged yet.
https://lore.kernel.org/bitbake-devel/20241002150747.85513-1-michael.opdenacker@rootcommit.com/T/#u

Cheers
Michael.

-- 
Michael Opdenacker
Root Commit
https://rootcommit.com


