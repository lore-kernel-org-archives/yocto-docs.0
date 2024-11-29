Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AD3D729E4
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 15:01:15 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.116683.1732892466670434803
 for <docs@lists.yoctoproject.org>;
 Fri, 29 Nov 2024 07:01:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JwpV4s/I;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4CF320003;
	Fri, 29 Nov 2024 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732892465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQy7t16vc0+SGbSweANsuJ4/fz0o3oA3GD8mogwfK+g=;
	b=JwpV4s/Ii4jNkvK2Z0QLK/EN1URUX/ho01d1wXOXmi2wJoe6y/4xhkJIDt0ktcowWOkQxI
	vKvbK71ZlKPUUNYN7BvVbi2WkCFEwiEZ+CP/i9i9XAQiD+Mi2dHogzsWT6GR5l3Nlv3+VH
	txjvBCsOaYPT5zLrAZVg9++7dvCCSviMyEGdUl4FoztiBWKV02Z9ziE7hkxRq1Pn5huFjV
	1Ydo7V0PoiLhF99pwdibhWqvSH70wJvZoksNEymEpARxvz2IOCnAA6jcMYrYrj/s/6//04
	lI4PdobqXXyBCWfpJu1gTyIQyPxHt61EH1sH9IeYMHjX+RGgkqg1E2rlzEPoUg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Nov 2024 16:01:04 +0100
Message-Id: <D5YR4057DRW4.36YJYWAR7MRDB@bootlin.com>
Subject: Re: [docs] [yocto-docs PATCH] Add scripts to build the docs in
 containers
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241121-docs-build-dockerfiles-v1-1-3b54e1237bf5@bootlin.com>
 <3b8d482f-93c4-4ad8-ad74-6ed8365fcede@cherry.de>
In-Reply-To: <3b8d482f-93c4-4ad8-ad74-6ed8365fcede@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 29 Nov 2024 15:01:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5856

Hi Quentin,

On Mon Nov 25, 2024 at 7:26 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 11/21/24 2:22 PM, Antonin Godard via lists.yoctoproject.org wrote:
>> Add two scripts for building a container image and building the
>> documentation in that image: build-docs-container and
>> container-build-docs.
>>=20
>> For now, the documentation/tools/dockerfiles directory contains two
>> Dockerfiles for building with Ubuntu 24.04 and Debian 12, but we could
>> extend this to the supported distros.
>>=20
>> It should be possible to build the full documentation with two commands:
>>=20
>>    ./documentation/tools/build-docs-container ubuntu-24-04
>>    ./documentation/tools/build-docs ubuntu-24-04
>>=20
>> The first command builds the container image by pulling the dependencies
>> listed in poky.yaml.in. The second command uses this image to build the
>> docs.
>>=20
>> CONTAINERCMD can be replaced by "podman" to build with podman.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>   documentation/tools/build-docs                     | 48 ++++++++++++++=
++++++
>>   documentation/tools/build-docs-container           | 51 ++++++++++++++=
++++++++
>>   .../tools/dockerfiles/Dockerfile.debian-12         | 17 ++++++++
>>   .../tools/dockerfiles/Dockerfile.ubuntu-24-04      | 17 ++++++++
>>   4 files changed, 133 insertions(+)
>>=20
>> diff --git a/documentation/tools/build-docs b/documentation/tools/build-=
docs
>> new file mode 100755
>> index 0000000000000000000000000000000000000000..2fe8aff3a9834e4f5015e04d=
64b7462190278004
>> --- /dev/null
>> +++ b/documentation/tools/build-docs
>> @@ -0,0 +1,48 @@
>> +#!/usr/bin/env bash
>> +#
>> +# Build the documentation in a container built by build-docs-container.
>> +#
>> +# Usage:
>> +#
>> +#   ./documentation/tools/build-docs <image> [<command>]
>> +#
>> +# Where <image> is one of the keys in
>> +# documentation/tools/build-docs-container's DEPS_KEYS_YQ.
>> +# And <command> an optional command to run, default being to run "make =
publish".
>> +#
>> +# E.g.:
>> +#
>> +#   ./documentation/tools/build-docs ubuntu-24-04
>> +
>> +SCRIPT_DIR=3D$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null &=
& pwd)
>> +CONTAINERCMD=3D${CONTAINERCMD:-docker}
>> +
>> +DOCS_DIR=3D"$SCRIPT_DIR/../.."
>> +
>> +main ()
>> +{
>> +  local image=3D"$1"
>> +  shift
>> +  local command=3D"${*:-make -C documentation publish}"
>> +
>
> Should we only require "publish" to be passed instead of make -C=20
> documentation publish? I believe this should be doable with ENTRYPOINT?

I agree. I don't see any other command we'd want to run instead of "make
<something>".

About the entrypoint, what would be the added value of having one?

>> +  if [ "$CONTAINERCMD" =3D "docker" ]; then
>> +    EXTRA_ARGS_RUN=3D"--user $(id -u):$(id -g)"
>> +  elif [ "$CONTAINERCMD" =3D "podman" ]; then
>> +    # we need net access to fetch bitbake terms
>> +    EXTRA_ARGS_RUN=3D"\
>> +      --cap-add=3DNET_RAW \
>> +      --userns=3Dkeep-id"
>
> please add
>
> --security-opt label=3Ddisable
>
> here as well, for SELinux based systems such as Fedora. My understanding=
=20
> is that for anything that is to be used by either the host or the=20
> container should disable labeling.

Thanks for the tip. Will add (assuming this is not an issue for other distr=
os).

>> +  fi
>> +
>> +  $CONTAINERCMD run \
>> +    --rm --interactive --tty \
>> +    --volume "$DOCS_DIR:/docs:rw" \
>> +    --workdir "/docs" \
>> +    $EXTRA_ARGS_RUN \
>> +    "yocto-docs-$image" \
>
> please prepend the image name with localhost/ to be sure we don't end up=
=20
> downloading some yocto-docs-ubuntu from docker.io for example :)

Nice tip, didn't know about that one, thanks :)

>> +    $command
>> +}
>> +
>> +set -eu -o pipefail
>> +
>> +main "$@"
>> diff --git a/documentation/tools/build-docs-container b/documentation/to=
ols/build-docs-container
>> new file mode 100755
>> index 0000000000000000000000000000000000000000..8cfe0f7aa75bf5fcfbbc0e83=
8d66e0ef10f20696
>> --- /dev/null
>> +++ b/documentation/tools/build-docs-container
>> @@ -0,0 +1,51 @@
>> +#!/usr/bin/env bash
>> +#
>> +# Build a container ready to build the documentation be reading the dep=
endencies
>> +# listed in poky.yaml.in.
>> +#
>> +# Usage:
>> +#
>> +#   ./documentation/tools/build-docs-container <image>
>> +#
>> +# Where <image> is one of the keys in DEPS_KEYS_YQ. E.g.:
>> +#
>> +#   ./documentation/tools/build-docs-container ubuntu-24-04
>> +
>> +SCRIPT_DIR=3D$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null &=
& pwd)
>> +CONTAINERCMD=3D${CONTAINERCMD:-docker}
>> +
>> +# Keys used by yq to get the dependencies from poky.yaml.in
>> +declare -A DEPS_KEYS_YQ=3D(
>> +  [ubuntu-24-04]=3D".UBUNTU_DEBIAN_HOST_PACKAGES_DOC .UBUNTU_DEBIAN_HOS=
T_PACKAGES_DOC_PDF"
>> +  [debian-12]=3D".UBUNTU_DEBIAN_HOST_PACKAGES_DOC .UBUNTU_DEBIAN_HOST_P=
ACKAGES_DOC_PDF"
>> +)
>> +
>> +main ()
>> +{
>> +  local image=3D"$1"
>> +
>> +  for cmd in $CONTAINERCMD yq; do
>> +    if ! which "$cmd" >/dev/null 2>&1; then
>> +      echo "The $cmd command was not found. Make sure you have $cmd ins=
talled."
>> +      exit 1
>> +    fi
>> +  done
>> +
>> +  local dockername=3D"Dockerfile.$image"
>> +
>> +  # Put all the dependencies in the deps variable
>> +  for dep_key in ${DEPS_KEYS_YQ[$image]}; do
>> +    deps=3D"$deps $(yq --raw-output "$dep_key" "$SCRIPT_DIR/../poky.yam=
l.in")"
>> +  done
>> +
>> +  ( cd "$SCRIPT_DIR/dockerfiles" \
>> +    && $CONTAINERCMD build \
>> +    --tag "yocto-docs-$image:latest" \
>> +    --file "$dockername" \
>> +    --build-arg DEPS=3D"$deps" \
>
> I am not sure this is future-proof. We'd be limited to the max length of=
=20
> parameters one can use in a terminal. What about creating a temporary=20
> file and using that temporary file from within the Dockerfile via COPY.=
=20
> Also, you really want COPY and not MOUNT because changes in files in=20
> MOUNT won't invalidate the layer IIRC.

Yes, I agree this would be better, I'll work on adding that instead.

>> +    . )
>
> Can't we just run
>
> docker build [...] -f $dockername "$SCRIPT_DIR/dockerfiles"
>
> to avoid having to cd into it in a subshell?

I don't remember why but I had trouble with this. For some reason I had to =
be in
the same directory as the Dockerfile... I'll give it another shot.

>> +}
>> +
>> +set -e -o pipefail
>> +
>
> set -u
>
> while we are at it :)

Forgot this one, thanks!

>> +main "$@"
>
> Question: why do we split the image creation from the running?

Good question. Initially it made sense to me to split both to avoid running
"docker build" each time, but knowing it would get cached I hesitated. If
checking for the cache is a low-cost operation (seems to be on my computer)=
,
I also vote for having a single script that runs docker build each time. Th=
at
way we don't forget to rebuild when adding things to poky.yaml.in.

>> diff --git a/documentation/tools/dockerfiles/Dockerfile.debian-12 b/docu=
mentation/tools/dockerfiles/Dockerfile.debian-12
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..18c9c45c3ccfc5d90a09057d=
874512c6b9826611
>> --- /dev/null
>> +++ b/documentation/tools/dockerfiles/Dockerfile.debian-12
>> @@ -0,0 +1,17 @@
>> +FROM debian:12
>
> Would be nice to pass the version number from the shell script as well I=
=20
> guess?
>
> There's a trick for that one IIRC, I'd have to check how I've done that=
=20
> and get back to you if you're interested.

Yes, that'd be an improvement.

>> +
>> +ENV DEBIAN_FRONTEND=3Dnoninteractive
>> +
>> +ARG DEPS
>> +ENV DEPS=3D${DEPS}
>> +
>> +RUN apt-get update \
>> + && apt-get --yes --fix-broken upgrade \
>
> That should not be necessary?

Probably not. I picked that up from an older Dockerfile, and I don't rememb=
er
the reason why I put that here. Will remove.

>> + && apt-get --yes --no-install-recommends install \
>> +    ${DEPS} \
>> + && apt-get --yes autoremove \
>> + && apt-get clean
>> +
>> +RUN LANG=3D"en_US.UTF-8" locale-gen
>> +
>> +RUN git config --global --add safe.directory /docs
>> diff --git a/documentation/tools/dockerfiles/Dockerfile.ubuntu-24-04 b/d=
ocumentation/tools/dockerfiles/Dockerfile.ubuntu-24-04
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..6ac384c4f242b508027a92d2=
acad490da41dc374
>> --- /dev/null
>> +++ b/documentation/tools/dockerfiles/Dockerfile.ubuntu-24-04
>> @@ -0,0 +1,17 @@
>> +FROM ubuntu:24.04
>> +
>> +ENV DEBIAN_FRONTEND=3Dnoninteractive
>> +
>> +ARG DEPS
>> +ENV DEPS=3D${DEPS}
>> +
>> +RUN apt-get update \
>> + && apt-get --yes --fix-broken upgrade \
>> + && apt-get --yes --no-install-recommends install \
>> +    ${DEPS} \
>> + && apt-get --yes autoremove \
>> + && apt-get clean
>> +
>> +RUN LANG=3D"en_US.UTF-8" locale-gen
>> +
>
> I believe this is not working if I remember correctly the thread with=20
> Gu=C3=A9na=C3=ABl?

You're right, actually this does nothing, and modifying /etc/locale.gen see=
ms to
be the proper way (for debian/ubuntu compatibility).

> Otherwise, the Dockerfile are identical, so maybe parameterizing the=20
> FROM line would be better than duplicating?

Agreed, goes with the improvement/passing the version trick you mentioned a=
bove.
I'll give a thought and see how I can do that.


Thank you,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

