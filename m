Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F91F55810
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 10:59:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16591.1776682769940748555
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 03:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PMmrOGTp;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 34B011A336F;
	Mon, 20 Apr 2026 10:59:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0B2D55FFA5;
	Mon, 20 Apr 2026 10:59:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3EA21046106B;
	Mon, 20 Apr 2026 12:59:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776682767; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5b6CqkAzTkhzeMPuf6isdZIAtdWX513yynIB1RWL88Q=;
	b=PMmrOGTp2KaJclDur6LLjihuga08yWQFETd29sHkxzHTRVGsfb+HMIdRtgNXegAWGKaxD7
	nw0Ax0WE8PMfYwYEdd4vEIV2JxZJy/rQCz/beWRIysxmAi4CXgiPSXEPyiRW+mJiXpQLZy
	OF1/bxJiETtJesuiJUZiT0kgsJ44csNU/1+u/oBK6Ir419f/+76oGjY4+THFO/upLQd/2F
	A2p5De2lR6bBmkWH2kItJbygqIGy1VIz43d9/0XqBi7U0/JyuCYP1LAqH+m+6oCdHcoMFV
	09bkwBICtSyiR/cYUet8w0nDiUHsIUEGhsmY7x93F+O/xF5dexgJUa4QpOcOaw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 12:59:26 +0200
Message-Id: <DHXXH7A01PTC.3CMAZLPRFOOUG@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2 1/2] ref-manual/system-requirements.rst: make
 python3-websockets a default host requirement
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
References: <20260420-python3-websockets-requirement-v2-0-a273a01a6f44@bootlin.com> <20260420-python3-websockets-requirement-v2-1-a273a01a6f44@bootlin.com> <20adf95e-b7ee-428c-b0b1-72c3577326f5@cherry.de>
In-Reply-To: <20adf95e-b7ee-428c-b0b1-72c3577326f5@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 10:59:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9289

Hi,

On Mon Apr 20, 2026 at 12:43 PM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 4/20/26 11:52 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> When configuring the project through bitbake-setup we can choose the
>> "poky-with-sstate" configuration, which requires the python3-websockets
>> package.
>>=20
>> Add this package as a host requirement (under different names depending
>> on the distro).
>>=20
>> Alma, CentOS, and Rocky have a requirement on the buildtools tarball,
>> which already contains this package, so we don't need to add it for
>> them.
>>=20
>> On Ubuntu 22.04 and Debian 11, the version of python3-websockets
>> provided by the distribution is too old compared to what we need [1].
>> Add a separate set of instructions for these.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/ref-manual/system-requirements.rst   | 28 ++++++++++++++=
++++++++
>>   .../host_packages_scripts/fedora_essential.sh      |  2 +-
>>   .../opensuse_essential_16.0.sh                     |  2 +-
>>   3 files changed, 30 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/documentation/ref-manual/system-requirements.rst b/document=
ation/ref-manual/system-requirements.rst
>> index 298832dd9..baa965573 100644
>> --- a/documentation/ref-manual/system-requirements.rst
>> +++ b/documentation/ref-manual/system-requirements.rst
>> @@ -166,6 +166,34 @@ Ubuntu and Debian
>>  =20
>>   .. include:: ubuntu-debian-host-packages-nodocs.rst
>>  =20
>> +Additionally, on distributions other than Debian 11 and Ubuntu 22.04 (o=
therwise
>> +see note below), install the following package:
>> +
>> +.. code-block:: console
>> +
>> +   $ sudo apt install python3-websockets
>> +
>
> Maybe use apt-get here? I know we have one or the other across the=20
> code-base. For some reason, I can't bring myself to use apt, it always=20
> results in weird behaviors I don't have using apt-get on servers (I=20
> don't run Debian-based on my own machines).

Yes, that's better to use here and also aligns with the rest, thanks!

>> +.. note::
>> +
>> +   On Debian 11 and Ubuntu 22.04, the requirement on the version of
>
> A bit awkward wording to me, would
>
> the minimum version for ``python3-websockets`` is not satisfied...
>
> work better?

Indeed, will rephrase

>> +   ``python3-websockets`` is not satisfied by the host distribution. Th=
is
>> +   package is used for fetching pre-built :ref:`shared state
>> +   <overview-manual/concepts:shared state>` artifacts from upstream Yoc=
to Project
>> +   servers (see :ref:`ref-fragments-core-yocto-sstate-mirror-cdn` for m=
ore
>> +   information).
>> +
>> +   In order to use this feature, you can get the correct version of
>> +   ``python3-websockets`` by either:
>> +
>> +   -  Using a :term:`buildtools` tarball by following the
>> +      :ref:`system-requirements-buildtools` section below.
>> +
>> +   -  Installing ``python3-websockets`` using `Pip <https://pip.pypa.io=
/en/stable/>`__:
>> +
>> +      .. code-block:: console
>> +
>> +         $ pip install websockets
>> +
>
> websockets 9.1 supports Python 3.9 which is available in Debian 11 and=20
> Ubuntu 22.04 so it'll get at least that version (it's not because a=20
> newer version of a package is available on PyPI that your system can=20
> install it; and the opposite is true, you may have a too new Python=20
> version for the last package version available (e.g. tensorflow-lite=20
> isn't compatible with Python 3.14)). Can you check what happens if the=20
> user already has python3-websockets installed on the system and runs=20
> this command? My hunch is it'll not get updated to >=3D9.1 without=20
> -U/--upgrade. Also, running -U will likely break their system if any of=
=20
> the hsot packages depend on that older version of websockets... Maybe we=
=20
> should only be using Python packages from a virtualenv?

Maybe I can state that this it is advised to install it in a virtual enviro=
nment
and avoid the possible gotchas you stated?

>>   Here are the packages needed to build Project documentation manuals:
>>  =20
>>   .. literalinclude:: ../tools/host_packages_scripts/ubuntu_docs.sh
>> diff --git a/documentation/tools/host_packages_scripts/fedora_essential.=
sh b/documentation/tools/host_packages_scripts/fedora_essential.sh
>> index 99e5d2c0b..55b8b704b 100644
>> --- a/documentation/tools/host_packages_scripts/fedora_essential.sh
>> +++ b/documentation/tools/host_packages_scripts/fedora_essential.sh
>> @@ -1 +1 @@
>> -sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils file =
findutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip hostname =
libacl make patch perl perl-Data-Dumper perl-File-Compare perl-File-Copy pe=
rl-FindBin perl-Text-ParseWords perl-Thread-Queue perl-bignum perl-locale p=
ython python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip =
rpcgen socat tar texinfo unzip wget which xz zstd $([ $(rpm -E %fedora) -ge=
 42 ] && echo "util-linux-script")
>> +sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils file =
findutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip hostname =
libacl make patch perl perl-Data-Dumper perl-File-Compare perl-File-Copy pe=
rl-FindBin perl-Text-ParseWords perl-Thread-Queue perl-bignum perl-locale p=
ython python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip =
python3-websockets rpcgen socat tar texinfo unzip wget which xz zstd $([ $(=
rpm -E %fedora) -ge 42 ] && echo "util-linux-script")
>> diff --git a/documentation/tools/host_packages_scripts/opensuse_essentia=
l_16.0.sh b/documentation/tools/host_packages_scripts/opensuse_essential_16=
.0.sh
>> index e557ae4fb..96bdd9317 100644
>> --- a/documentation/tools/host_packages_scripts/opensuse_essential_16.0.=
sh
>> +++ b/documentation/tools/host_packages_scripts/opensuse_essential_16.0.=
sh
>> @@ -1 +1 @@
>> -sudo zypper install bzip2 chrpath diffstat gcc gcc-c++ git gzip hostnam=
e libacl1 make makeinfo patch python3 python3-GitPython python3-Jinja2 pyth=
on3-curses python3-pexpect python3-pip python3-xml rpcgen socat tar wget wh=
ich xz zstd
>> +sudo zypper install bzip2 chrpath diffstat gcc gcc-c++ git gzip hostnam=
e libacl1 make makeinfo patch python3 python3-GitPython python3-Jinja2 pyth=
on3-curses python3-pexpect python3-pip python313-websockets python3-xml rpc=
gen socat tar wget which xz zstd
>
> Can you rather use python3-websockets here?=20
> https://opensuse.pkgs.org/16.0/opensuse-oss/python313-websockets-14.2-160=
000.2.2.aarch64.rpm.html=20
> says it provides and replaces python3-websockets. That should make the=20
> upgrade to the next Leap version easier since I'm assuming it may switch=
=20
> to Python 3.14 by then?

Ah good point, I did not spot that it was a provider of python3-websockets.=
 I'll
correct that.

Thanks,
Antonin

