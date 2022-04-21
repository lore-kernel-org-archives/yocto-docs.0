Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2440C71129
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:11 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.17782.1650518458719467518
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 22:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.196,
 mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by mail.gandi.net (Postfix) with ESMTPSA id AF74CE0007;
	Thu, 21 Apr 2022 05:20:56 +0000 (UTC)
Date: Thu, 21 Apr 2022 07:20:55 +0200
From: Quentin Schulz <foss@0leil.net>
To: docs@lists.yoctoproject.org,
 Abongwa Amahnui Bonalais <abongwabonalais@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5Bdocs=5D_=5BPATCH=5D_yocto-docs=3A_?=
 =?US-ASCII?Q?profile_manual=2C_added_banner_at?=
 =?US-ASCII?Q?_the_top_for_direction_to_most_?=
 =?US-ASCII?Q?recent_website_for_version_3=2E1=2E3?=
In-Reply-To: <25117.1650489487021571960@lists.yoctoproject.org>
References: <845c45a9-35d2-cb3b-b978-eb5c12b2911b@theobroma-systems.com>
 <25117.1650489487021571960@lists.yoctoproject.org>
Message-ID: <79E26F48-13C2-458F-8018-AA9F79C37039@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2819

Hi Amahnui,

On April 20, 2022 11:18:07 PM GMT+02:00, Abongwa Amahnui Bonalais <abongwa=
bonalais@gmail=2Ecom> wrote:
>Hello Quentin, when I run =2E/run-docs-build "$PWD/build" "$PWD/yocto-doc=
s" "$PWD/bitbake", I get the error below
>In an attempt to generate the docs using auto-builder-helper tool
>
>tar (child): /home/abongwa/Pictures/docbook-archives-20201105: Cannot rea=
d: Is a directory
>tar (child): At beginning of tape, quitting now
>tar (child): Error is not recoverable: exiting now
>xz: (stdin): File format not recognized
>tar: Child returned status 2
>tar: Error is not recoverable: exiting now

You need to give the path to the compressed archive (also called tarball) =
and not the path to the directory where it is extracted=2E

The script will extract it for you=2E

Cheers,
Quentin

