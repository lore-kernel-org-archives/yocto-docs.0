Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6D2D41C05
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 08:13:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4587.1765440786847934168
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 00:13:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RpNW8cVO;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 97BC0C19347
	for <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 08:12:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 935236068C;
	Thu, 11 Dec 2025 08:13:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E6F5103C8D53;
	Thu, 11 Dec 2025 09:13:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765440784; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Vc+4FdPW5Mkdx8uDObLiml5B35FLMOhr4obktPPF5Gc=;
	b=RpNW8cVOyl4KRj2UHawIuLQizvwHDljf4oZ47frmR5pUBqQBM3FC1gtnP3J4G1r369yHzS
	Iv8GHLIzYO8GZdoMWYisktaNE4/ztFuMZcf70JNX3Ka+EMUd9eSzmSCS66GDsW/nZ4LWpD
	a6pQKGZzfMRXRbrJso92HHMGL0xLexwbxxrth7urJSTa4QxuTQw60Dtw3yLtnWUnLV8B0f
	wO63N73oDyizR1l5BJmZ8+yLtjHVHHW/w22Rx/RC9SMVplsIp/51QUWYwJtOVKn+nDSS9X
	FNVJKRmD7PzeWTyf4D1o4/WFpFpk95yiVEqaGelshxUetMTyst2PkAGEexeUOA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 09:13:01 +0100
Message-Id: <DEV8IYRW4N8I.1TU6E77ZW6TBL@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 3/5] tools/build-docs-container: add CentOS
 Stream 9 support
References: <20251205-build-docs-container-tlmgr-v1-0-de30623e664d@bootlin.com> <20251205-build-docs-container-tlmgr-v1-3-de30623e664d@bootlin.com> <7ad37c04-75cc-4389-9cf5-72b49b001f28@cherry.de>
In-Reply-To: <7ad37c04-75cc-4389-9cf5-72b49b001f28@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 08:13:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8239

Hi,

On Fri Dec 5, 2025 at 4:29 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 12/5/25 3:51 PM, Antonin Godard via lists.yoctoproject.org wrote:
>
> [...]
>
>> diff --git a/documentation/tools/build-docs-container b/documentation/to=
ols/build-docs-container
>> index 7d25b15b9..d753e2153 100755
>> --- a/documentation/tools/build-docs-container
>> +++ b/documentation/tools/build-docs-container
>> @@ -41,6 +41,7 @@ $0 OCI_IMAGE [make arguments...]
>>        - fedora:42
>>        - leap:15.5
>>        - leap:15.6
>> +     - tgagor/centos:stream9
>
> quay.io/centos/centos:stream9 is probably better?
>
> We would need to remove the docker.io prefix from the ARG_FROM and make=
=20
> it configurable but that should be easy to do.

Indeed, I'll do that thanks.

>> diff --git a/documentation/tools/containerfiles/entrypoint b/documentati=
on/tools/containerfiles/entrypoint
>> new file mode 100644
>> index 000000000..97ee93c29
>> --- /dev/null
>> +++ b/documentation/tools/containerfiles/entrypoint
>> @@ -0,0 +1,6 @@
>> +#!/usr/bin/env sh
>> +
>> +tldir=3D/opt/docs-build-tex-tools/tl/bin/x86_64-linux
>> +[ -d $tldir ] && export PATH=3D"$PATH:$tldir"
>> +
>> +make -C documentation/ "$@"
>
> Doesn't
>
> ENV PATH=3D"$PATH:$TEXTOOLDIR/tl/bin/x86_64-linux"
>
> in Containerfile.stream work just fine instead of having to go through=20
> an ENTRYPOINT?

Works nicely! That will allow some simplifications, thanks.

> This also makes the instructions x86_64-only. I have no clue if one can=
=20
> run the current instructions on Aarch64 and make it work, but this for=20
> sure won't help.

Yeah correct, well I will add a warning for that, as I don't think I'll hav=
e the
time to add support for other archs or if even possible with this installer=
.

>> diff --git a/documentation/tools/host_packages_scripts/centosstream_docs=
.sh b/documentation/tools/host_packages_scripts/centosstream_docs.sh
>> new file mode 100644
>> index 000000000..9202afc5b
>> --- /dev/null
>> +++ b/documentation/tools/host_packages_scripts/centosstream_docs.sh
>> @@ -0,0 +1 @@
>> +sudo dnf install -y git glibc-locale-source librsvg2-tools make python3=
-pip which
>> diff --git a/documentation/tools/host_packages_scripts/centosstream_esse=
ntial.sh b/documentation/tools/host_packages_scripts/centosstream_essential=
.sh
>> new file mode 100644
>> index 000000000..e38fa93c2
>> --- /dev/null
>> +++ b/documentation/tools/host_packages_scripts/centosstream_essential.s=
h
>> @@ -0,0 +1,5 @@
>> +sudo dnf install -y epel-release
>> +sudo yum install -y dnf-plugins-core
>> +sudo dnf config-manager --set-enabled crb
>> +sudo dnf makecache
>> +sudo dnf install -y bzip2 ccache chrpath cpio cpp diffstat diffutils ga=
wk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip libacl make patch per=
l perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue python3 python3-G=
itPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinf=
o unzip wget which xz zstd
>> diff --git a/documentation/tools/host_packages_scripts/tlmgr_docs_pdf.sh=
 b/documentation/tools/host_packages_scripts/tlmgr_docs_pdf.sh
>> new file mode 100644
>> index 000000000..f3b81da3e
>> --- /dev/null
>> +++ b/documentation/tools/host_packages_scripts/tlmgr_docs_pdf.sh
>> @@ -0,0 +1,7 @@
>> +textooldir=3D${TEXTOOLDIR:-"./docs-build-tex-tools"}
>> +mkdir -p "$textooldir"/tl
>> +wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.g=
z -O "$textooldir"/install-tl-unx.tar.gz
>> +zcat < "$textooldir"/install-tl-unx.tar.gz | tar xf - -C "$textooldir"
>
> Can't this simply be
>
> tar xzf "$textooldir"/install-tl-unx.tar.gz -C "$textooldir"

It can! Thanks.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


