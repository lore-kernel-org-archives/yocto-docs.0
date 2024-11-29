Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C56D6EC12
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 14:06:34 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.115618.1732889188993516046
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 06:06:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=b3Cg36VE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0B63FF80D;
	Fri, 29 Nov 2024 14:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732889187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UEsgQvLqVAG73q4QHN+l3kZuphp89ttL2T8zU4OJdvA=;
	b=b3Cg36VEmRNyXXEp0odBY352X3L2z5HFAzJCBZdPTqt6IANTdsdha0wJX7J8n1bXOCh5xf
	1UdMUZWUaFsru4pvKuTE++9MNfn6a0lFqIbOzmgklrt1TsflFPxj0S9qnETrSrErLTgCOX
	0Y6ZLPq8GUet3c6LDsKOcMYOxJeU50LLcIGnryU3NWZGOn8rpzhZEyhqnvpuK+pjZsNXj2
	jdEo4V4X2QEEY7ZrsMKKQbIPL7y+YAJUE/lq3v4vES9Oe6pCtOXxQuYPst/r2P9z3SJhD6
	n6xXgE/mcLaKTQAOoOTgdrr2RlAMaxM4aXHq300isn3zE6M8sKegs7ao7oGiNA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Nov 2024 15:06:26 +0100
Message-Id: <D5YPY67J862H.XCE8HJIWX48N@bootlin.com>
Subject: Re: [docs] [yocto-docs PATCH 4/5] system-requirements.rst: add
 dependencies for pdf builds
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
 <20241120-update-doc-deps-v1-4-50e267ae4123@bootlin.com>
 <fd1c29ef-20f8-49d1-8c72-92359a16b894@cherry.de>
In-Reply-To: <fd1c29ef-20f8-49d1-8c72-92359a16b894@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Nov 2024 14:06:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5853

Hi Quentin,

On Mon Nov 25, 2024 at 7:11 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 11/20/24 4:10 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> With the recent changes from commit
>> bd6265ca323fac547a197bb516dc4a9ef3897508 ("doc: Makefile: add support
>> for xelatex"), the list of dependencies needs to be updated.
>>=20
>> The initial list of dependencies was made for Ubuntu/Debian, and the
>> packages were translated for the other distros using pkgs.org.
>>=20
>> Add them separately from the rest of the dependencies as they pull a
>> _lot_ of additional dependencies (for latex).
>>=20
>> Notes:
>> - Fedora/OpenSUSE do not have the "lang-all" texlive collection, so
>>    install all available languages.
>> - AlmaLinux does not seem to provide texlive-collection-fontsextra,
>>    texlive-collection-lang*, and texlive-collection-latexextra, so add a
>>    warning about that.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/poky.yaml.in                       | 79 ++++++++++++++++=
+++++++-
>>   documentation/ref-manual/system-requirements.rst | 27 ++++++++
>>   2 files changed, 105 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
>> index d0c8973db27340838f78f560c01d44fb67771b25..d95b73c74ad7979609c6e7f4=
e1be5343968da743 100644
>> --- a/documentation/poky.yaml.in
>> +++ b/documentation/poky.yaml.in
>> @@ -67,8 +67,17 @@ UBUNTU_DEBIAN_HOST_PACKAGES_DOC: >-
>>     python3-saneyaml
>>     python3-sphinx-rtd-theme
>>     sphinx
>> -  texlive-latex-extra
>>  =20
>> +UBUNTU_DEBIAN_HOST_PACKAGES_DOC_PDF: >-
>> +  fonts-freefont-otf
>> +  latexmk
>> +  tex-gyre
>> +  texlive-fonts-extra
>> +  texlive-fonts-recommended
>> +  texlive-lang-all
>> +  texlive-latex-extra
>> +  texlive-latex-recommended
>> +  texlive-xetex
>>  =20
>>   FEDORA_HOST_PACKAGES_ESSENTIAL: >-
>>     bzip2
>> @@ -131,6 +140,35 @@ FEDORA_HOST_PACKAGES_DOC: >-
>>     which
>>     texlive-fncychap
>>  =20
>> +FEDORA_HOST_PACKAGES_DOC_PDF: >-
>> +  latexmk
>> +  texlive-collection-fontsextra
>> +  texlive-collection-fontsrecommended
>> +  texlive-collection-langarabic
>> +  texlive-collection-langchinese
>> +  texlive-collection-langcjk
>> +  texlive-collection-langcyrillic
>> +  texlive-collection-langczechslovak
>> +  texlive-collection-langenglish
>> +  texlive-collection-langeuropean
>> +  texlive-collection-langfrench
>> +  texlive-collection-langgerman
>> +  texlive-collection-langgreek
>> +  texlive-collection-langitalian
>> +  texlive-collection-langjapanese
>> +  texlive-collection-langkorean
>> +  texlive-collection-langother
>> +  texlive-collection-langpolish
>> +  texlive-collection-langportuguese
>> +  texlive-collection-langspanish
>
> I'm wondering if we really need all languages or if we were too lazy to=
=20
> figure out which ones we actually need.

Actually, I'd go with all of them... the initial reason for including those=
 is
because contributors in the release notes may have names with international
characters. I'd include them all "to be safe" and avoid wondering about LaT=
eX
errors later.

> Also, you should be able to avoid listing them all by using=20
> 'texlive-collection-lang*', dnf should be able to handle that just fine.

Thanks for the tip. I should be able to test that with my container scripts=
 soon :)

>> +  texlive-collection-latex
>> +  texlive-collection-latexextra
>> +  texlive-collection-latexrecommended
>
> latex-extra already requires latex-recommended which already requires=20
> latex so only the former is necessary.

+1


Thank you,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

