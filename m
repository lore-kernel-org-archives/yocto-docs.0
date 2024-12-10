Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07FBEE77180
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 09:33:58 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.6577.1733823236211869981
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 01:33:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oQRuxY/c;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A0EB1BF210;
	Tue, 10 Dec 2024 09:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733823234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=025Jqvp3OwnBPNlVCfOOjbkIQIWbA3lQHtWqIobEz+w=;
	b=oQRuxY/cVgi+uVKnRG8yv1a2jhmB+YdY74yqUUrfBQ6HSZVNxGR2y4WyBVOzsD6jfoKZe3
	F/xAoVInWi5NePxdFPfL4dRGrVHzoqKNGeGgqROCvvPTu+iIwc5vxu/p/UL5LAZkah/2l4
	mHmQf0WGWwTy0ZbTKayYFlMG3Qt/NBcfYFukHYuk1v5jcy19tJuu1a1y96VM6Sqkxsgdus
	exPFt5lGca2ixrz6BWRMlEbk8it7/5UIT9fiKNeT6m31w1N6tFAPErhk0CJDuJzUZCBJNz
	cCbd1oXijm//i4alN7rKJC7/maING7e7P8BLOkFF0koZoZZ4UwQsLBPWJ3+uDw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Dec 2024 10:33:53 +0100
Message-Id: <D67X1HPUBY1E.1H5DBU4OXAURO@bootlin.com>
Subject: Re: [docs] [yocto-docs PATCH v2 5/6] system-requirements.rst: add
 dependencies for pdf builds
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
 <20241204-update-doc-deps-v2-5-1d9b4063476f@bootlin.com>
 <f6b0c418-bd94-4fc2-a58d-ec7634926fe1@cherry.de>
 <D67BY6U5UGPM.B2AQ5R5NXNID@bootlin.com>
 <50f1c8ad-6726-4b14-a440-043cd7a47077@cherry.de>
In-Reply-To: <50f1c8ad-6726-4b14-a440-043cd7a47077@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Dec 2024 09:33:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5908

Hi Quentin,

On Mon Dec 9, 2024 at 6:28 PM CET, Quentin Schulz wrote:
[...]
>>>> +FEDORA_HOST_PACKAGES_DOC_PDF: >-
>>>> +  latexmk
>>>> +  texlive-collection-fontsextra
>>>> +  texlive-collection-fontsrecommended
>>>> +  texlive-collection-lang*
>>>
>>> Please use single quotes to surround texlive-collection-lang* otherwise
>>> it may be interpreted by the shell, c.f. for me:
>>>
>>> ```sh
>>> $ sudo dnf install texlive-collection-lang*
>>> zsh: no matches found: libgpiod*
>>> ```
>>>
>>> while `sudo dnf install 'texlive-collection-lang*'` works just fine.
>>>
>>> Ditto for the other occurrences later in this diff.
>>=20
>> So I had issues with this in the container scripts, which is why I left =
it at
>> that. I initially single quoted this but it didn't work. Are you sure yo=
u can
>
> Can you tell us more about those issues with some error value/messages=20
> or something?
>
>> mix non-quotes and quoted strings here? I'll give a try, might be specif=
ic to
>> the dockerfile.
>>=20
>
> """
> $ sudo dnf install 'texlive-collection-lang*' latexmk
> Updating and loading repositories:
> Repositories loaded.
> Package "texlive-collection-langarabic-11:svn59594-73.fc41.noarch" is=20
> already installed.
> Package "texlive-collection-langchinese-11:svn63995-73.fc41.noarch" is=20
> already installed.
> Package "texlive-collection-langcjk-11:svn65824-73.fc41.noarch" is=20
> already installed.
> Package "texlive-collection-langcyrillic-11:svn54074-73.fc41.noarch" is=
=20
> already installed.
> Package "texlive-collection-langczechslovak-11:svn54074-73.fc41.noarch"=
=20
> is already installed.
> Package "texlive-collection-langenglish-11:svn65496-73.fc41.noarch" is=20
> already installed.
> Package "texlive-collection-langeuropean-11:svn66432-73.fc41.noarch" is=
=20
> already installed.
> Package "texlive-collection-langfrench-11:svn63147-73.fc41.noarch" is=20
> already installed.
> Package "texlive-collection-langgerman-11:svn55706-73.fc41.noarch" is=20
> already installed.
> Package "texlive-collection-langgreek-11:svn65038-73.fc41.noarch" is=20
> already installed.
> Package "texlive-collection-langitalian-11:svn55129-73.fc41.noarch" is=20
> already installed.
> Package "texlive-collection-langjapanese-11:svn64603-73.fc41.noarch" is=
=20
> already installed.
> Package "texlive-collection-langkorean-11:svn54074-73.fc41.noarch" is=20
> already installed.
> Package "texlive-collection-langother-11:svn59564-73.fc41.noarch" is=20
> already installed.
> Package "texlive-collection-langpolish-11:svn54074-73.fc41.noarch" is=20
> already installed.
> Package "texlive-collection-langportuguese-11:svn54074-73.fc41.noarch"=20
> is already installed.
> Package "texlive-collection-langspanish-11:svn54141-73.fc41.noarch" is=20
> already installed.
> Package "latexmk-4.85-2.fc41.noarch" is already installed.
>
> Nothing to do.
> """
>
> Same for latexmk first in the list.
>
> That's for DNF5 (fedora 41 and later).
>
> DNF4 seems to be happy in a fedora 40 container as well:
>
> """
> [root@6f0bdf8b38f2 /]# dnf install latexmk 'texlive-collection-lang*'
> Last metadata expiration check: 0:00:54 ago on Mon Dec  9 17:13:01 2024.
> Dependencies resolved.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   Package                                 Arch   Version=20
>          Repo     Size
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Installing:
>   latexmk                                 noarch 4.85-1.fc40=20
>          updates 454 k
>   texlive-collection-langarabic           noarch 11:svn59594-71.fc40=20
>          fedora  9.7 k
>   texlive-collection-langchinese          noarch 11:svn63995-71.fc40=20
>          fedora   10 k
>   texlive-collection-langcjk              noarch 11:svn65824-71.fc40=20
>          fedora  9.8 k
>   texlive-collection-langcyrillic         noarch 11:svn54074-71.fc40=20
>          fedora   10 k
>   texlive-collection-langczechslovak      noarch 11:svn54074-71.fc40=20
>          fedora  9.4 k
>   texlive-collection-langenglish          noarch 11:svn65496-71.fc40=20
>          fedora   11 k
>   texlive-collection-langeuropean         noarch 11:svn66432-71.fc40=20
>          fedora   11 k
>   texlive-collection-langfrench           noarch 11:svn63147-71.fc40=20
>          fedora   10 k
>   texlive-collection-langgerman           noarch 11:svn55706-71.fc40=20
>          fedora   10 k
>   texlive-collection-langgreek            noarch 11:svn65038-71.fc40=20
>          fedora  9.6 k
>   texlive-collection-langitalian          noarch 11:svn55129-71.fc40=20
>          fedora  9.6 k
>   texlive-collection-langjapanese         noarch 11:svn64603-71.fc40=20
>          fedora   11 k
>   texlive-collection-langkorean           noarch 11:svn54074-71.fc40=20
>          fedora  9.4 k
>   texlive-collection-langother            noarch 11:svn59564-71.fc40=20
>          fedora   11 k
>   texlive-collection-langpolish           noarch 11:svn54074-71.fc40=20
>          fedora  9.5 k
>   texlive-collection-langportuguese       noarch 11:svn54074-71.fc40=20
>          fedora  9.4 k
>   texlive-collection-langspanish          noarch 11:svn54141-71.fc40=20
>          fedora  9.4 k
> [...]
> """
>
> and the other way around:
>
> """
> [root@6f0bdf8b38f2 /]# dnf install 'texlive-collection-lang*' latexmk
> Last metadata expiration check: 0:00:09 ago on Mon Dec  9 17:13:01 2024.
> Dependencies resolved.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   Package                                 Arch   Version=20
>          Repo     Size
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Installing:
>   latexmk                                 noarch 4.85-1.fc40=20
>          updates 454 k
>   texlive-collection-langarabic           noarch 11:svn59594-71.fc40=20
>          fedora  9.7 k
>   texlive-collection-langchinese          noarch 11:svn63995-71.fc40=20
>          fedora   10 k
>   texlive-collection-langcjk              noarch 11:svn65824-71.fc40=20
>          fedora  9.8 k
>   texlive-collection-langcyrillic         noarch 11:svn54074-71.fc40=20
>          fedora   10 k
>   texlive-collection-langczechslovak      noarch 11:svn54074-71.fc40=20
>          fedora  9.4 k
>   texlive-collection-langenglish          noarch 11:svn65496-71.fc40=20
>          fedora   11 k
>   texlive-collection-langeuropean         noarch 11:svn66432-71.fc40=20
>          fedora   11 k
>   texlive-collection-langfrench           noarch 11:svn63147-71.fc40=20
>          fedora   10 k
>   texlive-collection-langgerman           noarch 11:svn55706-71.fc40=20
>          fedora   10 k
>   texlive-collection-langgreek            noarch 11:svn65038-71.fc40=20
>          fedora  9.6 k
>   texlive-collection-langitalian          noarch 11:svn55129-71.fc40=20
>          fedora  9.6 k
>   texlive-collection-langjapanese         noarch 11:svn64603-71.fc40=20
>          fedora   11 k
>   texlive-collection-langkorean           noarch 11:svn54074-71.fc40=20
>          fedora  9.4 k
>   texlive-collection-langother            noarch 11:svn59564-71.fc40=20
>          fedora   11 k
>   texlive-collection-langpolish           noarch 11:svn54074-71.fc40=20
>          fedora  9.5 k
>   texlive-collection-langportuguese       noarch 11:svn54074-71.fc40=20
>          fedora  9.4 k
>   texlive-collection-langspanish          noarch 11:svn54141-71.fc40=20
>          fedora  9.4 k
> [...]
> """
>
> Cheers,
> Quentin

Thanks for taking the time to test this. I guess this works for most shells=
, but
in the context of a Dockerfile I hit this error:

  10.39 No match for argument: 'texlive-collection-lang*'
  10.45 Error: Unable to find a match: 'texlive-collection-lang*'

You can reproduce this by running:

  $ echo "'texlive-collection-lang*'" > /tmp/deps
  $ sudo dnf install $(cat /tmp/deps)

I was able use this instead:

  xargs -a /tmp/deps sudo dnf install

I'll use this instead in Fedora and others. xargs is installed by default i=
n
base Ubuntu/Debian/Fedora containers.


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

