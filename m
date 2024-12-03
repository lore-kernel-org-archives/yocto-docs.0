Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8C7E64A86
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 12:24:24 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.17826.1733228661144792995
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Dec 2024 04:24:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IPLDvU+e;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B8C460005;
	Tue,  3 Dec 2024 12:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733228659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y6+4NgjenLPSF8xh3L822c6RSKeCwoxGUvZbgdtMO6c=;
	b=IPLDvU+eYtGtOheOVxOWrXx69z4U0jAuM3cBvDr0/WuZJgpRQ+PhpT+8WQnU9CImTWtQX+
	ja9NT89R5A/skrYNnBKJt7FsAgYbd7UabdT4suVMQXTvGyxiXDTP5VB8LiyoNcqPLwChy2
	bcRXCmM0ix3FWG0kiMFyERvf0Nb3xBABSmxg20zv8xnx6x4WS85PTttAt2LymS3kZWX/2J
	lCn9j69xt/vUIUP0Gg0CF7MkwXFAWhDjhIXpVRH9ZDMh6Bg2Zm3iepLpX0DN7GG97yjmWf
	OCS1NNypbqyhXn1h1CcS1e98S9D0BnBNyZM5aEq5Pguas0R17LRzvsTjfonS6w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Dec 2024 13:24:18 +0100
Message-Id: <D622A5PA7U5V.1PIP950OVIFYC@bootlin.com>
Subject: Re: [docs] [yocto-docs PATCH] Add scripts to build the docs in
 containers
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241121-docs-build-dockerfiles-v1-1-3b54e1237bf5@bootlin.com>
 <3b8d482f-93c4-4ad8-ad74-6ed8365fcede@cherry.de>
 <D5YR4057DRW4.36YJYWAR7MRDB@bootlin.com>
 <D6208NWRJAPX.SPZ8IMGUAUZ@bootlin.com>
 <43178380-7636-4d2e-b964-a77a3759eae4@cherry.de>
In-Reply-To: <43178380-7636-4d2e-b964-a77a3759eae4@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Dec 2024 12:24:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5868

Hi Quentin,

On Tue Dec 3, 2024 at 12:37 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 12/3/24 11:48 AM, Antonin Godard wrote:
>> Hi Quentin,
>>=20
>> On Fri Nov 29, 2024 at 4:01 PM CET, Antonin Godard wrote:
>> [...]
>>>>> +  fi
>>>>> +
>>>>> +  $CONTAINERCMD run \
>>>>> +    --rm --interactive --tty \
>>>>> +    --volume "$DOCS_DIR:/docs:rw" \
>>>>> +    --workdir "/docs" \
>>>>> +    $EXTRA_ARGS_RUN \
>>>>> +    "yocto-docs-$image" \
>>>>
>>>> please prepend the image name with localhost/ to be sure we don't end =
up
>>>> downloading some yocto-docs-ubuntu from docker.io for example :)
>>>
>>> Nice tip, didn't know about that one, thanks :)
>>=20
>> Hm, this doesn't seem to work for me, and I couldn't find anything on th=
e net
>> that shows this. Is there something I'm missing?
>>=20
>>    Unable to find image 'localhost/yocto-docs-ubuntu-24-04:latest' local=
ly
>>    docker: Error response from daemon: Get "http://localhost/v2/": dial =
tcp [::1]:80: connect: connection refused.
>>=20
>>=20
>> Building an image named "localhost/..." will work, but I think it's just
>> building an image with the name "localhost/...". Not really building som=
ething
>> local.
>>=20
>
> $ cat Containerfile
> FROM debian:bookworm-slim
> $ podman build -f Containerfile -t test-image:latest
> [...]
> $ podman image ls | grep test-image:latest
> localhost/test-image=20
> latest                b2ac1dc43440  14 months ago  156 MB
> $ podman run -it --userns=3Dkeep-id localhost/test-image
> qschulz@e706c5542422:/$
> $ cat Containerfile.from
> FROM localhost/test-image
> $ podman build -f Containerfile.from -t another-image:latest
> [...]
> $ podman run -it --userns=3Dkeep-id localhost/another-image
> qschulz@4e1f3229a196:/$
>
> On Fedora 41.
>
> Could possibly be yet another difference with Docker?

I think that's it. Supported by podman but not docker, as I had no issue do=
ing
this with podman in the end.

> I couldn't find a way to force fully qualified names from the CLI (one=20
> can do that with podman on fedora by removing=20
> unqualified-search-registries in /etc/containers/registries.conf I=20
> believe). I guess maybe --block-registry '*' would work, but still not=20
> sure this is something supported by Docker either, /me shrugs.

For simplicity and compatibility, I guess we can leave it as that (no
localhost/). In the second iteration of my patch I will merge the two scrip=
ts
into one (also for simplicity), so there should be no way to reach the run
command without actually building the container prior.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

