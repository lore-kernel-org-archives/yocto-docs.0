Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644CCC433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 15:56:29 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web12.57.1643385388473306276
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 07:56:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EqsnIOFk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 926B71BF209
	for <docs@lists.yoctoproject.org>; Fri, 28 Jan 2022 15:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1643385386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J/gr2dwgJAZYwEusrdT+fcJTQAXEWDbSFu91+Dq+IUU=;
	b=EqsnIOFkTQe17hc0tZHgulmojXwC6InkjVZl5e1T+y7b/N2BCYduQaSIr9/QaRyrkmYe20
	pkCo2Y0usAAJIjZ2rfUobXTq2phnE2DtvRd5snQhN1yYui1H9ZxnMSeRol1QkA5GtlZq6t
	KVtOdbUEM1e3KJu6zNYgledeY7qW1c3bCxppKPi80OwgiFVTObKMW49vVoxo5xd4QOCAbD
	Sx114gnRZocISOXZTjCy0hJvOFaYtVNjUC2S+GPqndYL5PzQKnradicuyhAHXy8VvSO1Fn
	ZeoevyZXZr9bYJqnKSCd6s0Nm7OY0lC6lYfrcQW8rerLgX0MS2YB/6tphy65Gw==
Message-ID: <b2479910-b50c-2f06-0290-72cb953f0963@bootlin.com>
Date: Fri, 28 Jan 2022 16:56:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [docs] [PATCH] ref-manual: add usage details about ccache.bbclass
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <16CE7A27ABB38F4D.29885@lists.yoctoproject.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <16CE7A27ABB38F4D.29885@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Spam-Score: 300
X-GND-Status: SPAM
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Jan 2022 15:56:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2449


On 1/28/22 16:53, Michael Opdenacker via lists.yoctoproject.org wrote:
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/ref-manual/classes.rst | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index d9065b3619..949217bf42 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -274,10 +274,15 @@ sstate re-use. In order to function, this class requires the
>  
>  The ``ccache`` class enables the C/C++ Compiler Cache for the build.
>  This class is used to give a minor performance boost during the build.
> -However, using the class can lead to unexpected side-effects. Thus, it
> -is recommended that you do not use this class. See
> -https://ccache.samba.org/ for information on the C/C++ Compiler
> -Cache.
> +
> +See https://ccache.samba.org/ for information on the C/C++ Compiler
> +Cache, and the :oe_git:`ccache.bbclass </openembedded-core/tree/meta/classes/ccache.bbclass>`
> +file for details about how to enable this mechanism in your configuration
> +file, how to disable it for specific recipes, and how to share ``ccache``
> +files between builds.
> +
> +However, using the class can lead to unexpected side-effects. Thus, using
> +this class is not recommended.

I guess it could be controversial to add usage details for a class that
the manual recommends not to use. On the other hand, if we keep this
class in oe-core, that must be because there are some people who still
want to use it. Then, it makes sense to have usage details IMHO.

Any thoughts about this?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


