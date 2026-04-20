Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650D9F5580F
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 10:55:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16541.1776682503308396849
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 03:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZJE5EENd;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 535C54E42A68
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 10:55:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1357E5FFA5;
	Mon, 20 Apr 2026 10:55:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E055B1046081B;
	Mon, 20 Apr 2026 12:54:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776682499; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZYeYsNyfiD8mKyMr+uzsp4C1gpJlwOLMSkZg//O/58Q=;
	b=ZJE5EENdPvNX3ir6tgfXVeQVFQfKbHA0574LrravwAe/RDai1Kxzs0pmgFmD0U0+dsTFWv
	KuF4QJbYFTQ6/qNzVgVoS0GvdlcGngLFSQ/KANC7HJDbCZ7bD78VOPmxkaaffK9KczMBmA
	PTssjplX2oqBVmGO6YB/dBc4EN4bvx7ZvQMDKyynikhJ1O6Icj171n8d6GeyaS1S4CUoAA
	+EobP+XHqgWugRaoCUrRIAHos8Buxomsi3fkIIc/4Ifq8sGTbxDbymOLnthbFwW3j5VPyv
	M0/ED1F6ja03ccOMP+H8CzycV2S17XrIHj/1b8ym4B+S90UoSCEumRdgV2fkMg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 12:54:58 +0200
Message-Id: <DHXXDS128COZ.35MAUIPGK4G1Y@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2 2/2] ref-manual/system-requirements.rst:
 instruct to install a buildtools tarball
References: <20260420-python3-websockets-requirement-v2-0-a273a01a6f44@bootlin.com> <20260420-python3-websockets-requirement-v2-2-a273a01a6f44@bootlin.com> <e74cbdf2-7a0c-4d0d-aa77-c67823aa2e54@cherry.de>
In-Reply-To: <e74cbdf2-7a0c-4d0d-aa77-c67823aa2e54@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 10:55:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9288

Hi,

On Mon Apr 20, 2026 at 12:46 PM CEST, Quentin Schulz wrote:
> Hi Antonin,
>
> On 4/20/26 11:52 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> I noticed that openSUSE Leap 15.6 provide Python 3.6, which is not
>> supported by BitBake (which requires Python >3.9). Instruct to use a
>> buildtools tarball, which is how this is done on the Autobuilder.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/ref-manual/system-requirements.rst | 5 +++++
>>   1 file changed, 5 insertions(+)
>>=20
>> diff --git a/documentation/ref-manual/system-requirements.rst b/document=
ation/ref-manual/system-requirements.rst
>> index baa965573..85a26060c 100644
>> --- a/documentation/ref-manual/system-requirements.rst
>> +++ b/documentation/ref-manual/system-requirements.rst
>> @@ -243,6 +243,11 @@ with a supported openSUSE Leap 15.6 distribution:
>>   .. literalinclude:: ../tools/host_packages_scripts/opensuse_essential_=
15.6.sh
>>      :language: shell
>>  =20
>> +Additionally, openSUSE Leap 15.6 requires a :term:`buildtools` tarball =
to be
>> +installed and set up, as this distribution provides a version of Python=
 that is
>> +too old for :term:`BitBake`. Follow the :ref:`system-requirements-build=
tools`
>> +section below for more information.
>> +
>
> Shouldn't the buildtools cover all required packages to be present on=20
> the host? If so, do we actually need instructions without (e.g. the=20
> opensuse_essential_15.6.sh above)?

Probably, but to be fair I'm trying to match what is installed on the
Autobuilder (and that is known to work), and I'd like to avoid dropping one
requirement by mistake. That's a bit inefficient, but a bit safer. I wish t=
he
Autobuilder list of requirements was public and allow my to test things but=
 I
don't have such an environment :/

Antonin

