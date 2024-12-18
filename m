Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF19E77183
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 08:23:03 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.101002.1734510179061547566
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 00:22:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GtQw9njH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 928C8FF804;
	Wed, 18 Dec 2024 08:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734510177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hhuM3hiONb75/lx6veCWqEe1Y+SKJVmAxOFMiUKrPgI=;
	b=GtQw9njHN7mzJkZ7RTFgAhxj+WCVm78i3Wn86/d1ppQqbXXyfHHlKe2V4+LBZj8sjsALDG
	qxUktG3XI6lj25bLQz5QWe8Auua9/DZup9KiYUgRzRQ0lyr12vQRrKSKHo+mF3gtGtYqHa
	AsEyBC22aAk+gL5KKy+Tw9wj5+PPM4bvTvAF7ZLtPLUeg/iuu5bZ/mJ17uspS80bXQY0hW
	9G0GS8cljHmtn3c9dwbYA8ZCDLXwMFlHCi4dXxHJgSoXPLos+MDr3EQ8Uwzd1VgxuE87Xg
	fyj/s+Ljp4hDmed01bbdS/3eA8GsPVm6NJGpMiBPAYoj0VXXmFZ0fQYsWaay/Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Dec 2024 09:22:57 +0100
Message-Id: <D6EOJJ3SKUCA.1IGDB6USWIDKM@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>, "Quentin Schulz"
 <foss@0leil.net>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH RFC 2/2] tools: add script for building
 documentation inside containers
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241210-instructions-shell-container-v1-0-6a7cdc404ff4@cherry.de> <20241210-instructions-shell-container-v1-2-6a7cdc404ff4@cherry.de> <D6DWNFLPU4PT.3BJVWQZNVWNHO@bootlin.com> <edd1fc18-11c2-44fd-9d2a-ae21d22ff8a0@cherry.de>
In-Reply-To: <edd1fc18-11c2-44fd-9d2a-ae21d22ff8a0@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Dec 2024 08:23:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5974

Hi Quentin,

On Tue Dec 17, 2024 at 2:50 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 12/17/24 11:31 AM, Antonin Godard wrote:
>> Hi Quentin,
>>=20
>> On Tue Dec 10, 2024 at 4:26 PM CET, Quentin Schulz wrote:
>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>>
>>> This adds a script for building a container and building the
>>> documentation within that new container image.
>>>
>>> The openSUSE instructions now require a --non-interactive flag otherwis=
e
>>> they fail to run. Sadly there doesn't seem to be a way to have this in
>>> an environment variable =C3=A0-la DEBIAN_FRONTEND=3Dnoninteractive.
>>>
>>> Note that the Ubuntu and openSUSE instructions currently do not work.
>>>
>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>> ---
>>>   documentation/tools/Containerfile.almalinux        |   1 +
>>>   documentation/tools/Containerfile.apt              |  21 +++++
>>>   documentation/tools/Containerfile.debian           |   1 +
>>>   documentation/tools/Containerfile.dnf              |  19 ++++
>>>   documentation/tools/Containerfile.fedora           |   1 +
>>>   documentation/tools/Containerfile.ubuntu           |   1 +
>>>   documentation/tools/Containerfile.zypper           |  18 ++++
>>>   documentation/tools/build-docs-container           | 101 ++++++++++++=
+++++++++
>>>   documentation/tools/opensuse_host_packages_docs.sh |   2 +-
>>>   .../tools/opensuse_host_packages_essential.sh      |   2 +-
>>>   10 files changed, 165 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/documentation/tools/Containerfile.almalinux b/documentatio=
n/tools/Containerfile.almalinux
>>> new file mode 120000
>>> index 0000000000000000000000000000000000000000..7237e9b99f4132957c0ad5b=
11fa6cefe9daaec74
>>> --- /dev/null
>>> +++ b/documentation/tools/Containerfile.almalinux
>>> @@ -0,0 +1 @@
>>> +Containerfile.dnf
>>> \ No newline at end of file
>>> diff --git a/documentation/tools/Containerfile.apt b/documentation/tool=
s/Containerfile.apt
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..a601699ce4005b3bc528899=
0dbf2e7fa235ea431
>>> --- /dev/null
>>> +++ b/documentation/tools/Containerfile.apt
>>> @@ -0,0 +1,21 @@
>>> +ARG ARG_FROM=3Ddebian:12 # default value to avoid warning
>>> +FROM $ARG_FROM
>>> +
>>> +ARG HOST_DOCS_PACKAGES=3Dubuntu_host_packages_docs.sh
>>> +
>>> +ENV DEBIAN_FRONTEND=3Dnoninteractive
>>> +
>>> +# relative to the location of the dockerfile
>>> +COPY --chmod=3D777 ${HOST_DOCS_PACKAGES} /temp/host_packages_docs.sh
>>> +
>>> +RUN apt-get update \
>>> + && apt-get install -y sudo \
>>> + && yes | /temp/host_packages_docs.sh \
>>> + && apt-get --yes autoremove \
>>> + && apt-get clean \
>>> + && rm -rf /temp
>>> +
>>> +RUN git config --global --add safe.directory /docs
>>> +
>>> +ENTRYPOINT ["/usr/bin/env", "make", "-C", "documentation/"]
>>> +CMD ["publish"]
>>=20
>> Are we able to override this from the command-line, with the
>> build-docs-container script? I assume everything passed in "$*" below re=
places
>> CMD?
>>=20
>
> Yes, I'm currently calling the script like that:
>
> ./tools/build-docs-container fedora:40 html
> ./tools/build-docs-container fedora:40 latexpdf
>
> or ./tools/build-docs-container fedora:40 latexpdf html (in v2, broken=20
> in v1).
>
> If you omit it, it'll call "publish", which is what you decided would be=
=20
> the default in **your** v1. We can have nothing instead which would call=
=20
> "all" I guess instead? Up to you.

"publish" is similar to all, but goes a bit further to assemble the documen=
ts
and gives a better representation of the final state of the docs IMO (how t=
hey're
actually published). I think the main advantage is the "final" directory in
the build dir, which gathers everything in one place.

TLDR: the extra cost of running publish instead of all is low, we might as =
well
just run it by default :)

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

