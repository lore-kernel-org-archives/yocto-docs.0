Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C62AC433FE
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 12:29:34 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web12.32178.1640262573175326464
 for <docs@lists.yoctoproject.org>;
 Thu, 23 Dec 2021 04:29:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.193,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 001E7240007;
	Thu, 23 Dec 2021 12:29:28 +0000 (UTC)
Date: Thu, 23 Dec 2021 13:29:24 +0100
From: Quentin Schulz <foss+yocto@0leil.net>
To: docs@lists.yoctoproject.org,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: =?US-ASCII?Q?Re=3A_=5Bdocs=5D_=5BPATCH=5D_ref-manual=3A_Add_doc?=
 =?US-ASCII?Q?umentation_of_PACKAGE=5FDEBUG=5FFILE=5FSUFFIX?=
In-Reply-To: <20211223103713.4552-1-pkj@axis.com>
References: <20211223103713.4552-1-pkj@axis.com>
Message-ID: <F81D07E4-2B13-4991-9BE5-8906A342B61A@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 23 Dec 2021 12:29:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2322

Hi Peter,

On December 23, 2021 11:37:13 AM GMT+01:00, Peter Kjellerstedt <peter=2Ekj=
ellerstedt@axis=2Ecom> wrote:
>Signed-off-by: Peter Kjellerstedt <peter=2Ekjellerstedt@axis=2Ecom>
>---
>
>This of course assumes that the corresponding change to OE-Core is
>accepted=2E
>
> documentation/ref-manual/variables=2Erst | 8 ++++++++
> 1 file changed, 8 insertions(+)
>
>diff --git a/documentation/ref-manual/variables=2Erst b/documentation/ref=
-manual/variables=2Erst
>index e5216b3f36=2E=2E52adcf1e4f 100644
>--- a/documentation/ref-manual/variables=2Erst
>+++ b/documentation/ref-manual/variables=2Erst
>@@ -5085,6 +5085,14 @@ system and gives an overview of their function and=
 contents=2E
>       result of the package manager in use, see the
>       ":ref:`package=2Ebbclass <ref-classes-package>`" section=2E
>=20
>+   :term:`PACKAGE_DEBUG_FILE_SUFFIX`
>+      This suffix is added to the names of all files with debug symbols =
produced
>+      by split_and_strip_files()=2E It can be used to make the debug fil=
es

I don't think we care in the documentation about the name of the function =
in which this variable is used=2E The rest looks fine=2E

Cheers,
Quentin

>+      produced by one recipe unique to avoid them conflicting with ident=
ically
>+      named debug files produced by another recipe=2E This may be needed=
 since
>+      while the target files may be split in multiple packages, the debu=
g
>+      files for one recipe are all in one package=2E
>+
>    :term:`PACKAGE_DEBUG_SPLIT_STYLE`
>       Determines how to split up and package debug and source informatio=
n
>       when creating debugging packages to be used with the GNU Project

