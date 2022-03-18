Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A73C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 06:47:28 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.6933.1647586047581099239
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Mar 2022 23:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.197,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 146961C0008;
	Fri, 18 Mar 2022 06:47:24 +0000 (UTC)
Date: Fri, 18 Mar 2022 07:47:22 +0100
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org,
 Michael Halstead <mhalstead@linuxfoundation.org>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] Version bump before release
In-Reply-To: 
 <CADfgfobCTXyBYSSjekdKJp4ekrmHWH+imjpARMrCMLp2gwTr5w@mail.gmail.com>
References: 
 <CADfgfobCTXyBYSSjekdKJp4ekrmHWH+imjpARMrCMLp2gwTr5w@mail.gmail.com>
Message-ID: <14D40357-15CC-46D2-B63A-66AED89F291F@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Mar 2022 06:47:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2622

Hi all,

On March 18, 2022 1:04:32 AM GMT+01:00, Michael Halstead <mhalstead@linuxf=
oundation=2Eorg> wrote:
>Hello,
>In the past we've correctly bumped the versions in the yocto-docs release
>branches before the release build and I only need to update the master
>branch to update the switcher on the website=2E This doesn't happen relia=
bly
>though and we've been having to patch the build system to make the docs
>build correctly=2E
>
>Ideally all that would be needed at release time is a patch like
>https://git=2Eyoctoproject=2Eorg/yocto-docs/commit/?id=3D78545b8f42657c21=
bc3cac96429d3950b07a3aca
>to update the website=2E
>

For the new releases (not the dot releases), it is essential this patch is=
 merged with correct infos before tagging, specifically the poky=2Eyaml fil=
e=2E

For dot releases, what matters is the bump of the dot release in poky=2Eya=
ml, the rest of the changes aren't that important because it's impossible t=
o always keep it up-to-date=2E

releases=2Erst and switchers=2Ejs are taken from master for all builds any=
ways by yocto-autobuilder-help so we don't technically have to worry about =
those making it before tagging day=2E Those need to make it to the master b=
ranch as soon as possible though (basically after tagging)=2E

Two changes to conf=2Epy need to be done too for releases=2E current_versi=
on needs to be bumped and bitbake_version to be set=2E

>Lately I've also had to make patches like these as well during release:
>
>https://git=2Eyoctoproject=2Eorg/yocto-autobuilder-helper/commit/?id=3Dca=
8e95276d96b94d97e269b0f4f9ad306f8417d7
>https://git=2Eyoctoproject=2Eorg/yocto-docs/commit/?h=3Dhonister&id=3D798=
0cfe942a1c8ceb3fd6b003ec6346d9bc11015
>(honister branch)
>

What is REALLY important is to get the current_version and bitbake_version=
 correct in conf=2Epy=2E poky=2Eyaml changes might be required too but I ha=
ven't checked yet=2E

>What process can we put in place to make sure these version bumps happen =
on
>the named branch before the release candidate builds?
>
>Richard suggested a test that would make RC builds fail if the docs versi=
on
>were outdated=2E Any idea how to write that test?

Check the content of conf=2Epy that current_version is NOT dev and that bi=
tbake_version is set=2E Not sure how to detect a pre-release not having the=
 current_version bumped though=2E

If current_version is set, extract it and make sure it's used in poky=2Eya=
ml=2E

Cheers,
Quentin

> What other ideas come
>to mind?
>
>Thank you,

