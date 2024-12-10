Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85C3E7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 14:48:19 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.12017.1733842084129051469
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 06:48:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SpzBOYNb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05452E0008;
	Tue, 10 Dec 2024 14:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733842082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hgltTxRINqYLTWdJTKrnDzd8qoC+1CSz1NXkg7qjvXQ=;
	b=SpzBOYNbGCHVXoENkBvC2Vq8P7O5pIe5FLRMWyF90f51r3hQJlaZR0+SoZiciGbGR2jfUM
	0vbueaIVl+mKNCfo+dbUW6HFKIu56jpge5Ct3IRtWYxZVeTYjU63gApfCnrm8Ui7s7jXLD
	JGZJgpF/HT9XHdsL9ejyX9iboDpYmKbtGqSIiB0fJ81cC35HNdBUu+hvxXvmZpv++gDkBn
	m34/9j02V2fPKcwJyCUeJziAsd799NlzSiFT263HCYuA69mHbfpjt+zXNh2T65R2S843Ao
	Uw+kdP9MIfrwP904sJzaUzfqVvYtJokERn2FqPjY91//XVqRf+cz+K4S5RGxIw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Dec 2024 15:48:01 +0100
Message-Id: <D683Q0AOYD75.7XN9KEOCKVTL@bootlin.com>
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
 <D6814L7Y2U7C.1PWWUILXKF7H3@bootlin.com>
 <2e420969-02db-4116-ac99-38332a3d4b40@cherry.de>
In-Reply-To: <2e420969-02db-4116-ac99-38332a3d4b40@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Dec 2024 14:48:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5923

Hi Quentin,

On Tue Dec 10, 2024 at 2:48 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 12/10/24 1:46 PM, Antonin Godard wrote:
>> Hi Quentin,
>>=20
>> On Tue Dec 10, 2024 at 12:08 PM CET, Quentin Schulz wrote:
>>> Hi Antonin,
>>>
>>> On 12/10/24 11:33 AM, Antonin Godard via lists.yoctoproject.org wrote:
>>>> Hi Quentin,
>>>>
>>>> On Fri Dec 6, 2024 at 3:23 PM CET, Quentin Schulz wrote:
>>>>> Hi Antonin,
>>>>>
>>>>> On 12/5/24 12:06 PM, Antonin Godard wrote:
>>>>>> Add two scripts for building a container image and building the
>>>>>> documentation in that image: build-docs-container and
>>>>>> container-build-docs.
>>>>>>
>>>>>
>>>>> Yet there's only one left now :) (also in your commit title).
>>>>
>>>> Oops, will update in v3 :)
>>>>
>>>>>> For now, the documentation/tools/dockerfiles directory contains a
>>>>>> Dockerfile for building with Ubuntu or Debian, but we could extend t=
his
>>>>>> to the supported distros.
>>>>>>
>>>>>> It should be possible to build the full documentation with two comma=
nds:
>>>>>>
>>>>>>      ./documentation/tools/build-docs-container ubuntu:24.04
>>>>>>
>>>>>> CONTAINERCMD can be replaced by "podman" to build with podman.
>>>>>>
>>>>>
>>>>> I assume installing podman-docker package could help with that too. N=
ot
>>>>> sure it's recommended, but I do have it installed :)
>>>>
>>>> Didn't know about that one. But it shouldn't be required to use podman=
 or docker
>>>> independently I think?
>>>>
>>>
>>> It's just that when you run `which docker` you would get podman. But we
>>> shouldn't require the user to install podman-docker for the script to
>>> work. Just wanted to mention it.
>>>
>>> [...]
>>>
>>>>>> +SCRIPT_DIR=3D$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/nul=
l && pwd)
>>>>>> +CONTAINERCMD=3D${CONTAINERCMD:-docker}
>>>>>> +DOCS_DIR=3D"$SCRIPT_DIR/../.."
>>>>>> +POKY_YAML_IN=3D"$SCRIPT_DIR/../poky.yaml.in"
>>>>>> +
>>>>>> +# This lists the different images we can build and the keys we pass=
 to yq to
>>>>>> +# find packages in poky.yaml.in.
>>>>>> +# The keys should be in the form of "<image>:<version>", as this wi=
ll be passed
>>>>>> +# to FROM in the selected Dockerfile below.
>>>>>> +# These are common yq keys used for multiple distros.
>>>>>> +_UBUNTU_DEBIAN_YQ_KEYS=3D".UBUNTU_DEBIAN_HOST_PACKAGES_DOC .UBUNTU_=
DEBIAN_HOST_PACKAGES_DOC_PDF"
>>>>>> +declare -A YQ_KEYS=3D(
>>>>>> +  [ubuntu:22.04]=3D"$_UBUNTU_DEBIAN_YQ_KEYS"
>>>>>> +  [ubuntu:24.04]=3D"$_UBUNTU_DEBIAN_YQ_KEYS"
>>>>>> +  [debian:12]=3D"$_UBUNTU_DEBIAN_YQ_KEYS"
>>>>>> +)
>>>>>> +
>>>>>> +# This lists the dockerfile to use for each of the distro listed in=
 YQ_KEYS
>>>>>> +# above. There should be a 1 to 1 match between the keys listed in =
YQ_KEYS above
>>>>>> +# and the keys listed in DOCKERFILES below.
>>>>>> +declare -A DOCKERFILES=3D(
>>>>>> +  [ubuntu:22.04]=3D"Dockerfile.ubuntu-debian"
>>>>>> +  [ubuntu:24.04]=3D"Dockerfile.ubuntu-debian"
>>>>>> +  [debian:12]=3D"Dockerfile.ubuntu-debian"
>>>>>> +)
>>>>>> +
>>>>>> +main ()
>>>>>> +{
>>>>>> +  if [ "$#" -lt 1 ]; then
>>>>>> +    echo "No image provided. Provide one of: ${!YQ_KEYS[*]}"
>>>>>> +    exit 1
>>>>>> +  elif [ "$1" =3D "list" ]; then
>>>>>> +    echo -e "Available container images:\n\n${!YQ_KEYS[*]}"
>>>>>> +    exit 0
>>>>>> +  fi
>>>>>> +
>>>>>> +  local image=3D"$1"
>>>>>> +  shift
>>>>>> +  local make_targets=3D"${*:-publish}"
>>>>>> +
>>>>>> +  for cmd in $CONTAINERCMD yq; do
>>>>>> +    if ! which "$cmd" >/dev/null 2>&1; then
>>>>>> +      echo "The $cmd command was not found. Make sure you have $cmd=
 installed."
>>>>>> +      exit 1
>>>>>> +    fi
>>>>>> +  done
>>>>>> +
>>>>>> +  # Get the appropriate dockerfile from DOCKERFILES
>>>>>> +  dockerfile=3D"${DOCKERFILES[$image]}"
>>>>>> +
>>>>>> +  local temporary_dep_file=3D"$SCRIPT_DIR/dockerfiles/deps"
>>>>>> +  echo -n > "$temporary_dep_file" # empty the file
>>>>>> +  for dep_key in ${YQ_KEYS[$image]}; do
>>>>>> +    yq --raw-output --join-output "$dep_key" "$POKY_YAML_IN" >> "$t=
emporary_dep_file"
>>>>>> +    # add a white space after last element of yq command
>>>>>> +    echo -n " " >> "$temporary_dep_file"
>>>>>> +  done
>>>>>> +
>>>>>
>>>>> Just use a temporary file, this would allow to run builds from two
>>>>> different distros at the same time. mktemp should help you with that.
>>>>
>>>> The problem is that the source in COPY must be part of the build conte=
xt, so I
>>>> don't having a temp file in /tmp is possible. See
>>>> https://docs.docker.com/reference/dockerfile/#adding-files-from-the-bu=
ild-context
>>>>
>>>> I could use "mktemp --tmpdir=3D$SCRIPT_DIR/dockerfiles" but I don't re=
ally see the
>>>> added value.
>>>>
>>>
>>> "this would allow to run builds from two different distros at the same =
time"
>>>
>>> Also, it's guaranteed that an old file wouldn't be used in case the
>>> script is somehow broken.
>>=20
>> I see what you mean. However, since mktemp create a random name it creat=
es a
>> new layer each time, invalidating the following commands in the containe=
r file.
>>=20
>> Instead I propose to move this above:
>>=20
>>>>>> +  # docker build doesn't accept 2 colons, so "sanitize" the name
>>>>>> +  local sanitized_dockername
>>>>>> +  sanitized_dockername=3D$(echo "$image" | tr ':.' '-')
>>=20
>> And do this:
>>=20
>>    temporary_dep_file=3D"$SCRIPT_DIR/dockerfiles/$sanitized_dockername.d=
eps"
>>=20
>> So we avoid the distro clash and we still use cached layers.
>>=20
>>>>>> +
>>>>>> +  $CONTAINERCMD build \
>>>>>> +    --tag yocto-docs-$sanitized_dockername:latest \
>>>>>> +    --build-arg ARG_FROM=3D"$image" \
>>>>>> +    --file "$SCRIPT_DIR/dockerfiles/$dockerfile" \
>>>>>> +    "$SCRIPT_DIR/dockerfiles"
>>>>>> +
>>>>>> +  # We can remove the deps file, we no longer need it
>>>>>> +  rm -f "$temporary_dep_file"
>>>>>> +
>>>>>> +  local -a args_run=3D(
>>>>>> +    --rm
>>>>>> +    --interactive
>>>>>> +    --tty
>>>>>> +    --volume=3D"$DOCS_DIR:/docs:rw"
>>>>>> +    --workdir=3D/docs
>>>>>> +    --security-opt label=3Ddisable
>>>>>> +  )
>>>>>> +
>>>>>> +  if [ "$CONTAINERCMD" =3D "docker" ]; then
>>>>>> +    args_run+=3D(
>>>>>> +      --user=3D"$(id -u)":"$(id -g)"
>>>>>> +    )
>>>>>> +  elif [ "$CONTAINERCMD" =3D "podman" ]; then
>>>>>> +    # we need net access to fetch bitbake terms
>>>>>> +    args_run+=3D(
>>>>>> +      --cap-add=3DNET_RAW
>>>>>> +      --userns=3Dkeep-id
>>>>>> +    )
>>>>>> +  fi
>>>>>> +
>>>>>> +  $CONTAINERCMD run \
>>>>>> +    "${args_run[@]}" \
>>>>>> +    yocto-docs-$sanitized_dockername \
>>>>>> +    make -C documentation $make_targets
>>>>>> +}
>>>>>> +
>>>>>> +set -eu -o pipefail
>>>>>> +
>>>>>> +main "$@"
>>>>>> diff --git a/documentation/tools/dockerfiles/Dockerfile.ubuntu-debia=
n b/documentation/tools/dockerfiles/Dockerfile.ubuntu-debian
>>>>>> new file mode 100644
>>>>>> index 0000000000000000000000000000000000000000..3c543dc4b0e96dc9c00b=
201558e2ed00847339fa
>>>>>> --- /dev/null
>>>>>> +++ b/documentation/tools/dockerfiles/Dockerfile.ubuntu-debian
>>>>>> @@ -0,0 +1,18 @@
>>>>>> +ARG ARG_FROM=3Ddebian:12 # default value to avoid warning
>>>>>> +FROM $ARG_FROM
>>>>>> +
>>>>>> +ENV DEBIAN_FRONTEND=3Dnoninteractive
>>>>>> +
>>>>>> +# relative to the location of the dockerfile
>>>>>> +COPY deps /deps
>>>>>> +
>>>>>> +RUN apt-get update \
>>>>>> + && apt-get --yes --no-install-recommends install $(cat /deps) \
>>>>>> + && apt-get --yes autoremove \
>>>>>> + && apt-get clean \
>>>>>> + && rm /deps
>>>>>> +
>>>>>> +RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen
>>>>>> +
>>>>>> +RUN git config --global --add safe.directory /docs
>>>>>> +
>>>>>>
>>>>>
>>>>> So... I've had another idea.
>>>>>
>>>>> Parsing yaml in shell, not fun.
>>>>>
>>>>> But I don't think we **need** the instructions to be in the YAML file=
.
>>>>>
>>>>> So I think we could drastically simplify all this by storing the setu=
p
>>>>> instructions in shell scripts which are included in sphinx AND use th=
ose
>>>>> shell scripts in the Containerfile. We actually do this for our produ=
ct
>>>>> user manuals :)
>>>>>
>>>>> Essentially, we would have:
>>>>>
>>>>> $ cat documentation/host-packages-ubuntu.sh
>>>>> sudo apt install gawk wget git diffstat unzip texinfo gcc \ [...]
>>>>>
>>>>> In Sphinx:
>>>>>
>>>>> .. literalinclude:: 50.literalinclude.apt.sh
>>>>>       :language: bash
>>>>>
>>>>> In the appropriate place.
>>>>>
>>>>> How we generate the Containerfile internally:
>>>>> """
>>>>> cat <<EOF > $WORKDIR/merged.sh
>>>>> #!/bin/bash
>>>>> set -eux
>>>>> export DEBIAN_FRONTEND=3Dnoninteractive
>>>>> apt-get update
>>>>> apt-get -y install sudo
>>>>> EOF
>>>>>
>>>>> # Merge bash snippets we want to run (in the right order)
>>>>> cat ../source/50.literalinclude.{apt,atf,uboot,linux,debos-prepare,\
>>>>> debos-build-bookworm}.sh >> $WORKDIR/merged.sh
>>>>>
>>>>> chmod +x $WORKDIR/merged.sh
>>>>>
>>>>> podman run --rm --tmpfs=3D/tmp -v=3D$WORKDIR:$WORKDIR --security-opt
>>>>> label=3Ddisable \  --annotation -w $WORKDIR debian:bookworm ./merged.=
sh
>>>>> """
>>>>>
>>>>> I assume we could simply use COPY in the Containerfile and include th=
e
>>>>> shell script in there and run the shell script in a single RUN. You
>>>>> could then do the cleanup step in a separate layer, not optimal since
>>>>> the layer will be unnecessarily big but I assume the end image is goi=
ng
>>>>> to be smaller anyway?
>>>>>
>>>>> The benefit is that you test **exactly** what's in the documentation.
>>>>> And also you don't have to parse YAML. And it should be relatively ea=
sy
>>>>> to add support for new distros.
>>>>>
>>>>> What do you think?
>>>>
>>>> I like this idea! Only downside I see is to have to re-run "apt get in=
stall" for
>>>> each run command, which is not really ideal IMO. I prefer caching what=
's already
>>>
>>> No? I have one RUN command which is "execute this shell script".
>>> Whatever is executed as part of this shell script is part of one layer.
>>> You could even have one RUN command which is apt-get update &&
>>> my-shell-script && apt-get cache remove whatever to make this a smaller
>>> layer.
>>=20
>> So let me know if I got this wrong, but running "podman run ..." multipl=
e times
>> is going to make use of a cached layer automagically? I.e. merged.sh is =
not
>> re-run each time? Or you are implying that there is still a Containerfil=
e in the
>> process that caches this data?
>>=20
>
> OK, so I actually didn't write what I was thinking about :)
>
> To answer your question, podman run cannot cache what's running in there=
=20
> with the above command, so it's run every time. This is fine for our=20
> manual because we do want to run those commands every time and not rely=
=20
> on caching (e.g. because we build the HEAD of some git repo and that=20
> **is** desired).
>
> But we could simply generate this merged.sh script before podman build=20
> and pass it inside the Containerfile so it makes it as a layer.
>
> Obviously, any change to the shell script would trigger the COPY layer=20
> to change and everything after be rebuilt. So the cache will work until=
=20
> the shell script content (mtime actually I believe?) changes.

Okay, we're on the same page, thanks for clarifying!

>>>> been downloaded so we can re-build the doc swiftly (I imagined this sc=
ript to be
>>>> used for more than verifying that what we list in the dep list is enou=
gh to
>>>> build, and used by anyone to test their changes to the docs easily).
>>>>
>>>
>>> You can have as many scripts as you want? And have them do as many or
>>> little things as you want, I'm not sure to follow what you have in mind
>>> here?
>>=20
>> That wasn't clear maybe. I simply meant to say that I want to publish th=
is
>> script not only for verifying that listed dependencies are correct, but =
also
>> because it's convenient for anyone to build the documentation. It's unre=
lated to
>> your solution.
>>=20
>
> I'm working on something right now, will send as RFC so you can comment=
=20
> on it. Should happen today or tomorrow.

Nice! Are you basing things on top of my patch? Or is it separate? I got a =
v3
ready in any case.

> BTW, I'm unable to build the docs on openSUSE Leap 15.4/15.5/15.6. It=20
> seems it's always trying to build from python 3.6 and something breaks=20
> in the sphinx part very early:
>
> 0efb6adca777:/docs # make -C documentation/ html
> make: Entering directory '/docs/documentation'
> ./set_versions.py
> Traceback (most recent call last):
>    File "./set_versions.py", line 102, in <module>
>      subprocess.run(["git", "show", "yocto-%s" %=20
> release_series[activereleases[0]]], capture_output=3DTrue, check=3DTrue)
>    File "/usr/lib64/python3.6/subprocess.py", line 423, in run
>      with Popen(*popenargs, **kwargs) as process:
> TypeError: __init__() got an unexpected keyword argument 'capture_output'
> make: *** [Makefile:78: html] Error 1
> make: Leaving directory '/docs/documentation'

As expected, documentation builds aren't really working on all distros :/ T=
hanks
for reporting this. Hopefully the scripts will help with that.


Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

