Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C99CD6EC10
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 14:06:25 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.116346.1732889183306218964
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 06:06:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=j4jgrCCD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1755C24001E;
	Fri, 29 Nov 2024 14:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732889181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EZuPuoS+gPseVUPbF+2hSXIOTrYIOUpX8iTE1vmCtv4=;
	b=j4jgrCCDX38l4ucMFMqJAdYIdaDz1AnrIwuEe5LSzQpuRljCOHloQhbotZCKwe5dPhbQJ0
	VYu6By2k8ADbOaYRkfW5oGaMNmIof1oWY1iatlYL4TbboYV1T+kOAqNkkV1tYM6LSZv2J0
	gCGekiNtmc6Wz/yKt9BETz3+SRPQtX1yeIH6JHHA86ffDr2pXxQYQCYh6AzGeCEv4URUxw
	Ciqf8ihLhx6yVzbBoorHl8vMI+Tt1f0bVyeMiBJtQQBmypzZyYXehP5XhI2cPA1Ozn6PgU
	bDWn+XbXIcrzKDgR4s3tNwdyK30Muu6sGQ8qsJlElnWFcefs9E61CCjMs8THqg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Nov 2024 15:06:20 +0100
Message-Id: <D5YPY3NDWDHV.RWVHIE7HDBFR@bootlin.com>
Subject: Re: [docs] [yocto-docs PATCH 1/5] Gather dependencies in
 poky.yaml.in
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
 <20241120-update-doc-deps-v1-1-50e267ae4123@bootlin.com>
 <86bd7352-1a33-492d-8308-c2eeff6b4a71@cherry.de>
In-Reply-To: <86bd7352-1a33-492d-8308-c2eeff6b4a71@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Nov 2024 14:06:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5850

Hi Quentin,

On Mon Nov 25, 2024 at 6:55 PM CET, Quentin Schulz wrote:
[...]
>> diff --git a/documentation/ref-manual/system-requirements.rst b/document=
ation/ref-manual/system-requirements.rst
>> index b33518c7f1e0c76caa70a719e023b9c405b744e2..ca75f849d0ad10344900c752=
5f7163726ffe5400 100644
>> --- a/documentation/ref-manual/system-requirements.rst
>> +++ b/documentation/ref-manual/system-requirements.rst
>> @@ -150,7 +150,7 @@ Ubuntu and Debian
>>   Here are the packages needed to build an image on a headless system
>>   with a supported Ubuntu or Debian Linux distribution::
>>  =20
>> -   $ sudo apt install &UBUNTU_HOST_PACKAGES_ESSENTIAL;
>> +   $ sudo apt install &UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL;
>>  =20
>>   You also need to ensure you have the locale ``en_US.UTF-8`` enabled::
>>  =20
>> @@ -172,8 +172,7 @@ If this is not the case, you can reconfigure the ``l=
ocales`` package to add it::
>>  =20
>>   Here are the packages needed to build Project documentation manuals::
>>  =20
>> -   $ sudo apt install git make inkscape texlive-latex-extra
>> -   $ sudo apt install sphinx python3-saneyaml python3-sphinx-rtd-theme
>> +   $ sudo apt install &UBUNTU_DEBIAN_HOST_PACKAGES_DOC;
>
> Aren't we missing the PIP3_HOST_PACKAGES_DOC here?
>
> Also FYI, using pip on the system level is a very bad practice (as a=20
> matter of fact, it's not even allowed on Debian Bookworm anymore). We=20
> should probably rather document how to do this in virtual environments=20
> for example? One thing after the other though, we can start by just=20
> migrating the docs variable for now :)

Yeah, I am aware it's terrible practice and we shouldn't do that. I'd also
recommend using virtualenvs. I'll take a note of this, and try to send a pa=
tch
soon! :)

>>  =20
>>   Fedora Packages
>>   ---------------
>> @@ -185,8 +184,8 @@ with a supported Fedora Linux distribution::
>>  =20
>>   Here are the packages needed to build Project documentation manuals::
>>  =20
>> -   $ sudo dnf install git make python3-pip which inkscape texlive-fncyc=
hap
>> -   &PIP3_HOST_PACKAGES_DOC;
>> +   $ sudo dnf install &FEDORA_HOST_PACKAGES_DOC;
>> +   $ sudo pip3 install &PIP3_HOST_PACKAGES_DOC;
>>  =20
>>   openSUSE Packages
>>   -----------------
>> @@ -195,11 +194,12 @@ Here are the packages needed to build an image on =
a headless system
>>   with a supported openSUSE distribution::
>>  =20
>>      $ sudo zypper install &OPENSUSE_HOST_PACKAGES_ESSENTIAL;
>> +   $ sudo pip3 install &OPENSUSE_PIP3_HOST_PACKAGES_ESSENTIAL;
>>  =20
>>   Here are the packages needed to build Project documentation manuals::
>>  =20
>> -   $ sudo zypper install git make python3-pip which inkscape texlive-fn=
cychap
>> -   &PIP3_HOST_PACKAGES_DOC;
>> +   $ sudo zypper install &OPENSUSE_HOST_PACKAGES_DOC;
>> +   $ sudo pip3 install &PIP3_HOST_PACKAGES_DOC;
>>  =20
>>  =20
>>   AlmaLinux Packages
>> @@ -208,7 +208,7 @@ AlmaLinux Packages
>>   Here are the packages needed to build an image on a headless system
>>   with a supported AlmaLinux distribution::
>>  =20
>> -   $ sudo dnf install &ALMALINUX_HOST_PACKAGES_ESSENTIAL;
>> +&ALMALINUX_HOST_PACKAGES_ESSENTIAL_CMDS;
>
> It's a bit odd to have a different way to add the packages to install=20
> depending on the distro, couldn't we have all distros have no=20
> indentation, or all have some indentation?

That's the only exception, because Alma Linux has several installation step=
s.
I'd rather keep only the dependency lists in poky.yaml.in, so I'll add the
commands back here, and use ALMALINUX_HOST_PACKAGES_ESSENTIAL in the rst do=
c
instead (just like what's done for the other distros).


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

