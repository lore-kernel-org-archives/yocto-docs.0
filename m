Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B25EE7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 17:02:23 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.106897.1733763733195076781
 for <docs@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 09:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JTBkNjsD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D013C0007;
	Mon,  9 Dec 2024 17:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733763731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fdQyVYVALH3REhSX1gNEu8xY8U/xI0njhUJ0vonwdyo=;
	b=JTBkNjsD7kqkOwwx4dmi+DYt7OGbPdRpLr/+YmSWeD0J50HH5FiCySBAqiBru8Kd0V7xPM
	js7xYDmvTdEzI0nhYLwHaeDPNyVMDt7ByTaAokzMvhE3uPZaJkYOwpQpju2o5RDOvAl8HY
	/pzXOR7al1LCjxlSNLdxiPvc8Uo3drwf27fH7HtS+lPKIvnN6q7Uvrf0BCL8654rfBA+Rw
	Nf1dQpelhBSExIWy3NtD9Jqy9UHD2L1aHoDf+77mwsUfK1cjZq0SjdmoANa/88ISMQyzaS
	wtcghIeEKe0YMq+P/lKyZlUEkb1xfMvX3XjiunEq//Zr+ztd+S+P8N6DKqrMzA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Dec 2024 18:02:10 +0100
Message-Id: <D67BY6ERMIWY.5WMB41MN18TJ@bootlin.com>
Subject: Re: [yocto-docs PATCH v2 1/6] Gather dependencies in poky.yaml.in
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
 <20241204-update-doc-deps-v2-1-1d9b4063476f@bootlin.com>
 <bbe9f42c-e716-44d7-8930-71a44c4c9a36@cherry.de>
In-Reply-To: <bbe9f42c-e716-44d7-8930-71a44c4c9a36@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 09 Dec 2024 17:02:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5903

Hi Quentin,

On Fri Dec 6, 2024 at 2:51 PM CET, Quentin Schulz wrote:
[...]
>> +FEDORA_HOST_PACKAGES_ESSENTIAL: >-
>> +  bzip2
>> +  ccache
>
> I'm wondering if this is really required?

I'm not sure either. For now, this series focuses on updating the dependenc=
ies
for the recent PDF additions. Optimizing this list will require more work, =
and
is related to an open bug on bugzilla
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14873).

I'm trying to get a clean base and a helper container script in to make thi=
s
easier for me and others to do this (adding/removing things from the list).

But I will definitely go back to your comments as you are indeed pointing o=
ut
things that might be unneeded now, indeed.

>> +  chrpath
>> +  cpio
>> +  cpp
>> +  diffstat
>> +  diffutils
>> +  file
>> +  findutils
>> +  gawk
>> +  gcc
>> +  gcc-c++
>> +  git
>> +  glibc-devel
>> +  glibc-langpack-en
>> +  gzip
>> +  hostname
>> +  libacl
>> +  lz4
>> +  make
>> +  patch
>> +  perl
>> +  perl-Data-Dumper
>> +  perl-File-Compare
>> +  perl-File-Copy
>> +  perl-FindBin
>> +  perl-Text-ParseWords
>> +  perl-Thread-Queue
>> +  perl-bignum
>> +  perl-locale
>> +  python
>
> I'm wondering if this is required? I guess the times we could have=20
> python3 and python2 code mixed is over?
>
>> +  python3
>> +  python3-GitPython
>> +  python3-jinja2
>> +  python3-pexpect
>> +  python3-pip
>> +  rpcgen
>> +  socat
>> +  tar
>> +  texinfo
>> +  unzip
>> +  wget
>> +  which
>> +  xz
>> +  zstd
>> +
>> +FEDORA_HOST_PACKAGES_DOC: >-
>> +  git
>> +  inkscape
>> +  make
>> +  python3-pip
>> +  python3-saneyaml
>> +  python3-sphinx-rtd-theme
>> +  sphinx
>
> The three packages above are supposed to be coming from pip according to=
=20
> the current version of the instructions.

You're right, I guess I mixed things up with the Ubuntu instructions. I thi=
nk
initially I wanted to provide a common base for all distros but it's not a =
good
idea. I'll revert this and keep the same content as in the previous instruc=
tions.

>> +  texlive-fncychap
>> +  texlive-latex-extra
>
> This isn't currently part of the instructions.
>
>> +  which
>> +
>> +OPENSUSE_HOST_PACKAGES_ESSENTIAL: >-
>> +  bzip2
>> +  chrpath
>> +  diffstat
>> +  gcc
>> +  gcc-c++
>> +  git
>> +  gzip
>> +  hostname
>> +  libacl1
>> +  lz4
>> +  make
>> +  makeinfo
>> +  patch
>> +  python
>> +  python-curses
>
> Ditto for python and python-curses, especialy since we have=20
> python3-curses below.
>
>> +  python-xml
>> +  python3
>> +  python3-Jinja2
>> +  python3-curses
>> +  python3-pexpect
>> +  python3-pip
>> +  rpcgen
>> +  socat
>> +  tar
>> +  wget
>> +  which
>> +  xz
>> +  zstd
>> +
>> +OPENSUSE_PIP3_HOST_PACKAGES_ESSENTIAL: GitPython
>> +
>> +OPENSUSE_HOST_PACKAGES_DOC: >-
>> +  git
>> +  inkscape
>> +  make
>> +  python3-pip
>> +  texlive-fncychap
>> +  which
>> +
>> +ALMALINUX_HOST_PACKAGES_ESSENTIAL: >-
>> +  bzip2
>> +  ccache
>
> This is aligned with Fedora but I'm still wondering if it actually is a=
=20
> requirement (well, if you INHERIT ccache, yes).
>
>> +  chrpath
>> +  cpio
>> +  cpp
>> +  diffstat
>> +  diffutils
>> +  gawk
>> +  gcc
>> +  gcc-c++
>> +  git
>> +  glibc-devel
>> +  glibc-langpack-en
>> +  gzip
>
> The original list had "install" but it's gone here, on purpose?

No, must be a mistake from me.


Thanks!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

