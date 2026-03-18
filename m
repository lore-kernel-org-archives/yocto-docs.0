Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FC5107BCF2
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 10:21:33 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10898.1773829291592420551
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 03:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KWGJW9XY;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 932351A2EA5
	for <docs@lists.yoctoproject.org>; Wed, 18 Mar 2026 10:21:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 545536004F;
	Wed, 18 Mar 2026 10:21:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E436A104506CC;
	Wed, 18 Mar 2026 11:21:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773829288; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R0U3GTPQwhr5Utl6eFOSWt/DNR7vYd++ayuM0Ngxnvo=;
	b=KWGJW9XYNXwq59YSxXVg1GlPS9p5D02AIEbBfavnVH3ZEJr/EdGiGXL8VT9QMS7RuqihNs
	EkHbUEFqGkuzHWNcxjGzlp7WrhpfT4c0PHMiAnrNvKk+FDD/B1ViZiSDpf6HIwzuuvcuPG
	oWsltrCynoNj311pGXA7swyioCPgHtD93NU23xpSKvWgz3mFLmSe7Q8K5Q+HV64aGd2Aal
	rWI0RUpL1+mAtQp9sItA1xmCdRyZQVApiqOWZdVaoV2/W9vXNweVkX0TFG4YaEilMOgXbX
	qOEQ97p0mkLF61JQnxw90uYCElJM/jOMz/k4kL1chy/+8s4AHXWBdeIufIQA8w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 11:21:26 +0100
Message-Id: <DH5U04M8BZDA.18K1BLZXWXIZS@bootlin.com>
Subject: Re: [docs] [PATCH v2] migration-guides: add release notes for
 5.0.16
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <chee.yang.lee@intel.com>, <docs@lists.yoctoproject.org>
References: <20260318101028.1339215-1-chee.yang.lee@intel.com>
In-Reply-To: <20260318101028.1339215-1-chee.yang.lee@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Mar 2026 10:21:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9095

Hi,

On Wed Mar 18, 2026 at 11:09 AM CET, Lee Chee Yang via lists.yoctoproject.o=
rg wrote:
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
> v2 : reworded highlight notes and known issue.
>
>  .../migration-guides/release-5.0.rst          |   1 +
>  .../migration-guides/release-notes-5.0.16.rst | 218 ++++++++++++++++++
>  2 files changed, 219 insertions(+)
>  create mode 100644 documentation/migration-guides/release-notes-5.0.16.r=
st
>
> diff --git a/documentation/migration-guides/release-5.0.rst b/documentati=
on/migration-guides/release-5.0.rst
> index 63b23edb1..b98e0141c 100644
> --- a/documentation/migration-guides/release-5.0.rst
> +++ b/documentation/migration-guides/release-5.0.rst
> @@ -22,3 +22,4 @@ Release 5.0 (scarthgap)
>     release-notes-5.0.13
>     release-notes-5.0.14
>     release-notes-5.0.15
> +   release-notes-5.0.16
> diff --git a/documentation/migration-guides/release-notes-5.0.16.rst b/do=
cumentation/migration-guides/release-notes-5.0.16.rst
> new file mode 100644
> index 000000000..da069f8bd
> --- /dev/null
> +++ b/documentation/migration-guides/release-notes-5.0.16.rst
> @@ -0,0 +1,218 @@
> +Release notes for Yocto-5.0.16 (Scarthgap)
> +------------------------------------------
> +
> +This release breaks Ubuntu 20.04 as a
> +:ref:`compatible host <ref-manual/system-requirements:Supported Linux Di=
stributions>`.
> +Ubuntu 20.04 lack kernel header recent enough to support the=20
> +:ref:`pseudo <overview-manual/concepts:fakeroot and pseudo>` fixes.
> +Ubuntu 20.04 is End-of-Life since 31 May 2025. Impacted users are encour=
agded to upgrade

s/encouragded/encouraged/

> +to a actively supported host ditribution. See :doc:`/ref-manual/system-r=
equirements`
> +for more information on compatible hosts.

I think you fixed the first sentence but there are still the same problems/=
typos
for the remaining ones.

I'll copy again here what I was suggesting:

"""
This release breaks support for Ubuntu 20.04 as a :ref:`compatible host
<ref-manual/system-requirements:Supported Linux Distributions>`. The Ubuntu=
 20.04
Linux kernel headers are not recent enough to support the latest :ref:`pseu=
do
<overview-manual/concepts:fakeroot and pseudo>` fixes.

Ubuntu 20.04 is End-of-Life since 31 May 2025. Impacted users are encourage=
d to
upgrade to an actively supported host distribution. See
:doc:`/ref-manual/system-requirements` for more information on compatible h=
osts.
"""

I've merged this patch with this updated paragraph. Please let me know if y=
ou
disagree with any of the above changes.

Full diff:

diff --git a/documentation/migration-guides/release-notes-5.0.16.rst b/docu=
mentation/migration-guides/release-notes-5.0.16.rst
index da069f8bd..09f37c302 100644
--- a/documentation/migration-guides/release-notes-5.0.16.rst
+++ b/documentation/migration-guides/release-notes-5.0.16.rst
@@ -1,19 +1,20 @@
 Release notes for Yocto-5.0.16 (Scarthgap)
 ------------------------------------------
=20
-This release breaks Ubuntu 20.04 as a
-:ref:`compatible host <ref-manual/system-requirements:Supported Linux Dist=
ributions>`.
-Ubuntu 20.04 lack kernel header recent enough to support the=20
-:ref:`pseudo <overview-manual/concepts:fakeroot and pseudo>` fixes.
-Ubuntu 20.04 is End-of-Life since 31 May 2025. Impacted users are encourag=
ded to upgrade
-to a actively supported host ditribution. See :doc:`/ref-manual/system-req=
uirements`
-for more information on compatible hosts.
+This release breaks support for Ubuntu 20.04 as a :ref:`compatible host
+<ref-manual/system-requirements:Supported Linux Distributions>`. The Ubunt=
u 20.04
+Linux kernel headers are not recent enough to support the latest :ref:`pse=
udo
+<overview-manual/concepts:fakeroot and pseudo>` fixes.
+
+Ubuntu 20.04 is End-of-Life since 31 May 2025. Impacted users are encourag=
ed to
+upgrade to an actively supported host distribution. See
+:doc:`/ref-manual/system-requirements` for more information on compatible =
hosts.
=20
 Alternatively, a fix has been merged to scarthgap branch and can be applie=
d on top of this
 release:
=20
-- :oe_git:`/openembedded-core/commit/?h=3Dscarthgap&id=3Dfe2666749094e8967=
36ff24d6885419905488723`
-- :yocto_git:`/poky/commit/?h=3Dscarthgap&id=3D65c3ebea05dde5cbc9d249e7949=
fabbc0047313e`
+-  :oe_git:`/openembedded-core/commit/?h=3Dscarthgap&id=3Dfe2666749094e896=
736ff24d6885419905488723`
+-  :yocto_git:`/poky/commit/?h=3Dscarthgap&id=3D65c3ebea05dde5cbc9d249e794=
9fabbc0047313e`
=20
=20
 Security Fixes in Yocto-5.0.16
@@ -97,8 +98,8 @@ Known Issues in Yocto-5.0.16
 The poky :term:`DISTRO_VERSION` was incorrectly left at 5.0.15. This is a =
minor
 issue, if a workaround is needed please cherry-pick:
=20
-- poky commit :yocto_git:`/poky/commit/?h=3Dscarthgap&id=3D06210079b2e10d6=
d3fb943afe87864267e329821`
-- meta-yocto commit :yocto_git:`/meta-yocto/commit/?h=3Dscarthgap&id=3D03f=
93c769ec99e5086e492d8145eb308a718e8d3`
+-  poky commit :yocto_git:`/poky/commit/?h=3Dscarthgap&id=3D06210079b2e10d=
6d3fb943afe87864267e329821`
+-  meta-yocto commit :yocto_git:`/meta-yocto/commit/?h=3Dscarthgap&id=3D03=
f93c769ec99e5086e492d8145eb308a718e8d3`
=20
=20
 Contributors to Yocto-5.0.16


Thanks,
Antonin

