Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF55CCA470
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 10:04:56 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.8490.1760004283653762850
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Oct 2025 03:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KrNFWNxK;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 51766C03599;
	Thu,  9 Oct 2025 10:04:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEE086062C;
	Thu,  9 Oct 2025 10:04:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0467102F21CE;
	Thu,  9 Oct 2025 12:04:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760004281; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=J0Zx6A4VkX0bihYLGyIC/FYxTOt5gBK6knbx1O276+I=;
	b=KrNFWNxKfn83U4SDjxn1e7cYqNKdgL7QVvcR0mbA7SxklJHu/Z1MeBfj8yxZydubu+taPg
	PJwg3UWxrt3/Mlc7dm/Mrvp56CKpP+3YVKO5NUwlR0iyFDeQMfYpPsLPtFVoTTVly3vOmH
	W4F2IsIHLOV+jfgb0qIhq3tNUvHAoYoqay9SnqZ0u1NWgGyhdz2xBruAzu46Ipmv4yoq8c
	M9AvpwSdD9L3rfwTNNB51NI32czHDDgxtMEJUCxgZjqCHolexV8zuJvFOtL5u9prlJIbLH
	mqmej2UgYdCkmWi3DIS71ksy+LByF/d2p8Q+Z8RTwz65sKLwCFxrW0OVLLNXig==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Oct 2025 12:04:39 +0200
Message-Id: <DDDPG3WAQKDV.1G1M2R6WLRFKW@bootlin.com>
To: <quentin.schulz@cherry.de>, "Quentin Schulz" <foss+yocto@0leil.net>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] tools/build-docs-container: make concurrent-safe
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20251009-iid-file-v1-1-d9ca8563c88c@cherry.de>
 <c9641d08-7fbe-46ca-a89a-9723d60eb7f2@cherry.de>
In-Reply-To: <c9641d08-7fbe-46ca-a89a-9723d60eb7f2@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Oct 2025 10:04:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7673

On Thu Oct 9, 2025 at 11:29 AM CEST, Quentin Schulz via lists.yoctoproject.=
org wrote:
> On 10/9/25 10:59 AM, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>=20
>> We aren't that interested in tags actually, the only thing it brings is
>> a belief that we are going to run exactly what we just built. The issue
>> is that this is incorrect.
>>=20
>> Indeed, one could simply run the script in parallel for the same image.
>> Script runtime A will build the image A and tag it X, Script runtime B
>> will build the image B and tag it X, Script runtime B will run the tag X
>> (image B), Script runtime A will run the tag X (image B). One way to fix
>> this could be to introduce random numbers in the tag so that it's always
>> unique, but we would be flooding the system with useless tags.
>>=20
>> Instead, we can use the sha of the generated image and run that sha
>> directly. If it's the same across rebuilds, it'll stay the same. If it's
>> different, the sha will be different and thus we are safe from
>> concurrent use.
>>=20
>> The only downside is that we cannot infer from the image sha the
>> underlying distro we're testing.
>>=20
>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>> ---
>>   documentation/tools/build-docs-container | 17 +++++++++++------
>>   1 file changed, 11 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/documentation/tools/build-docs-container b/documentation/to=
ols/build-docs-container
>> index 70e05f295..f3ef21304 100755
>> --- a/documentation/tools/build-docs-container
>> +++ b/documentation/tools/build-docs-container
>> @@ -64,10 +64,6 @@ main ()
>>  =20
>>     OCI=3D$(which "$CONTAINERCMD")
>>  =20
>> -  # docker build doesn't accept 2 colons, so "sanitize" the name
>> -  local sanitized_dockername
>> -  sanitized_dockername=3D$(echo "$image" | tr ':.' '-')
>> -
>>     local version
>>     version=3D$(echo "$image" | awk -F: '{print $NF}')
>>  =20
>> @@ -139,8 +135,14 @@ main ()
>>         ;;
>>     esac
>>  =20
>> +  local image_sha
>> +  local image_id_file
>
> Shouldn't be local if we want the trap to work (otherwise reports=20
> unbound variable).
>
> Also, this actually isn't concurrent safe as we would be building in the=
=20
> same build (_build) directory. We could fix that with:
>
> diff --git a/documentation/Makefile b/documentation/Makefile
> index bade78fe8..94d19e350 100644
> --- a/documentation/Makefile
> +++ b/documentation/Makefile
> @@ -11,7 +11,7 @@ SOURCEDIR      =3D .
>   VALEDOCS       ?=3D $(SOURCEDIR)
>   SPHINXLINTDOCS ?=3D $(SOURCEDIR)
>   IMAGEDIRS      =3D */svg
> -BUILDDIR       =3D _build
> +BUILDDIR       ?=3D _build
>   DESTDIR        =3D final
>   SVG2PNG        =3D rsvg-convert
>   SVG2PDF        =3D rsvg-convert
> diff --git a/documentation/tools/build-docs-container=20
> b/documentation/tools/build-docs-container
> index f3ef21304..3bc66970f 100755
> --- a/documentation/tools/build-docs-container
> +++ b/documentation/tools/build-docs-container
> @@ -60,6 +60,7 @@ main ()
>     fi
>
>     local image=3D"$1"
> +  local orig_image=3D$image
>     shift
>
>     OCI=3D$(which "$CONTAINERCMD")
> @@ -160,6 +161,7 @@ main ()
>       --volume=3D"$DOCS_DIR:/docs:rw"
>       --workdir=3D/docs
>       --security-opt label=3Ddisable
> +    --env BUILDDIR=3D"_build-$orig_image-$image_sha"
>     )
>
>     if [ "$OCI" =3D "docker" ]; then
>
> This would help a bit more but we would probably still have an issue=20
> with concurrent runs of $(SOURCEDIR)/set_versions.py which edits the=20
> source tree (generates poky.yaml and switchers.js).
>
> I can send a v2 with the local image_id_file fixed, an additional patch=
=20
> to build in separate build directories and reword the commit logs so=20
> they don't seem to be guaranteeing concurrent safety.
>
> It should however help make sure building two yocto-docs repos=20
> separately at the same time is now safe.

Agreed, it still a bit better than what we currently have, I think we shoul=
d do
that for now.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


