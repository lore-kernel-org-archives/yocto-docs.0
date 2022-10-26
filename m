Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FA1C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 13:47:33 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.7597.1666792044486316609
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 06:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nSds+IcB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 674A1FF80B;
	Wed, 26 Oct 2022 13:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666792042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s1gqVa+bkoHKndcFPKMShbOzYAV4MRTsD3+HQTIppt4=;
	b=nSds+IcBnVIMu0NnW0nU7u1jv2THAby/yLCaJ7MMhcz2BDUWAMgsDaABpi4yhDQ0jSk7FG
	+rD5dpLAUzOtYrSMOoZtjAZhd75pl3K6hS0+Rh4EaV/vMstYuNxTKcLGSqOjB4zFKc2pfU
	IsvNPpBV4Hl8+AI6kCi092q5c9xFwHcYF1TRfJCr3CQ1F0Z6uttianEDE7A8U8G/LmA43U
	iRugdqm47x11AlPIVg8ZM/bs0ZmVnW6NAIqT4nEKSjw59MpjEHUWJqNR34CDfC70cMlxYZ
	/I30/XlzG/S2jRm8Nn/pnrxL04lAxWS6+glSCZ4Au4YgIyhW7VSASkNr4Opnqg==
Message-ID: <4c95a562-4f31-0418-1b46-cc60dc6f81a1@bootlin.com>
Date: Wed, 26 Oct 2022 15:47:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 0/4] Improve CVE check and patching documentation
To: Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20221026131207.3655961-1-mikko.rapeli@linaro.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221026131207.3655961-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Oct 2022 13:47:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3411

Hi Mikko

On 10/26/22 15:12, Mikko Rapeli wrote:
> From: Mikko Rapeli <mikko.rapeli@linaro.org>
>
> I think detecting and fixing CVE security issues in yocto based distros
> is quite important so improve the documentation around it. I've been
> using cve-check.bbclass for a long time and these details hopefully
> make it easier for others to start using it as well.
>
> Mikko Rapeli (4):
>    ref-manual/variables.rst: add documentation for CVE_VERSION
>    classes.rst: improve documentation for cve-check.bbclass
>    common-tasks.rst: add regular updates and CVE scans to security best
>      practices
>    common-tasks.rst: refactor and improve "Checking for Vulnerabilities"
>      section
>
>   documentation/dev-manual/common-tasks.rst | 183 +++++++++++++++++-----
>   documentation/ref-manual/classes.rst      |  52 +++++-
>   documentation/ref-manual/variables.rst    |  12 ++
>   3 files changed, 204 insertions(+), 43 deletions(-)


Many thanks for all these. They are much appreciated, and I also found 
that the CVE management document wasn't sufficient.
My reviews are following (when there is something to say).
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


