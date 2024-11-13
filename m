Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB62D462BF
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:57:22 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.13703.1731509831855160788
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 06:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CziS/ZEy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2C7024000A;
	Wed, 13 Nov 2024 14:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731509830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xs37s1bFwS+YOn3EeTSBUGUwUE4G0yP9Om/XOEZhcFw=;
	b=CziS/ZEyqX8MD5HScz1ozAsHW6daHg+AaqcLnVYAjicvlrll2ZorpbN/Z9NLZacw11QzUs
	NTVf57GvrVdMrtrkoUm+pNs32XKijpizoVdJfYrvFnRKctTUvutapeXkaA+XRBuPOw9oSb
	M0NWmRW2eOSYNUrr9X7giHEdex/wCRLNzKuhxR1TJ/KiLgMYBL7zQE8aLuP9exZNAmNI84
	OUVqCi2HUUvMi3J6teEGDrZ7E6Ue+XtjuacMG3Cvt0eL58MmOIuT9y0PAUrZ/h/4knC2I3
	A60HddRRfUWnxqmGATvaqB2V33wWHg5QRFyRPyEjPQqrRbBUIsspjAfIz/Ozkw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Nov 2024 15:57:09 +0100
Message-Id: <D5L50AEGROWQ.2CLUZ1KE0TOOA@bootlin.com>
Subject: Re: [yocto-docs PATCH v2] migration-guides: add placeholder files
 for next release
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2.r87.gd0484b15
References: <20241113-release-note-5-2-placeholders-v2-1-28964033ad77@bootlin.com> <60c8a346-0e6c-4138-8f8a-537c4527f0ae@cherry.de>
In-Reply-To: <60c8a346-0e6c-4138-8f8a-537c4527f0ae@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Nov 2024 14:57:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5735

Hi Quentin,

On Wed Nov 13, 2024 at 3:18 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 11/13/24 2:43 PM, Antonin Godard wrote:
>> Placeholder files for release 5.2 (Walnascar): migration guide and
>> release notes.
>>=20
>> Define two substitutions |yocto-ver| and |yocto-codename| to avoid
>> mistakes in the document. Note that anchors cannot contain these so
>> add a note on that in a comment.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> But see nits below :)
>
>> ---
>> Changes in v2:
>> - Add the missing "release-5.2" document in documentation/migration-guid=
es/index.rst.
>> - Define |yocto-ver| and |yocto-codename| in
>>    release-note-5.2/migration-5.2 to re-use in the document (expect
>>    anchors).
>> - release-note-5.2: replace "over 300" by "over XXX"
>> - Link to v1: https://lore.kernel.org/r/20241112-release-note-5-2-placeh=
olders-v1-1-a15b66eae472@bootlin.com
>> ---
>>   documentation/migration-guides/index.rst           |  1 +
>>   documentation/migration-guides/migration-5.2.rst   | 77 ++++++++++++++=
++++++++
>>   documentation/migration-guides/release-5.2.rst     |  9 +++
>>   .../migration-guides/release-notes-5.2.rst         | 65 ++++++++++++++=
++++
>>   4 files changed, 152 insertions(+)
>>=20
>> diff --git a/documentation/migration-guides/index.rst b/documentation/mi=
gration-guides/index.rst
>> index e9d7f7280931ea6e9b26276ee70a9f9d00004450..14127d56ff397a37e4f36a2e=
368abcb54eedb8a1 100644
>> --- a/documentation/migration-guides/index.rst
>> +++ b/documentation/migration-guides/index.rst
>> @@ -12,6 +12,7 @@ to move to one release of the Yocto Project from the p=
revious one.
>>   .. toctree::
>>  =20
>>      migration-general
>> +   release-5.2
>>      release-5.1
>>      release-5.0
>>      release-4.3
>> diff --git a/documentation/migration-guides/migration-5.2.rst b/document=
ation/migration-guides/migration-5.2.rst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..c186f633d26853d8fdd45529=
f5f3364b79591df2
>> --- /dev/null
>> +++ b/documentation/migration-guides/migration-5.2.rst
>> @@ -0,0 +1,77 @@
>> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
>> +
>> +.. |yocto-codename| replace:: walnascar
>> +.. |yocto-ver| replace:: 5.2
>> +.. Note: anchors id below cannot contain substitutions so replace them =
with the
>> +   value of |yocto-ver| above.
>> +
>> +Release |yocto-ver| (|yocto-codename|)
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Migration notes for |yocto-ver| (|yocto-codename|)
>> +--------------------------------------------------
>> +
>> +This section provides migration information for moving to the Yocto
>> +Project |yocto-ver| Release (codename "|yocto-codename|") from the prio=
r release.
>> +
>> +.. _migration-5.2-supported-kernel-versions:
>> +
>
> Considering that we autolabel sections, maybe it'd be simpler to just hav=
e
>
> Supported kernel versions in |yocto-ver|
>
> here?
>
> Or I think we could even do:
>
> :ref:`migration-guides/migration-X.Y.Z:Supported kernel versions`
>
> whenever we need to link to it?
>
> This would allow to not need explicit and unique labels in the files.

Correct, and this is the only file out of the two added in this patch that
defines these labels so we may as well define none.

>> +Supported kernel versions
>> +~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +The :term:`OLDEST_KERNEL` setting is XXX in this release, meaning that
>> +out the box, older kernels are not supported. See :ref:`4.3 migration n=
otes
>> +<migration-4.3-supported-kernel-versions>` for details.
>> +
> [...]
>> diff --git a/documentation/migration-guides/release-5.2.rst b/documentat=
ion/migration-guides/release-5.2.rst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..5c39b99e037e0a84ad6603d2=
2ec4fb4dc2bf96ea
>> --- /dev/null
>> +++ b/documentation/migration-guides/release-5.2.rst
>> @@ -0,0 +1,9 @@
>> +.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
>> +
>> +Release 5.2 (walnascar)
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +.. toctree::
>> +
>
> If we could control how :glob: order the files, we could simply have
>
> .. toctree::
>     :glob:
>
>     migration-5.2
>     release-notes-5.2*
>
> but this doesn't order the way we want, e.g. for kirkstone:
> - release-notes-4.1
> - release-notes-4.10
> - release-notes-4.11
> [...]
> - release-notes-4.2
> - release-notes-4.21
> ...
>
> We could write an extension for the toctree, but eh :)

That's interesting and would be useful indeed!

> Cheers,
> Quentin

Thank you!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


