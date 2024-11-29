Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA933D6EC0E
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 14:06:34 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.115616.1732889186426577487
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 06:06:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bPzu6vMg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48B8740007;
	Fri, 29 Nov 2024 14:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732889184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MR4Wv7YuWA21+9BUjScojcmNuEbdZKuzUaHAiP4Aq8g=;
	b=bPzu6vMgIIOd84E1Z9lG0TJdK/abZdgTyl2+JpQhMJoFJXlj8KNTPnttb/X5rcluMW4ioK
	TRsmA0td8oVL4JSUiXKHDS+H6rJkWLP2XzHwXM/srDi+MuDtGAKy4vw1Gr2wpf96N+wOBv
	oG7TJxnLu+M+CGFKLlKba5VttjX/b3l2A7p8k77p9ZUAh6LJwC7sf3npR5GffJPHEgeu3w
	D5h3yO6Ml8Xv4TJ+cVqG9qWmTfmCjou+pm+sBPOGgrNvb0X68v8NFe/xH2bPWf/soujuof
	LNjfEZ58+eVQFXxmeH9u7T42q9qiCnJRdWer+b2uprWgKngiGKxLSC3nsUZ7wQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Nov 2024 15:06:23 +0100
Message-Id: <D5YPY51XWRR9.1V6FJRX4487AI@bootlin.com>
Subject: Re: [docs] [yocto-docs PATCH 2/5] poky.yaml.in: replace inkscape
 dependency by librsvg2-bin
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
 <20241120-update-doc-deps-v1-2-50e267ae4123@bootlin.com>
 <2ddb847f-9290-4e65-b265-8d2bdb918831@cherry.de>
In-Reply-To: <2ddb847f-9290-4e65-b265-8d2bdb918831@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Nov 2024 14:06:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5851

Hi Quentin,

On Mon Nov 25, 2024 at 6:58 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 11/20/24 4:10 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> inkscape used to be a requirement to convert SVG images to PNGs/PDFs,
>> but we replaced it recently by rsvg-convert.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/poky.yaml.in | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
>> index b840320a89bfadb259d5d9d0e11f951c55e13389..d0c8973db27340838f78f560=
c01d44fb67771b25 100644
>> --- a/documentation/poky.yaml.in
>> +++ b/documentation/poky.yaml.in
>> @@ -62,7 +62,7 @@ UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL: >-
>>  =20
>>   UBUNTU_DEBIAN_HOST_PACKAGES_DOC: >-
>>     git
>> -  inkscape
>> +  librsvg2-bin
>>     make
>>     python3-saneyaml
>>     python3-sphinx-rtd-theme
>> @@ -120,7 +120,7 @@ FEDORA_HOST_PACKAGES_ESSENTIAL: >-
>>   FEDORA_HOST_PACKAGES_DOC: >-
>>     git
>>     make
>> -  inkscape
>> +  librsvg2-tools
>>     texlive-latex-extra
>>     sphinx
>>     python3-saneyaml
>> @@ -165,7 +165,7 @@ OPENSUSE_PIP3_HOST_PACKAGES_ESSENTIAL: GitPython
>>  =20
>>   OPENSUSE_HOST_PACKAGES_DOC: >-
>>     git
>> -  inkscape
>> +  rsvg-convert
>
> thought: maybe keep the packages alphabetically ordered?

Ha yes, that was my initial plan, missed that :)

> Otherwise pkgs.org agrees with this change, so
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

