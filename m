Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F027E7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 10:33:48 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.7136.1733826826909493091
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 02:33:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=P2To0Qz2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D518A1C0003;
	Tue, 10 Dec 2024 10:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733826825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EGpGDLwiEIbLc/jFftzbkp6sagyQb17x6iZ2Am9vg1A=;
	b=P2To0Qz2acuVv0TFeR3bYOAKVUyYf/GlnlMs7GzheSdFCZ+70eiI23yevKModF2dPnNROB
	ZaG1KkNUi+xlL1dnN9XwdqAr7QJTljT6whZpyWXxLzRzmI0VEYbLKWAdgRaelslfC28YCH
	tPjM0lHj2aj5ISXTaCOkNww0Ko6dkOYNYatiUFYn4psQMS+Yj+xpEzajfOzSvyCJ6BUgqj
	DIy1ilQIxrmIYlrz+uIolnmbcYk6wuqwBSWc6WzbalfB5Ie//pAL2LStLM7a215OVllQBu
	A4QAzEI5F6y3RGuCJ3UTe6D2qnRlUiVS9Fw/CAMhfmroYaZTcgrwBnZ0e2MW/w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Dec 2024 11:33:44 +0100
Message-Id: <D67YBBAMD627.3JPAXWB92MIQ9@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [yocto-docs PATCH v2] Add scripts to build the docs in
 containers
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241205-docs-build-dockerfiles-v2-1-047cb3245adf@bootlin.com>
 <fd8bce6e-155f-4c95-8061-bfef0d5784dc@cherry.de>
In-Reply-To: <fd8bce6e-155f-4c95-8061-bfef0d5784dc@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Dec 2024 10:33:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5918

Hi Quentin,

On Fri Dec 6, 2024 at 3:23 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 12/5/24 12:06 PM, Antonin Godard wrote:
>> Add two scripts for building a container image and building the
>> documentation in that image: build-docs-container and
>> container-build-docs.
>>=20
>
> Yet there's only one left now :) (also in your commit title).

Oops, will update in v3 :)

>> For now, the documentation/tools/dockerfiles directory contains a
>> Dockerfile for building with Ubuntu or Debian, but we could extend this
>> to the supported distros.
>>=20
>> It should be possible to build the full documentation with two commands:
>>=20
>>    ./documentation/tools/build-docs-container ubuntu:24.04
>>=20
>> CONTAINERCMD can be replaced by "podman" to build with podman.
>>=20
>
> I assume installing podman-docker package could help with that too. Not=
=20
> sure it's recommended, but I do have it installed :)

Didn't know about that one. But it shouldn't be required to use podman or d=
ocker
independently I think?

>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>
> It'd be nice to explicit the dependency on your other patch series here.=
=20
> You're the maintainer so you'll get the order right when merging but=20
> it's a good habit to take as a contributor so maintainers are aware of=20
> specific inter-series dependencies.

You're right, I'll add this (and thanks for the tip, I overlooked that).

>> Changes in v2:
>> - Merge the scripts to build a container and run the container into a
>>    single script.
>> - Parametrize the FROM dockerfile instruction from the script, allowing
>>    to use a single dockerfile for multiple distros.
>> - Add a paragraph on this in the README.
>> - Copy the dependency list in a file in the container, instead of
>>    passing them in a variable (to be future-proof on command line
>>    lengths).
>> - Fix the locale-gen command in the Ubuntu/Debian dockerfile.
>> - Link to v1: https://lore.kernel.org/r/20241121-docs-build-dockerfiles-=
v1-1-3b54e1237bf5@bootlin.com
>> ---
>>   documentation/README                               |  27 +++++
>>   documentation/tools/build-docs-container           | 119 +++++++++++++=
++++++++
>>   .../tools/dockerfiles/Dockerfile.ubuntu-debian     |  18 ++++
>>   3 files changed, 164 insertions(+)
>>=20
>> diff --git a/documentation/README b/documentation/README
>> index 8a47fd4a3fd07d41d61a7d681d82bd13ac74527d..aebece13758005a8b913b457=
0fee6118256f6f9b 100644
>> --- a/documentation/README
>> +++ b/documentation/README
>> @@ -128,6 +128,33 @@ dependencies in a virtual environment:
>>    $ pipenv install
>>    $ pipenv run make html
>>  =20
>> +Building the documentation in a container
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The documentation can be built in a container with the build-docs-conta=
iner
>> +scripts in the tools/ directory. The default container command used by =
the
>> +script is docker, but the script also supports podman by setting the
>> +CONTAINERCMD variable in your environment:
>> +
>> +  $ export CONTAINERCMD=3Dpodman
>> +
>> +A basic usage of the script would be:
>> +
>> +  $ ./tools/build-docs-container debian:12
>> +
>> +This will the entire documentation in an Debian 12 container.
>> +
>
> +build?
>
> s/an/a/
>
>> +The documentation can be built in other distributions. This list can be=
 obtained
>> +by running:
>> +
>> +  $ ./tools/build-docs-container list
>> +
>> +The make target can optionally be provided to build a single documentat=
ion type
>> +(these targets are listed in the documentation Makefile). For example, =
to build
>
> s;the documentation Makefile;documentation/Makefike; ?
>
>> +the documentation in HTML and EPub formats, the following command can b=
e used:
>> +
>> +  $ ./tools/build-docs-container ubuntu:24.04 epub html
>> +
>>   Style checking the Yocto Project documentation
>>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  =20
>> diff --git a/documentation/tools/build-docs-container b/documentation/to=
ols/build-docs-container
>> new file mode 100755
>> index 0000000000000000000000000000000000000000..b9578d6da49b707c4de21586=
6b6396cfeff3d08b
>> --- /dev/null
>> +++ b/documentation/tools/build-docs-container
>> @@ -0,0 +1,119 @@
>> +#!/usr/bin/env bash
>> +#
>> +# Build a container ready to build the documentation be reading the dep=
endencies
>> +# listed in poky.yaml.in, and start a documentation build in this conta=
iner.
>> +#
>> +# Usage:
>> +#
>> +#   ./documentation/tools/build-docs-container <image> [<make target>]
>> +#
>> +# Where <image> is one of the keys in YQ_KEYS. E.g.:
>> +#
>> +#   ./documentation/tools/build-docs-container ubuntu:24.04 html
>> +#
>> +# Will build the docs in an Ubuntu 24.04 container in html.
>> +#
>> +# The container commands can be used by exporting CONTAINERCMD in the
>> +# environment. The default is docker, but podman can also be used.
>> +
>
> I would move "set" commands here.

Agree with this comment and the ones above

>> +SCRIPT_DIR=3D$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null &&=
 pwd)
>> +CONTAINERCMD=3D${CONTAINERCMD:-docker}
>> +DOCS_DIR=3D"$SCRIPT_DIR/../.."
>> +POKY_YAML_IN=3D"$SCRIPT_DIR/../poky.yaml.in"
>> +
>> +# This lists the different images we can build and the keys we pass to =
yq to
>> +# find packages in poky.yaml.in.
>> +# The keys should be in the form of "<image>:<version>", as this will b=
e passed
>> +# to FROM in the selected Dockerfile below.
>> +# These are common yq keys used for multiple distros.
>> +_UBUNTU_DEBIAN_YQ_KEYS=3D".UBUNTU_DEBIAN_HOST_PACKAGES_DOC .UBUNTU_DEBI=
AN_HOST_PACKAGES_DOC_PDF"
>> +declare -A YQ_KEYS=3D(
>> +  [ubuntu:22.04]=3D"$_UBUNTU_DEBIAN_YQ_KEYS"
>> +  [ubuntu:24.04]=3D"$_UBUNTU_DEBIAN_YQ_KEYS"
>> +  [debian:12]=3D"$_UBUNTU_DEBIAN_YQ_KEYS"
>> +)
>> +
>> +# This lists the dockerfile to use for each of the distro listed in YQ_=
KEYS
>> +# above. There should be a 1 to 1 match between the keys listed in YQ_K=
EYS above
>> +# and the keys listed in DOCKERFILES below.
>> +declare -A DOCKERFILES=3D(
>> +  [ubuntu:22.04]=3D"Dockerfile.ubuntu-debian"
>> +  [ubuntu:24.04]=3D"Dockerfile.ubuntu-debian"
>> +  [debian:12]=3D"Dockerfile.ubuntu-debian"
>> +)
>> +
>> +main ()
>> +{
>> +  if [ "$#" -lt 1 ]; then
>> +    echo "No image provided. Provide one of: ${!YQ_KEYS[*]}"
>> +    exit 1
>> +  elif [ "$1" =3D "list" ]; then
>> +    echo -e "Available container images:\n\n${!YQ_KEYS[*]}"
>> +    exit 0
>> +  fi
>> +
>> +  local image=3D"$1"
>> +  shift
>> +  local make_targets=3D"${*:-publish}"
>> +
>> +  for cmd in $CONTAINERCMD yq; do
>> +    if ! which "$cmd" >/dev/null 2>&1; then
>> +      echo "The $cmd command was not found. Make sure you have $cmd ins=
talled."
>> +      exit 1
>> +    fi
>> +  done
>> +
>> +  # Get the appropriate dockerfile from DOCKERFILES
>> +  dockerfile=3D"${DOCKERFILES[$image]}"
>> +
>> +  local temporary_dep_file=3D"$SCRIPT_DIR/dockerfiles/deps"
>> +  echo -n > "$temporary_dep_file" # empty the file
>> +  for dep_key in ${YQ_KEYS[$image]}; do
>> +    yq --raw-output --join-output "$dep_key" "$POKY_YAML_IN" >> "$tempo=
rary_dep_file"
>> +    # add a white space after last element of yq command
>> +    echo -n " " >> "$temporary_dep_file"
>> +  done
>> +
>
> Just use a temporary file, this would allow to run builds from two=20
> different distros at the same time. mktemp should help you with that.

The problem is that the source in COPY must be part of the build context, s=
o I
don't having a temp file in /tmp is possible. See
https://docs.docker.com/reference/dockerfile/#adding-files-from-the-build-c=
ontext

I could use "mktemp --tmpdir=3D$SCRIPT_DIR/dockerfiles" but I don't really =
see the
added value.

>> +  # docker build doesn't accept 2 colons, so "sanitize" the name
>> +  local sanitized_dockername
>> +  sanitized_dockername=3D$(echo "$image" | tr ':.' '-')
>> +
>> +  $CONTAINERCMD build \
>> +    --tag yocto-docs-$sanitized_dockername:latest \
>> +    --build-arg ARG_FROM=3D"$image" \
>> +    --file "$SCRIPT_DIR/dockerfiles/$dockerfile" \
>> +    "$SCRIPT_DIR/dockerfiles"
>> +
>> +  # We can remove the deps file, we no longer need it
>> +  rm -f "$temporary_dep_file"
>> +
>> +  local -a args_run=3D(
>> +    --rm
>> +    --interactive
>> +    --tty
>> +    --volume=3D"$DOCS_DIR:/docs:rw"
>> +    --workdir=3D/docs
>> +    --security-opt label=3Ddisable
>> +  )
>> +
>> +  if [ "$CONTAINERCMD" =3D "docker" ]; then
>> +    args_run+=3D(
>> +      --user=3D"$(id -u)":"$(id -g)"
>> +    )
>> +  elif [ "$CONTAINERCMD" =3D "podman" ]; then
>> +    # we need net access to fetch bitbake terms
>> +    args_run+=3D(
>> +      --cap-add=3DNET_RAW
>> +      --userns=3Dkeep-id
>> +    )
>> +  fi
>> +
>> +  $CONTAINERCMD run \
>> +    "${args_run[@]}" \
>> +    yocto-docs-$sanitized_dockername \
>> +    make -C documentation $make_targets
>> +}
>> +
>> +set -eu -o pipefail
>> +
>> +main "$@"
>> diff --git a/documentation/tools/dockerfiles/Dockerfile.ubuntu-debian b/=
documentation/tools/dockerfiles/Dockerfile.ubuntu-debian
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..3c543dc4b0e96dc9c00b2015=
58e2ed00847339fa
>> --- /dev/null
>> +++ b/documentation/tools/dockerfiles/Dockerfile.ubuntu-debian
>> @@ -0,0 +1,18 @@
>> +ARG ARG_FROM=3Ddebian:12 # default value to avoid warning
>> +FROM $ARG_FROM
>> +
>> +ENV DEBIAN_FRONTEND=3Dnoninteractive
>> +
>> +# relative to the location of the dockerfile
>> +COPY deps /deps
>> +
>> +RUN apt-get update \
>> + && apt-get --yes --no-install-recommends install $(cat /deps) \
>> + && apt-get --yes autoremove \
>> + && apt-get clean \
>> + && rm /deps
>> +
>> +RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen
>> +
>> +RUN git config --global --add safe.directory /docs
>> +
>>=20
>
> So... I've had another idea.
>
> Parsing yaml in shell, not fun.
>
> But I don't think we **need** the instructions to be in the YAML file.
>
> So I think we could drastically simplify all this by storing the setup=20
> instructions in shell scripts which are included in sphinx AND use those=
=20
> shell scripts in the Containerfile. We actually do this for our product=
=20
> user manuals :)
>
> Essentially, we would have:
>
> $ cat documentation/host-packages-ubuntu.sh
> sudo apt install gawk wget git diffstat unzip texinfo gcc \ [...]
>
> In Sphinx:
>
> .. literalinclude:: 50.literalinclude.apt.sh
>     :language: bash
>
> In the appropriate place.
>
> How we generate the Containerfile internally:
> """
> cat <<EOF > $WORKDIR/merged.sh
> #!/bin/bash
> set -eux
> export DEBIAN_FRONTEND=3Dnoninteractive
> apt-get update
> apt-get -y install sudo
> EOF
>
> # Merge bash snippets we want to run (in the right order)
> cat ../source/50.literalinclude.{apt,atf,uboot,linux,debos-prepare,\=20
> debos-build-bookworm}.sh >> $WORKDIR/merged.sh
>
> chmod +x $WORKDIR/merged.sh
>
> podman run --rm --tmpfs=3D/tmp -v=3D$WORKDIR:$WORKDIR --security-opt=20
> label=3Ddisable \  --annotation -w $WORKDIR debian:bookworm ./merged.sh
> """
>
> I assume we could simply use COPY in the Containerfile and include the=20
> shell script in there and run the shell script in a single RUN. You=20
> could then do the cleanup step in a separate layer, not optimal since=20
> the layer will be unnecessarily big but I assume the end image is going=
=20
> to be smaller anyway?
>
> The benefit is that you test **exactly** what's in the documentation.=20
> And also you don't have to parse YAML. And it should be relatively easy=
=20
> to add support for new distros.
>
> What do you think?

I like this idea! Only downside I see is to have to re-run "apt get install=
" for
each run command, which is not really ideal IMO. I prefer caching what's al=
ready
been downloaded so we can re-build the doc swiftly (I imagined this script =
to be
used for more than verifying that what we list in the dep list is enough to
build, and used by anyone to test their changes to the docs easily).

On the other hand, running exactly what we document is a good thing. So may=
be a
mix between the two?

For now, I guess the current solution is satisfying: we get close to what's
documented in the documentation without having the 100% match.

If you have time to send some patches to implement that I'd welcome them, t=
hough
:)

Thanks,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

