Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E57C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 16:52:23 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.29702.1658163137404587341
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Jul 2022 09:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ixXhxFB2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6E8FB20007;
	Mon, 18 Jul 2022 16:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658163135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jXPqO8ctRslPuimYGix1uFCsQBQ2HQCn9UPMg7sfVAg=;
	b=ixXhxFB2y6EQS8iBIZpd0VD/kXnNWUmMradTbbcVSmheL6JpT4l5OpjXdiz7mUIGZKqfZP
	WxBItZ6jsatUO+wk5Zt/YAKwBJiCvAwkliHtxYa633gvC+XIpKnaSv6xJfapkUMVhVqboP
	ZNZffk4371/eLuERTKu3aSncxgLF+g8Jka2nC/cNU+3o5JNCn8x37/sA2jO2kBNrCIwIgT
	aTh9q91AuLWPUl8L6BVKmE3PkDx66HfxHzDEOKD81EQ1wG18MmEKOBbu7bQQWYBJ3FJCY5
	KF36HP08SS6t1GfBXIdqlmWZ4FysLbu1++kCNlZ6vGc0OgGH2MIm2u38noULfg==
Message-ID: <4a6352b0-cb7f-2e7b-138f-958a2fd43289@bootlin.com>
Date: Mon, 18 Jul 2022 18:52:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration guides: release notes for 4.0.2
Content-Language: en-US
To: Lee Chee Yang <chee.yang.lee@intel.com>
References: <20220708112633.2761010-1-chee.yang.lee@intel.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220708112633.2761010-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Jul 2022 16:52:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3063

Hi Lee

Many thanks for these new release notes in Sphinx format! This really 
made things simpler :)
See my minor comments below.

On 7/8/22 13:26, Lee Chee Yang wrote:
> +++ b/documentation/migration-guides/release-notes-4.0.2.rst
...
>
> +yocto-docs
> +
> +-  Repository Location: https://git.yoctoproject.org/git/yocto-docs
> +-  Branch: :yocto_git:`kirkstone </yocto-docs/log/?h=kirkstone>`
> +-  Tag: :yocto_git:`yocto-4.0.2 </yocto-docs/log/?h=yocto-4.0.2>`
> +-  Git Revision: :yocto_git:`TBD </yocto-docs/commit/?id=662294dccd028828d5c7e9fd8f5c8e14df53df4b>`


Oops, your script (I assume) generated "TBD" instead of the commit id 
here. I fixed it manually this time.

> +
> +Security Fixes in Yocto-4.0.2
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +-  libxslt: Mark :cve:`2022-29824` as not applying
> +-  tiff: Add jbig PACKAGECONFIG and clarify IGNORE :cve:`2022-1210`
> +-  tiff: mark :cve:`2022-1622` and :cve:`2022-1623` as invalid
> +-  pcre2:fix :cve:`2022-1586` Out-of-bounds read
> +-  curl: fix :cve:`2022-22576` :cve:`2022-27775` :cve:`2022-27776` :cve:`2022-27774` :cve:`2022-30115` :cve:`2022-27780` :cve:`2022-27781` :cve:`2022-27779` :cve:`2022-27782`
> +-  qemu: fix :cve:`2021-4206` :cve:`2021-4207`
> +-  freetype: fix :cve:`2022-27404` :cve:`2022-27405` :cve:`2022-27406`


When multiple CVEs are referred to, would it be possible to add commas 
between them, and "and" before the last one? No problem for me to do 
this manually for the moment.

Last thing... Would it be possible to change the order of the sections, 
like in the previous Sphinx release notes? I think that the most 
relevant information (fixes and changes) should come first. Here's the 
order I've used so far:

 1. Security fixes
 2. Fixes
 3. Known issues
 4. Contributors
 5. Repositories / Downloads

I made the changes manually again, no problem.
Your commit is now in master-next.

Many thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


