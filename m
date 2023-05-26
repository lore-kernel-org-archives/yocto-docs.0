Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD76C7EE2D
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 09:18:53 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.4198.1685092732183686044
 for <docs@lists.yoctoproject.org>;
 Fri, 26 May 2023 02:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=auoqvEp2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685092730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9iSkXrvn9O634Y1+8pEoMHHJ0POPguQeczfKgOThyPE=;
	b=auoqvEp2MbIx1B0HwopRotP7eIjTBvWg31Dda6pjhwTvGOmjJel0ZnUYJoya3/CjB+ZX+6
	ss253qAGI9CEehjs5ShTkJ0D7SWTy4waAHyMBWE0yadgjw0NDr5XebCPww1sIns2NP+wy8
	De1jfsHUOjkYqxI1ckHPaXRvpYF59FgbohMFKPR4etZiswrRfiFi3V6L5M7TEHXHZzrPgn
	P1cX0/aERe3YTSuT5vRM48NVxmHauRwxMgkCUETs/iSO+GY4eYAIi29QUGbNrtByiA98ST
	uSkjpoczK/2g+t+2gngDh4DV0nMEBzNQL9JJNmwks7MhxmoDUNqZzTgDViOucQ==
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC603FF803;
	Fri, 26 May 2023 09:18:49 +0000 (UTC)
Message-ID: <02d5ac9b-c4eb-0d60-d812-4128501d5473@bootlin.com>
Date: Fri, 26 May 2023 11:18:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: nd@arm.com, docs@lists.yoctoproject.org
Subject: Re: [docs] [RFC PATCH] WIP LICENSE_FLAGS_DETAILS documentation
Content-Language: en-US
To: Ross Burton <ross.burton@arm.com>
References: <20230524163201.3630288-1-ross.burton@arm.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230524163201.3630288-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 May 2023 09:18:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3967

Hi Ross,

On 24.05.23 at 18:32, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
>
> ---
>   documentation/dev-manual/licenses.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
> index 9629dc53293..805b40fd482 100644
> --- a/documentation/dev-manual/licenses.rst
> +++ b/documentation/dev-manual/licenses.rst
> @@ -123,6 +123,13 @@ name and version (after variable expansion)::
>   
>      LICENSE_FLAGS = "license_${PN}_${PV}"
>   
> +It is possible to specify where to find more details for a specific license
> +using flags on the :term:`LICENSE_FLAGS_DETAILS` variable:
> +
> +  LICENSE_FLAGS_DETAILS[my-eula-license] = "https://example.com/eula"
> +
> +If set, this will be displayed to the user if the license hasn't been accepted.
> +
>   In order for a component restricted by a
>   :term:`LICENSE_FLAGS` definition to be enabled and included in an image, it
>   needs to have a matching entry in the global


Thank you for starting this.
I'll get back to it when support for LICENSE_FLAGS_DETAILS is merged.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


