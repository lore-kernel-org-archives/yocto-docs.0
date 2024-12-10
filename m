Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B4EE7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 12:46:19 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.9549.1733834763481166272
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 04:46:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z2LS7KMw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 620861BF203;
	Tue, 10 Dec 2024 12:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733834761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oyiSWPItZqgkdxxI7XZpDPEazMZcMvKAiwvlPwo46+o=;
	b=Z2LS7KMwm++Q5IpzkFCK9um9rYXeEfZ/cNdKqSJcpm4JelrSmXfkzKWT1u5Wmveo+LvfQQ
	z60ZvMk+28tY54wSybhEneddpbNIegozNDpoZ9nzTDbntNGsipxxxqdZgIhvachiZgqLaK
	jLs2n+GVGCkCf19dcb0O9JP59L6kpPfolDSTAKgjP5nKgPW/rjSxOPTwI/au1QBRodpQfN
	/y3TOq1Mw+s+KtQsOQh5V2rkix5zfKE8O9CDkzBVFkuhefoRhF84FhZ/KsjsAhavyi7CDS
	kUEluSKobBVujJrb/2HJFWjb/FDUaCjPaJpRPqzTWVlZp2RooH52+gIWBjBWsQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Dec 2024 13:46:01 +0100
Message-Id: <D6814L7Y2U7C.1PWWUILXKF7H3@bootlin.com>
Subject: Re: [docs] [yocto-docs PATCH v2] Add scripts to build the docs in
 containers
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241205-docs-build-dockerfiles-v2-1-047cb3245adf@bootlin.com>
 <fd8bce6e-155f-4c95-8061-bfef0d5784dc@cherry.de>
 <D67YBBAMD627.3JPAXWB92MIQ9@bootlin.com>
 <85b846b7-09ec-49dc-b739-813d52dffb81@cherry.de>
In-Reply-To: <85b846b7-09ec-49dc-b739-813d52dffb81@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Dec 2024 12:46:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5921

Hi Quentin,

On Tue Dec 10, 2024 at 12:08 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 12/10/24 11:33 AM, Antonin Godard via lists.yoctoproject.org wrote:
>> Hi Quentin,
>>=20
>> On Fri Dec 6, 2024 at 3:23 PM CET, Quentin Schulz wrote:
>>> Hi Antonin,
>>>
>>> On 12/5/24 12:06 PM, Antonin Godard wrote:
>>>> Add two scripts for building a container image and building the
>>>> documentation in that image: build-docs-container and
>>>> container-build-docs.
>>>>
>>>
>>> Yet there's only one left now :) (also in your commit title).
>>=20
>> Oops, will update in v3 :)
>>=20
>>>> For now, the documentation/tools/dockerfiles directory contains a
>>>> Dockerfile for building with Ubuntu or Debian, but we could extend thi=
s
>>>> to the supported distros.
>>>>
>>>> It should be possible to build the full documentation with two command=
s:
>>>>
>>>>     ./documentation/tools/build-docs-container ubuntu:24.04
>>>>
>>>> CONTAINERCMD can be replaced by "podman" to build with podman.
>>>>
>>>
>>> I assume installing podman-docker package could help with that too. Not
>>> sure it's recommended, but I do have it installed :)
>>=20
>> Didn't know about that one. But it shouldn't be required to use podman o=
r docker
>> independently I think?
>>=20
>
> It's just that when you run `which docker` you would get podman. But we=
=20
> shouldn't require the user to install podman-docker for the script to=20
> work. Just wanted to mention it.
>
> [...]
>
>>>> +SCRIPT_DIR=3D$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null =
&& pwd)
>>>> +CONTAINERCMD=3D${CONTAINERCMD:-docker}
>>>> +DOCS_DIR=3D"$SCRIPT_DIR/../.."
>>>> +POKY_YAML_IN=3D"$SCRIPT_DIR/../poky.yaml.in"
>>>> +
>>>> +# This lists the different images we can build and the keys we pass t=
o yq to
>>>> +# find packages in poky.yaml.in.
>>>> +# The keys should be in the form of "<image>:<version>", as this will=
 be passed
>>>> +# to FROM in the selected Dockerfile below.
>>>> +# These are common yq keys used for multiple distros.
>>>> +_UBUNTU_DEBIAN_YQ_KEYS=3D".UBUNTU_DEBIAN_HOST_PACKAGES_DOC .UBUNTU_DE=
BIAN_HOST_PACKAGES_DOC_PDF"
>>>> +declare -A YQ_KEYS=3D(
>>>> +  [ubuntu:22.04]=3D"$_UBUNTU_DEBIAN_YQ_KEYS"
>>>> +  [ubuntu:24.04]=3D"$_UBUNTU_DEBIAN_YQ_KEYS"
>>>> +  [debian:12]=3D"$_UBUNTU_DEBIAN_YQ_KEYS"
>>>> +)
>>>> +
>>>> +# This lists the dockerfile to use for each of the distro listed in Y=
Q_KEYS
>>>> +# above. There should be a 1 to 1 match between the keys listed in YQ=
_KEYS above
>>>> +# and the keys listed in DOCKERFILES below.
>>>> +declare -A DOCKERFILES=3D(
>>>> +  [ubuntu:22.04]=3D"Dockerfile.ubuntu-debian"
>>>> +  [ubuntu:24.04]=3D"Dockerfile.ubuntu-debian"
>>>> +  [debian:12]=3D"Dockerfile.ubuntu-debian"
>>>> +)
>>>> +
>>>> +main ()
>>>> +{
>>>> +  if [ "$#" -lt 1 ]; then
>>>> +    echo "No image provided. Provide one of: ${!YQ_KEYS[*]}"
>>>> +    exit 1
>>>> +  elif [ "$1" =3D "list" ]; then
>>>> +    echo -e "Available container images:\n\n${!YQ_KEYS[*]}"
>>>> +    exit 0
>>>> +  fi
>>>> +
>>>> +  local image=3D"$1"
>>>> +  shift
>>>> +  local make_targets=3D"${*:-publish}"
>>>> +
>>>> +  for cmd in $CONTAINERCMD yq; do
>>>> +    if ! which "$cmd" >/dev/null 2>&1; then
>>>> +      echo "The $cmd command was not found. Make sure you have $cmd i=
nstalled."
>>>> +      exit 1
>>>> +    fi
>>>> +  done
>>>> +
>>>> +  # Get the appropriate dockerfile from DOCKERFILES
>>>> +  dockerfile=3D"${DOCKERFILES[$image]}"
>>>> +
>>>> +  local temporary_dep_file=3D"$SCRIPT_DIR/dockerfiles/deps"
>>>> +  echo -n > "$temporary_dep_file" # empty the file
>>>> +  for dep_key in ${YQ_KEYS[$image]}; do
>>>> +    yq --raw-output --join-output "$dep_key" "$POKY_YAML_IN" >> "$tem=
porary_dep_file"
>>>> +    # add a white space after last element of yq command
>>>> +    echo -n " " >> "$temporary_dep_file"
>>>> +  done
>>>> +
>>>
>>> Just use a temporary file, this would allow to run builds from two
>>> different distros at the same time. mktemp should help you with that.
>>=20
>> The problem is that the source in COPY must be part of the build context=
, so I
>> don't having a temp file in /tmp is possible. See
>> https://docs.docker.com/reference/dockerfile/#adding-files-from-the-buil=
d-context
>>=20
>> I could use "mktemp --tmpdir=3D$SCRIPT_DIR/dockerfiles" but I don't real=
ly see the
>> added value.
>>=20
>
> "this would allow to run builds from two different distros at the same ti=
me"
>
> Also, it's guaranteed that an old file wouldn't be used in case the=20
> script is somehow broken.

I see what you mean. However, since mktemp create a random name it creates =
a
new layer each time, invalidating the following commands in the container f=
ile.

Instead I propose to move this above:

>>>> +  # docker build doesn't accept 2 colons, so "sanitize" the name
>>>> +  local sanitized_dockername
>>>> +  sanitized_dockername=3D$(echo "$image" | tr ':.' '-')

And do this:

  temporary_dep_file=3D"$SCRIPT_DIR/dockerfiles/$sanitized_dockername.deps"

So we avoid the distro clash and we still use cached layers.

>>>> +
>>>> +  $CONTAINERCMD build \
>>>> +    --tag yocto-docs-$sanitized_dockername:latest \
>>>> +    --build-arg ARG_FROM=3D"$image" \
>>>> +    --file "$SCRIPT_DIR/dockerfiles/$dockerfile" \
>>>> +    "$SCRIPT_DIR/dockerfiles"
>>>> +
>>>> +  # We can remove the deps file, we no longer need it
>>>> +  rm -f "$temporary_dep_file"
>>>> +
>>>> +  local -a args_run=3D(
>>>> +    --rm
>>>> +    --interactive
>>>> +    --tty
>>>> +    --volume=3D"$DOCS_DIR:/docs:rw"
>>>> +    --workdir=3D/docs
>>>> +    --security-opt label=3Ddisable
>>>> +  )
>>>> +
>>>> +  if [ "$CONTAINERCMD" =3D "docker" ]; then
>>>> +    args_run+=3D(
>>>> +      --user=3D"$(id -u)":"$(id -g)"
>>>> +    )
>>>> +  elif [ "$CONTAINERCMD" =3D "podman" ]; then
>>>> +    # we need net access to fetch bitbake terms
>>>> +    args_run+=3D(
>>>> +      --cap-add=3DNET_RAW
>>>> +      --userns=3Dkeep-id
>>>> +    )
>>>> +  fi
>>>> +
>>>> +  $CONTAINERCMD run \
>>>> +    "${args_run[@]}" \
>>>> +    yocto-docs-$sanitized_dockername \
>>>> +    make -C documentation $make_targets
>>>> +}
>>>> +
>>>> +set -eu -o pipefail
>>>> +
>>>> +main "$@"
>>>> diff --git a/documentation/tools/dockerfiles/Dockerfile.ubuntu-debian =
b/documentation/tools/dockerfiles/Dockerfile.ubuntu-debian
>>>> new file mode 100644
>>>> index 0000000000000000000000000000000000000000..3c543dc4b0e96dc9c00b20=
1558e2ed00847339fa
>>>> --- /dev/null
>>>> +++ b/documentation/tools/dockerfiles/Dockerfile.ubuntu-debian
>>>> @@ -0,0 +1,18 @@
>>>> +ARG ARG_FROM=3Ddebian:12 # default value to avoid warning
>>>> +FROM $ARG_FROM
>>>> +
>>>> +ENV DEBIAN_FRONTEND=3Dnoninteractive
>>>> +
>>>> +# relative to the location of the dockerfile
>>>> +COPY deps /deps
>>>> +
>>>> +RUN apt-get update \
>>>> + && apt-get --yes --no-install-recommends install $(cat /deps) \
>>>> + && apt-get --yes autoremove \
>>>> + && apt-get clean \
>>>> + && rm /deps
>>>> +
>>>> +RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen
>>>> +
>>>> +RUN git config --global --add safe.directory /docs
>>>> +
>>>>
>>>
>>> So... I've had another idea.
>>>
>>> Parsing yaml in shell, not fun.
>>>
>>> But I don't think we **need** the instructions to be in the YAML file.
>>>
>>> So I think we could drastically simplify all this by storing the setup
>>> instructions in shell scripts which are included in sphinx AND use thos=
e
>>> shell scripts in the Containerfile. We actually do this for our product
>>> user manuals :)
>>>
>>> Essentially, we would have:
>>>
>>> $ cat documentation/host-packages-ubuntu.sh
>>> sudo apt install gawk wget git diffstat unzip texinfo gcc \ [...]
>>>
>>> In Sphinx:
>>>
>>> .. literalinclude:: 50.literalinclude.apt.sh
>>>      :language: bash
>>>
>>> In the appropriate place.
>>>
>>> How we generate the Containerfile internally:
>>> """
>>> cat <<EOF > $WORKDIR/merged.sh
>>> #!/bin/bash
>>> set -eux
>>> export DEBIAN_FRONTEND=3Dnoninteractive
>>> apt-get update
>>> apt-get -y install sudo
>>> EOF
>>>
>>> # Merge bash snippets we want to run (in the right order)
>>> cat ../source/50.literalinclude.{apt,atf,uboot,linux,debos-prepare,\
>>> debos-build-bookworm}.sh >> $WORKDIR/merged.sh
>>>
>>> chmod +x $WORKDIR/merged.sh
>>>
>>> podman run --rm --tmpfs=3D/tmp -v=3D$WORKDIR:$WORKDIR --security-opt
>>> label=3Ddisable \  --annotation -w $WORKDIR debian:bookworm ./merged.sh
>>> """
>>>
>>> I assume we could simply use COPY in the Containerfile and include the
>>> shell script in there and run the shell script in a single RUN. You
>>> could then do the cleanup step in a separate layer, not optimal since
>>> the layer will be unnecessarily big but I assume the end image is going
>>> to be smaller anyway?
>>>
>>> The benefit is that you test **exactly** what's in the documentation.
>>> And also you don't have to parse YAML. And it should be relatively easy
>>> to add support for new distros.
>>>
>>> What do you think?
>>=20
>> I like this idea! Only downside I see is to have to re-run "apt get inst=
all" for
>> each run command, which is not really ideal IMO. I prefer caching what's=
 already
>
> No? I have one RUN command which is "execute this shell script".=20
> Whatever is executed as part of this shell script is part of one layer.=
=20
> You could even have one RUN command which is apt-get update &&=20
> my-shell-script && apt-get cache remove whatever to make this a smaller=
=20
> layer.

So let me know if I got this wrong, but running "podman run ..." multiple t=
imes
is going to make use of a cached layer automagically? I.e. merged.sh is not
re-run each time? Or you are implying that there is still a Containerfile i=
n the
process that caches this data?

>> been downloaded so we can re-build the doc swiftly (I imagined this scri=
pt to be
>> used for more than verifying that what we list in the dep list is enough=
 to
>> build, and used by anyone to test their changes to the docs easily).
>>=20
>
> You can have as many scripts as you want? And have them do as many or=20
> little things as you want, I'm not sure to follow what you have in mind=
=20
> here?

That wasn't clear maybe. I simply meant to say that I want to publish this
script not only for verifying that listed dependencies are correct, but als=
o
because it's convenient for anyone to build the documentation. It's unrelat=
ed to
your solution.

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

