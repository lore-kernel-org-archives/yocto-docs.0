Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1485EFCE084
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 13:53:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70390.1772114012092328045
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 05:53:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mN6amQhQ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 37F691A13C4;
	Thu, 26 Feb 2026 13:53:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E2B95FDEB;
	Thu, 26 Feb 2026 13:53:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D61CC10369377;
	Thu, 26 Feb 2026 14:53:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772114009; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=T8vpXpenWfTEU9elpJu3+DsCUAYjosJ1vKNNGs7o1Y4=;
	b=mN6amQhQhpmxoA3sIXqlFL8aVBfLxMAY8p85j2C0jIOoKGBRXraS5YYnji52rMK08CCKPz
	EjuunOmNCdulz9eQcjK40uDzjY7VmwHoE8eJCb/4OBCpJ3iGinOJzlw0g8K1Cb43EiYk9w
	2Dvqfwe06CxUF7+fMaImrE6B1r5q/WNfa8PgQrXI7IhOcfb2uuWrqi7rc7Y34D7jh5muyB
	sKCc3XER1FAc2j/dPQGyWS74mWS88zIcfgkgOcUVd3AkyD5zhvOIyPOautzIIqfM19fzJL
	r3Kk7qsVXYasGngZdGeZsvhX63GHI7BmHGEs4VENgWAnilqe4h3uP7okt7m9bw==
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 14:53:28 +0100
Message-Id: <DGOXZKODG8PH.19EQQELQAPEO3@bootlin.com>
Subject: Re: [docs] [PATCH 2/2] Makefile: add a releases.json target
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260225-releases-json-v1-0-fee3f01b9197@bootlin.com>
 <20260225-releases-json-v1-2-fee3f01b9197@bootlin.com>
 <34206d2c-7f89-45ce-9db2-e363d24e0cb5@cherry.de>
In-Reply-To: <34206d2c-7f89-45ce-9db2-e363d24e0cb5@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Feb 2026 13:53:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8993

Hi,

On Wed Feb 25, 2026 at 3:10 PM CET, Quentin Schulz via lists.yoctoproject.o=
rg wrote:
> Hi Antonin,
>
> Please provide context, what is this helping with?

It's helping when updating this file is needed (but see below).

> On 2/25/26 1:06 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> Add a new releases.json target which can be used to update the
>> releases.json file manually. It is called from the publish target only
>> (which is the one used on the Autobuilder).
>>=20
>> A warning is printed when the file is not up-to-date anymore.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/Makefile                                      | 9 ++++++=
+--
>>   documentation/tools/host_packages_scripts/almalinux_docs.sh | 2 +-
>>   documentation/tools/host_packages_scripts/fedora_docs.sh    | 2 +-
>>   documentation/tools/host_packages_scripts/opensuse_docs.sh  | 2 +-
>>   documentation/tools/host_packages_scripts/ubuntu_docs.sh    | 2 +-
>>   5 files changed, 11 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/documentation/Makefile b/documentation/Makefile
>> index e144a50b4..00c7d957d 100644
>> --- a/documentation/Makefile
>> +++ b/documentation/Makefile
>> @@ -24,9 +24,9 @@ endif
>>   help:
>>   	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(=
O)
>>  =20
>> -.PHONY: all checks help Makefile clean stylecheck publish epub latexpdf
>> +.PHONY: all checks help Makefile clean stylecheck publish epub latexpdf=
 releases.json
>>  =20
>> -publish: Makefile checks epub latexpdf html singlehtml
>> +publish: releases.json Makefile checks epub latexpdf html singlehtml
>>   	rm -rf $(BUILDDIR)/$(DESTDIR)/
>>   	mkdir -p $(BUILDDIR)/$(DESTDIR)/
>>   	cp -r $(BUILDDIR)/html/* $(BUILDDIR)/$(DESTDIR)/
>> @@ -73,6 +73,11 @@ latexpdf: $(PDFs)
>>   	$(SOURCEDIR)/set_versions.py
>>   	buf_size=3D10000000 $(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)"=
 $(SPHINXOPTS) $(O)
>>  =20
>> +releases.json:
>> +	command -v curl jq || echo "curl and jq need to be installed for this =
target"
>> +	curl https://dashboard.yoctoproject.org/releases.json | jq --indent 2 =
>$(SOURCEDIR)/releases.json
>
> Do we really need jq? What is this bringing? It won't be human-consumed=
=20
> anyway, so who cares for the indent?

Updates to this file would possibly be posted on the list. Having them form=
atted
make the diffs readable.

> Why do we need to download the file during the publish state? Cannot we=
=20
> make the autobuilder download the file and put it in the right place?=20
> This will also avoid the case where the file gets changed while the=20
> autobuilder builds one earlier release and the latest one.

That's correct, thanks!

I reconsidered this and opted for a different approach which I'll send shor=
tly.

Antonin

