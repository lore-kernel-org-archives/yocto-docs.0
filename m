Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E867FD6EC13
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 14:06:34 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.115619.1732889190315739065
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 06:06:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=hslJ3Ufv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D6721C000A;
	Fri, 29 Nov 2024 14:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732889188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y82QD1U6PStlpETmadT8D1+V0IdPi6o/XGEKBuDMMDY=;
	b=hslJ3Ufvs676LnWrAYv8q8eT8o80o2ubf88BGYp1T44qs/nB5pAd9NG0VMSvS7dYC4tuUV
	Zj9f3ay77biIlTToBGVKnRWBRQAiFZmu3NK1+er5tfTIpLZM+SBmwZT2eT9e1Twj2ihzvD
	81l/lFKqDYiobMXWm0sfkhI7fV7JSu7dRcjZJovu+sLxNCSUcAlcYj+xZY4mjp3gX2gkKY
	OuJRpJVlaNzvmYvEcjRNFndcnGMLUXj8Z4EpdZxurvKDnl/nzZr4f0tBkEai1U3WCKZB5Y
	8ER9ia2UgKe7p3gFMnsrYT+jQuwDSWd8mqITKhoFbI1ifEgyXKzQk2OMyysmsQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Nov 2024 15:06:28 +0100
Message-Id: <D5YPY70W5K4J.2AO8VVYX9XIL4@bootlin.com>
Subject: Re: [docs] [yocto-docs PATCH 5/5] poky.yaml.in: add missing locales
 dependency
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
 <20241120-update-doc-deps-v1-5-50e267ae4123@bootlin.com>
 <23c7eedc-7085-4f83-8786-82b0ff193fa2@cherry.de>
In-Reply-To: <23c7eedc-7085-4f83-8786-82b0ff193fa2@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Nov 2024 14:06:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5854

Hi Quentin,

On Mon Nov 25, 2024 at 7:12 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 11/20/24 4:10 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> This is a requirement for building the documentation, otherwise we get
>> (on Ubuntu 24.04):
>>=20
>>      File "/usr/lib/python3.12/locale.py", line 615, in setlocale
>>        return _setlocale(category, locale)
>>               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>    locale.Error: unsupported locale setting
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/poky.yaml.in | 4 ++++
>>   1 file changed, 4 insertions(+)
>>=20
>> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
>> index d95b73c74ad7979609c6e7f4e1be5343968da743..0158203da7d4db9eadf21943=
d10256c6bc49a290 100644
>> --- a/documentation/poky.yaml.in
>> +++ b/documentation/poky.yaml.in
>> @@ -63,6 +63,7 @@ UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL: >-
>>   UBUNTU_DEBIAN_HOST_PACKAGES_DOC: >-
>>     git
>>     librsvg2-bin
>> +  locales
>>     make
>>     python3-saneyaml
>>     python3-sphinx-rtd-theme
>> @@ -135,6 +136,7 @@ FEDORA_HOST_PACKAGES_DOC: >-
>>     python3-saneyaml
>>     python3-sphinx-rtd-theme
>>     git
>> +  glibc-locale-source
>>     make
>>     python3-pip
>>     which
>> @@ -203,6 +205,7 @@ OPENSUSE_PIP3_HOST_PACKAGES_ESSENTIAL: GitPython
>>  =20
>>   OPENSUSE_HOST_PACKAGES_DOC: >-
>>     git
>> +  glibc-i18ndata
>>     rsvg-convert
>>     make
>>     python3-pip
>> @@ -286,6 +289,7 @@ ALMALINUX_HOST_PACKAGES_ESSENTIAL_CMDS: |-
>>  =20
>>   ALMALINUX_HOST_PACKAGES_DOC: >-
>>     git
>> +  olibc-locale-source
>
> I believe this is a typo here and should read glibc-locale-source?

Totally, thank you for noticing this.


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

