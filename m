Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE1EC43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 16:37:15 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web08.567.1654533432139851679
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Jun 2022 09:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mIXtkyAj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8E53A24000A;
	Mon,  6 Jun 2022 16:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654533430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iZ+b/9wYyTOgXxPD49UBq6BUjD4+fEtCb2XONDZuX6A=;
	b=mIXtkyAjw+rALtnvevyYRIl9raTmlwD0/AjYdfP5YIKo06Aaic9uJN27rHMlZSBPWBDDZn
	dJItzm43J/N2kHjqPiZAFcwY/V4ouWdomPNGSayzeiYy0kyXt60lzpci8jEbdI4/m5HYjE
	6yu1N9QXNp5dqWRtfa8UFV1FQQE12Aw+Mul4joFGw3X8hry87lbaCz/Zg6Kaox5diKlj3I
	0fMMVVS8Rt/aNHHJ7DPo1sfjeGrzEJ/Umg36VDjgF/HXywEfsdzDAl8X77pvR9qE0YVpil
	t0+Qgx5XRynDo7A51uk3r09e/7Al+RNoPyEoEGoiunUVVyZ1+eXctryyH2HUOA==
Message-ID: <c260586d-7d2a-e37f-9ac0-1e60ac78ea7d@bootlin.com>
Date: Mon, 6 Jun 2022 18:37:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [yocto] [PATCH 2/2] manuals: SYSTEMD_SERVICE overrides depend on
 SYSTEMD_PACKAGES
Content-Language: en-US
To: Paulo Neves <ptsneves@gmail.com>, yocto@lists.yoctoproject.org
References: <20220603163521.146659-1-ptsneves@gmail.com>
 <20220603163521.146659-2-ptsneves@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220603163521.146659-2-ptsneves@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Jun 2022 16:37:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2965

Hi again Paulo,

On 6/3/22 18:35, Paulo Neves wrote:
> Add detail that package overrides are only available if
> specified in SYSTEMD_PACKAGES.
> ---
>  documentation/ref-manual/variables.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index ed52c3508..6e2919474 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7664,6 +7664,10 @@ system and gives an overview of their function and contents.
>  
>           SYSTEMD_SERVICE:${PN} = "connman.service"
>  
> +      The package overrides that can be specified are directly related to the value of
> +      term: SYSTEMD_PACKAGES. Overrides not included in term: SYSTEMD_PACKAGES
> +      will be silently ignored.


You should use instead:
:term:`SYSTEMD_PACKAGES`

Would you mind sending an update to docs@lists.yoctoproject.org with
your "Signed-off-by" information, please?

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


