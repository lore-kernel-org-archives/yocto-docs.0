Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A112E77180
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 17:02:23 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.107083.1733763734323996031
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 09:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QgqPV37+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BC3CFF80D;
	Mon,  9 Dec 2024 17:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733763732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PtdFhe3evyNdQPzRGURXy1NZ4iLrgCPUwaJg1sEhHBE=;
	b=QgqPV37+12AOLK3jW7fkcY/d1CGh85gSGVmLyp3ISRVXQQQZFTJzYQ27bEiK8NqwwV1OcN
	01xTfLmou9f/YQGGo3ycxa13CxuasIDgSca0//Bxu1yXRC8NkhTCikKHGDeBPNcFF6S2l8
	Kp2ew5Ll15h9QEHTl+/s9frgAMsXKxgHBBY6BsMAswXbeTyB/wqoy4EoLf6MUr9cYSpfeB
	VMKoIjwFqx55d0KTC5UfXSx4yzlCjArrNhprdd7PMIlfDJ+0FYNlI7/w+1ohiX3jj5G23i
	c6VYfIzXv/5KI6LR7DMC3a777+2K6BxFHAPTcfqc4ajavylY8lCK+1N76A4PiA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Dec 2024 18:02:11 +0100
Message-Id: <D67BY6U5UGPM.B2AQ5R5NXNID@bootlin.com>
Subject: Re: [yocto-docs PATCH v2 5/6] system-requirements.rst: add
 dependencies for pdf builds
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
 <20241204-update-doc-deps-v2-5-1d9b4063476f@bootlin.com>
 <f6b0c418-bd94-4fc2-a58d-ec7634926fe1@cherry.de>
In-Reply-To: <f6b0c418-bd94-4fc2-a58d-ec7634926fe1@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 09 Dec 2024 17:02:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5905

Hi Quentin,

On Fri Dec 6, 2024 at 3:00 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 12/4/24 1:23 PM, Antonin Godard wrote:
>> With the recent changes from commit
>> bd6265ca323fac547a197bb516dc4a9ef3897508 ("doc: Makefile: add support
>> for xelatex"), the list of dependencies needs to be updated.
>>=20
>> The initial list of dependencies was made for Ubuntu/Debian, and the
>> packages were translated for the other distros using pkgs.org.
>>=20
>> Add them separately from the rest of the dependencies as they pull a
>> _lot_ of additional dependencies (for LaTeX).
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
>>   documentation/poky.yaml.in                       | 47 ++++++++++++++++=
+++++++-
>>   documentation/ref-manual/system-requirements.rst | 27 ++++++++++++++
>>   2 files changed, 73 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
>> index 94849acf9942c7ebddb2ac7f8aaf5eb9d87e0c5b..25385068679a51e0f2e9e516=
b02b62e19e126291 100644
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
>> @@ -129,6 +138,19 @@ FEDORA_HOST_PACKAGES_DOC: >-
>>     texlive-latex-extra
>>     which
>>  =20
>> +FEDORA_HOST_PACKAGES_DOC_PDF: >-
>> +  latexmk
>> +  texlive-collection-fontsextra
>> +  texlive-collection-fontsrecommended
>> +  texlive-collection-lang*
>
> Please use single quotes to surround texlive-collection-lang* otherwise=
=20
> it may be interpreted by the shell, c.f. for me:
>
> ```sh
> $ sudo dnf install texlive-collection-lang*
> zsh: no matches found: libgpiod*
> ```
>
> while `sudo dnf install 'texlive-collection-lang*'` works just fine.
>
> Ditto for the other occurrences later in this diff.

So I had issues with this in the container scripts, which is why I left it =
at
that. I initially single quoted this but it didn't work. Are you sure you c=
an
mix non-quotes and quoted strings here? I'll give a try, might be specific =
to
the dockerfile.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

