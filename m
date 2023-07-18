Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D3FEB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 12:43:09 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.6494.1689684184410910504
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Jul 2023 05:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mQzbTx21;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23DAD40014;
	Tue, 18 Jul 2023 12:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689684182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6xm+wbOJeRnf9CrNluMwjdDAC8+rJEpzzw2UTE8bDnU=;
	b=mQzbTx21GqB94A1/i5ep+yHtzRL8vV2giiTYSxNgMjYdbnSeu69glW22MSOp5o+M6Agfyf
	eHr69QIYwJFc0In2tLaMq615igocSaYPzjl952iv4G1UXXzZvVjFWGN/Vnxeu5lbiXOr/A
	cHm1n2eHSHtzzNGuf5/PwMq3LjWAvWZGR+1YWZErTsMm9Y+GkexA/iTE7C6p+FbQYYMnKW
	+BJ/bgNIOLFAscqEwHKydaxN5/DW5YKi7pJ1q+zQxWuuhDeQ0LkVXCkmc98f+CntS9NoGU
	T1Qe7IVmPEkD+XQyce4vcYl6oeYSz9JsJRV1ldijkCA+za7xLsVLVyRFMyeNyQ==
Message-ID: <9262f63a-ad4f-4842-076e-351030608db3@bootlin.com>
Date: Tue, 18 Jul 2023 14:43:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [yocto] [ANNOUNCEMENT] Yocto Project 4.0.11 is Released
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <CH3PR11MB8093282D366825D9D00DB9BFB92EA@CH3PR11MB8093.namprd11.prod.outlook.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CH3PR11MB8093282D366825D9D00DB9BFB92EA@CH3PR11MB8093.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Jul 2023 12:43:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4058

Hi Lee,

On 04.07.23 at 03:24, Lee Chee Yang wrote:
>
> Hi
>
> We are pleased to announce the Yocto Project 4.0.11 Release is now 
> available for download.
>
> http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.11/poky-fc697fe87412b9b179ae3a68d266ace85bb1fcc6.tar.bz2
>
> http://mirrors.kernel.org/yocto/yocto/yocto-4.0.11/poky-fc697fe87412b9b179ae3a68d266ace85bb1fcc6.tar.bz2
>
> A gpg signed version of these release notes is available at:
>
> http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.11/RELEASENOTES
>
> Full Test Report:
>
> http://downloads.yoctoproject.org/releases/yocto/yocto-4.0.11/testreport.txt
>
> Thank you for everyone's contributions to this release.
>
> Chee Yang
>
> chee.yang.lee@intel.com
>
> Yocto Project Build and Release
>
>
>
> - --------------------------
>
> yocto-4.0.11 Release Notes
>
> - --------------------------
>

Thanks for the release! Don't you have the release notes in rst format 
as well?
I can make them from the text version, but your scripts are probably 
more efficient...

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


