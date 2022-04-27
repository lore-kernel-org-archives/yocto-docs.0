Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBC9C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 17:14:43 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web09.226.1651079674480489662
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 10:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.232,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 9E024200006;
	Wed, 27 Apr 2022 17:14:31 +0000 (UTC)
Date: Wed, 27 Apr 2022 19:14:28 +0200
From: Quentin Schulz <foss+yocto@0leil.net>
To: michael.opdenacker@bootlin.com,
 "Michael Opdenacker via lists.yoctoproject.org"
 <michael.opdenacker=bootlin.com@lists.yoctoproject.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] Sstate cache for version 4.0.999?
In-Reply-To: <8e983999-b237-3881-b5af-e7934193b089@bootlin.com>
References: <6c3311c1-801b-b17a-44a1-ca76017e9e94@bootlin.com>
 <f413500a-5a0e-a17c-5dc4-c702fd2ff1aa@theobroma-systems.com>
 <8e983999-b237-3881-b5af-e7934193b089@bootlin.com>
Message-ID: <96175A10-8D31-4E80-A97B-675A4EDE5610@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 17:14:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2899

Hi Michael,

On April 27, 2022 6:07:41 PM GMT+02:00, "Michael Opdenacker via lists=2Eyo=
ctoproject=2Eorg" <michael=2Eopdenacker=3Dbootlin=2Ecom@lists=2Eyoctoprojec=
t=2Eorg> wrote:
>Hi Quentin,
>
>On 4/27/22 11:59, Quentin Schulz wrote:
>> As a side note, the current default docs being the kirkstone (4=2E0=2E9=
99)
>> branch is something I deem temporary=2E The issue is that the migration
>> manuals and release notes of kirkstone 4=2E0 *tag* are not up-to-date=
=2E
>> The ones in kirkstone branch are up-to-date=2E
>
>
>I guess that is what causes the 4=2E0 documentation to be out of date=2E =
For
>example, in
>https://docs=2Eyoctoproject=2Eorg/4=2E0/migration-guides/migration-4=2E0=
=2Ehtml#release-notes-for-4-0-kirkstone,
>there is still the temporary section called "Changes for release notes"
>(https://docs=2Eyoctoproject=2Eorg/4=2E0/migration-guides/migration-4=2E0=
=2Ehtml#changes-for-release-notes)=2E
>

Yes=2E The tagged commit for 4=2E0 didn't include (some of?) last week's w=
ork which is why it's missing from the release notes=2E

>>
>> I need to write something on the wiki to explain the issue and
>> requirements so we can work on fixing this sooner than later=2E
>
>
>Do we need a 4=2E0 patch for run-docs-build?

It's not technically one patch but more like 6=2E I know which ones to bac=
kport, it was just decided to use kirkstone branch as default page instead =
of 4=2E0 tag=2E This can be revisited I guess?

We can patch if you want but the point is that release and migration manua=
ls are generated from the docs at a given commit which is bad and makes it =
impossible to be up-to-date=2E For example, some fix was sent recently for =
3=2E4 migration manual but it won't make it to 3=2E4 release unless we manu=
ally patch it on yp-autobuilder-helper script=2E This is bad=2E

Also, in 3=2E1 docs, we only have migration manuals and release notes for =
<3=2E1 if I'm not mistaken=2E

I would personally very much be in favor of having migration manuals and r=
elease notes pages common to all versions of the docs=2E

I emitted the idea of using the transition branch for this purpose=2E What=
 I suggested is to have a migration directory for each release where you on=
ly have the migration manual from release n-1 to release n and release note=
s from release n=2E That's it=2E
What is cool with this is that we don't need to remove references or :term=
: of older migration manuals once the variables disappear from Bitbake or Y=
octo glossaries (an issue we recently had)=2E It also directly links to the=
 correct version of Bitbake docs for the links=2E E=2Eg=2E if a variable di=
sappears in n+1, we need to remove the ref/term to it in release n-2, n-1 a=
nd n migration manuals while they shouldn't be=2E

The not so nice thing about this is that the migration manuals and release=
 notes are not part of a given release of the docs anymore, which is not re=
ally acceptable=2E

>Sorry, got lost with all the recent changes=2E

Yeah, we went on a commit spree last week for the docs git repo and run-do=
cs-build=2E It should have fixed a few issues and improved some things hope=
fully=2E

Cheers,
Quentin

