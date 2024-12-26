Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B31E77188
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 10:42:01 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.19902.1735209711352565799
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Dec 2024 02:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OsosgYyT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F41B1BF207;
	Thu, 26 Dec 2024 10:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735209709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hLUj6HLQfWzUUyVbbBt41g5kHQeY5z6zSELM8fubgXg=;
	b=OsosgYyT5m1wbc5ZdstGFv15oL+Nqo7uOaS5/9bQ+dfKwCO/bvTBRYBwYOoc5gyK4/mu1h
	YZQGBmUpyo4DuSk9XyRdAOfqFxeX/1arf9qZwdYH0jmcb4oqUx0Vv7oMsHz8j2TXCgbNij
	rGkAxgacb/CRnuHKBjG4W9uWH/u8/8MNxmB7TOa2z2zhLU93q5a/5xpVqoJgVB0yWzN/UQ
	uC0esmdFUwAph5Q1VCCNArRP0gAEWcp33+vL282waGBXonh4sv+FVizmJ/uwD9/2Vq9GBG
	0dsPSkLM+ot3nOWllKbyMsSoRw59zw4AhgXT+W/bXOzx/HIVaoLbPUo+Hnebnw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Dec 2024 11:41:48 +0100
Message-Id: <D6LKI7KCD6K5.3S86QV4WB1OYF@bootlin.com>
Subject: Re: [docs] [PATCH RFC v2 2/2] tools: add script for building
 documentation inside containers
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <foss@0leil.net>, "Quentin Schulz"
 <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20241217-instructions-shell-container-v2-0-ce687b0cfac2@cherry.de> <20241217-instructions-shell-container-v2-2-ce687b0cfac2@cherry.de>
In-Reply-To: <20241217-instructions-shell-container-v2-2-ce687b0cfac2@cherry.de>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 26 Dec 2024 10:42:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6038

Hi Quentin,

On Tue Dec 17, 2024 at 5:08 PM CET, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>
> This adds a script for building a container and building the
> documentation within that new container image.
>
> The openSUSE instructions now require a --non-interactive flag otherwise
> they fail to run. Sadly there doesn't seem to be a way to have this in
> an environment variable =C3=A0-la DEBIAN_FRONTEND=3Dnoninteractive.

Hmm, this means that we end up instructing to pass "--non-interactive" in t=
he
docs? That's not ideal :/ I suggested a workaround below.

I hope there won't be too many cases where we have to do things differently=
 in
the context of a containerfile in the future. Apart from this case I cannot
think of anything else that could happen. Anything comes to mind for you?

> Somehow tzdata package in Ubuntu doesn't respect
> DEBIAN_FRONTEND=3Dnoninteractive hence why the timezone needs to be set b=
y
> hand.
>
> Note that only instructions for Debian Bookworm (12), Ubuntu 22.04 and
> 24.04, and Fedora 38, 39 and 40, currently work.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  documentation/tools/Containerfile.almalinux        |   1 +
>  documentation/tools/Containerfile.apt              |  26 +++++
>  documentation/tools/Containerfile.debian           |   1 +
>  documentation/tools/Containerfile.dnf              |  25 +++++
>  documentation/tools/Containerfile.fedora           |   1 +
>  documentation/tools/Containerfile.ubuntu           |   1 +
>  documentation/tools/Containerfile.zypper           |  24 +++++
>  documentation/tools/build-docs-container           | 113 +++++++++++++++=
++++++
>  .../tools/host_packages_scripts/opensuse_docs.sh   |   2 +-
>  .../host_packages_scripts/opensuse_docs_pdf.sh     |   2 +-
>  .../host_packages_scripts/opensuse_essential.sh    |   2 +-
>  11 files changed, 195 insertions(+), 3 deletions(-)
>
> diff --git a/documentation/tools/Containerfile.almalinux b/documentation/=
tools/Containerfile.almalinux
> new file mode 120000
> index 0000000000000000000000000000000000000000..7237e9b99f4132957c0ad5b11=
fa6cefe9daaec74
> --- /dev/null
> +++ b/documentation/tools/Containerfile.almalinux
> @@ -0,0 +1 @@
> +Containerfile.dnf
> \ No newline at end of file
> diff --git a/documentation/tools/Containerfile.apt b/documentation/tools/=
Containerfile.apt
> new file mode 100644
> index 0000000000000000000000000000000000000000..5e30b65eb8f81a7764c00eb10=
78dabaf59b64517
> --- /dev/null
> +++ b/documentation/tools/Containerfile.apt
> @@ -0,0 +1,26 @@
> +ARG ARG_FROM=3Ddebian:12 # default value to avoid warning
> +FROM $ARG_FROM
> +
> +ARG DOCS=3Dubuntu_docs.sh
> +ARG DOCS_PDF=3Dubuntu_docs_pdf.sh
> +
> +ENV DEBIAN_FRONTEND=3Dnoninteractive
> +ARG TZ=3DEurope/Vienna
> +
> +# relative to the location of the dockerfile
> +COPY --chmod=3D777 ${DOCS} /temp/host_packages_docs.sh
> +COPY --chmod=3D777 ${DOCS_PDF} /temp/host_packages_docs_pdf.sh
> +
> +RUN ln -fs "/usr/share/zoneinfo/$TZ" /etc/localtime \
> + && apt-get update \
> + && apt-get install -y sudo \
> + && yes | /temp/host_packages_docs.sh \
> + && yes | /temp/host_packages_docs_pdf.sh \
> + && apt-get --yes autoremove \
> + && apt-get clean \
> + && rm -rf /temp
> +
> +RUN git config --global --add safe.directory /docs
> +
> +ENTRYPOINT ["/usr/bin/env", "make", "-C", "documentation/"]
> +CMD ["publish"]
> diff --git a/documentation/tools/Containerfile.debian b/documentation/too=
ls/Containerfile.debian
> new file mode 120000
> index 0000000000000000000000000000000000000000..5a7a425197afc2928802fcad5=
f34699b1ad3348a
> --- /dev/null
> +++ b/documentation/tools/Containerfile.debian
> @@ -0,0 +1 @@
> +Containerfile.apt
> \ No newline at end of file
> diff --git a/documentation/tools/Containerfile.dnf b/documentation/tools/=
Containerfile.dnf
> new file mode 100644
> index 0000000000000000000000000000000000000000..3dae74445585961a6f2d29b8a=
cde09f2456dd886
> --- /dev/null
> +++ b/documentation/tools/Containerfile.dnf
> @@ -0,0 +1,25 @@
> +ARG ARG_FROM=3Dfedora:40 # default value to avoid warning
> +FROM $ARG_FROM
> +
> +ARG DOCS=3Dfedora_docs.sh
> +ARG DOCS_PDF=3Dfedora_docs_pdf.sh
> +ARG PIP3=3Dpip3_docs.sh
> +
> +# relative to the location of the dockerfile
> +COPY --chmod=3D777 ${DOCS} /temp/host_packages_docs.sh
> +COPY --chmod=3D777 ${DOCS_PDF} /temp/host_packages_docs_pdf.sh
> +COPY --chmod=3D777 ${PIP3} /temp/pip3_docs.sh
> +
> +RUN dnf update -y \
> + && dnf install -y sudo \
> + && yes | /temp/host_packages_docs.sh \
> + && yes | /temp/host_packages_docs_pdf.sh \
> + && yes | /temp/pip3_docs.sh \
> + && dnf autoremove -y \
> + && dnf clean all -y \
> + && rm -rf /temp
> +
> +RUN git config --global --add safe.directory /docs
> +
> +ENTRYPOINT ["/usr/bin/env", "make", "-C", "documentation/"]
> +CMD ["publish"]
> diff --git a/documentation/tools/Containerfile.fedora b/documentation/too=
ls/Containerfile.fedora
> new file mode 120000
> index 0000000000000000000000000000000000000000..7237e9b99f4132957c0ad5b11=
fa6cefe9daaec74
> --- /dev/null
> +++ b/documentation/tools/Containerfile.fedora
> @@ -0,0 +1 @@
> +Containerfile.dnf
> \ No newline at end of file
> diff --git a/documentation/tools/Containerfile.ubuntu b/documentation/too=
ls/Containerfile.ubuntu
> new file mode 120000
> index 0000000000000000000000000000000000000000..5a7a425197afc2928802fcad5=
f34699b1ad3348a
> --- /dev/null
> +++ b/documentation/tools/Containerfile.ubuntu
> @@ -0,0 +1 @@
> +Containerfile.apt
> \ No newline at end of file
> diff --git a/documentation/tools/Containerfile.zypper b/documentation/too=
ls/Containerfile.zypper
> new file mode 100644
> index 0000000000000000000000000000000000000000..bcda5261ae98e8df16a3bcef1=
7a7bf204033da99
> --- /dev/null
> +++ b/documentation/tools/Containerfile.zypper
> @@ -0,0 +1,24 @@
> +ARG ARG_FROM=3Dopensuse/leap:15.4 # default value to avoid warning
> +FROM $ARG_FROM
> +
> +ARG DOCS=3Dopensuse_docs.sh
> +ARG DOCS_PDF=3Dopensuse_docs_pdf.sh
> +ARG PIP3=3Dpip3_docs.sh
> +
> +# relative to the location of the dockerfile
> +COPY --chmod=3D777 ${DOCS} /temp/host_packages_docs.sh
> +COPY --chmod=3D777 ${DOCS_PDF} /temp/host_packages_docs_pdf.sh
> +COPY --chmod=3D777 ${PIP3} /temp/pip3_docs.sh

A bit of a hacky workaround, but maybe here run
sed -i 's/zypper/zypper --non-interactive/ ...' on the scripts? So we don't=
 need
to provide this option in the doc.

> +
> +RUN zypper update -y \
> + && zypper install -y sudo \
> + && yes | /temp/host_packages_docs.sh \
> + && yes | /temp/host_packages_docs_pdf.sh \
> + && yes | /temp/pip3_docs.sh \
> + && zypper clean --all \
> + && rm -rf /temp
> +
> +RUN git config --global --add safe.directory /docs
> +
> +ENTRYPOINT ["/usr/bin/env", "make", "-C", "documentation/"]
> +CMD ["publish"]
> diff --git a/documentation/tools/build-docs-container b/documentation/too=
ls/build-docs-container
> new file mode 100755
> index 0000000000000000000000000000000000000000..f382af75a7e89cfcc8a6080fd=
bc65fb68ff9ea8d
> --- /dev/null
> +++ b/documentation/tools/build-docs-container
> @@ -0,0 +1,113 @@
> +#!/usr/bin/env bash
> +#
> +# Build a container ready to build the documentation be reading the depe=
ndencies
> +# listed in shell scripts in documentation/tools/host_packages_scripts, =
and
> +# start a documentation build in this container.
> +#
> +# Usage:
> +#
> +#   ./documentation/tools/build-docs-container <image> [<make target>]
> +#
> +# e.g.:
> +#
> +#   ./documentation/tools/build-docs-container ubuntu:24.04 html
> +#
> +# Will build the docs in an Ubuntu 24.04 container in html.
> +#
> +# The container engine can be selected by exporting CONTAINERCMD in the
> +# environment. The default is docker, but podman can also be used.
> +
> +set -eu -o pipefail
> +
> +SCRIPT_DIR=3D$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && =
pwd)
> +CONTAINERCMD=3D${CONTAINERCMD:-docker}
> +DOCS_DIR=3D"$SCRIPT_DIR/../.."
> +SH_DIR=3D"$SCRIPT_DIR/host_packages_scripts"
> +
> +main ()
> +{

I would be good to have a check here to avoid

  $ ./tools/build-docs-container
  ./tools/build-docs-container: line 29: $1: unbound variable

You could probably copypaste what I did in my version of the script.

> +  local image=3D"$1"
> +  shift
> +
> +  OCI=3D$(which "$CONTAINERCMD")
> +
> +  # docker build doesn't accept 2 colons, so "sanitize" the name
> +  local sanitized_dockername
> +  sanitized_dockername=3D$(echo "$image" | tr ':.' '-')
> +
> +  local version
> +  version=3D$(echo "$image" | awk -F: '{print $NF}')
> +
> +  case $image in
> +    almalinux*)
> +      containerfile=3DContainerfile.almalinux
> +      docs=3Dalmalinux_docs.sh
> +      docs_pdf=3Dalmalinux_docs_pdf.sh
> +      pip3=3Dpip3_docs.sh
> +      ;;
> +    debian*)
> +      containerfile=3DContainerfile.debian
> +      docs=3Dubuntu_docs.sh
> +      docs_pdf=3Dubuntu_docs_pdf.sh
> +      ;;
> +    fedora*)
> +      containerfile=3DContainerfile.fedora
> +      docs=3Dfedora_docs.sh
> +      docs_pdf=3Dfedora_docs_pdf.sh
> +      pip3=3Dpip3_docs.sh
> +      ;;
> +    opensuse* | leap*)
> +      image=3Dopensuse/leap:$version
> +      containerfile=3DContainerfile.zypper
> +      docs=3Dopensuse_docs.sh
> +      docs_pdf=3Dopensuse_docs_pdf.sh
> +      pip3=3Dpip3_docs.sh
> +      ;;
> +    ubuntu*)
> +      containerfile=3DContainerfile.ubuntu
> +      docs=3Dubuntu_docs.sh
> +      docs_pdf=3Dubuntu_docs_pdf.sh
> +      ;;
> +    *)
> +      echo "$image not supported"

Can we have a way of listing images here so a user doesn't need to read the
script and guess which one to use?

> +      exit 1
> +      ;;
> +  esac
> +
> +  $OCI build \
> +    --tag "yocto-docs-$sanitized_dockername:latest" \
> +    --build-arg ARG_FROM=3D"docker.io/$image" \
> +    --build-arg DOCS=3D"$docs" \
> +    --build-arg DOCS_PDF=3D"$docs_pdf" \
> +    --build-arg PIP3=3D"${pip3:-}" \
> +    --file "$SCRIPT_DIR/$containerfile" \
> +    "$SH_DIR/"
> +
> +  local -a args_run=3D(
> +    --rm
> +    --interactive
> +    --tty
> +    --volume=3D"$DOCS_DIR:/docs:rw"
> +    --workdir=3D/docs
> +    --security-opt label=3Ddisable
> +  )
> +
> +  if [ "$OCI" =3D "docker" ]; then
> +    args_run+=3D(
> +      --user=3D"$(id -u)":"$(id -g)"
> +    )
> +  elif [ "$OCI" =3D "podman" ]; then
> +    # we need net access to fetch bitbake terms
> +    args_run+=3D(
> +      --cap-add=3DNET_RAW
> +      --userns=3Dkeep-id
> +    )
> +  fi
> +
> +  $OCI run \
> +    "${args_run[@]}" \
> +    "yocto-docs-$sanitized_dockername" \
> +    "$@"
> +}
> +
> +main "$@"
> diff --git a/documentation/tools/host_packages_scripts/opensuse_docs.sh b=
/documentation/tools/host_packages_scripts/opensuse_docs.sh
> index 7d36eb0f99668168dc4fed44d71181338bdc59a3..896ad52b5042a9679555a30e5=
82fa32076c3a3e7 100644
> --- a/documentation/tools/host_packages_scripts/opensuse_docs.sh
> +++ b/documentation/tools/host_packages_scripts/opensuse_docs.sh
> @@ -1 +1 @@
> -sudo zypper install git glibc-i18ndata make python3-pip rsvg-convert whi=
ch
> +sudo zypper --non-interactive install git glibc-i18ndata make python3-pi=
p rsvg-convert which
> diff --git a/documentation/tools/host_packages_scripts/opensuse_docs_pdf.=
sh b/documentation/tools/host_packages_scripts/opensuse_docs_pdf.sh
> index ee9f07886ce1c0eac8e1d1118cda8ddc496f0139..f8a3b800d9790c0434f0c3f57=
7ea1916a7fe1b28 100644
> --- a/documentation/tools/host_packages_scripts/opensuse_docs_pdf.sh
> +++ b/documentation/tools/host_packages_scripts/opensuse_docs_pdf.sh
> @@ -1 +1 @@
> -sudo zypper install 'texlive-collection-lang*' texlive-collection-fontse=
xtra texlive-collection-fontsrecommended texlive-collection-latex texlive-c=
ollection-latexextra texlive-collection-latexrecommended texlive-collection=
-xetex texlive-fncychap texlive-gnu-freefont texlive-latexmk texlive-tex-gy=
re texlive-xetex
> +sudo zypper --non-interactive install 'texlive-collection-lang*' texlive=
-collection-fontsextra texlive-collection-fontsrecommended texlive-collecti=
on-latex texlive-collection-latexextra texlive-collection-latexrecommended =
texlive-collection-xetex texlive-fncychap texlive-gnu-freefont texlive-late=
xmk texlive-tex-gyre texlive-xetex
> diff --git a/documentation/tools/host_packages_scripts/opensuse_essential=
.sh b/documentation/tools/host_packages_scripts/opensuse_essential.sh
> index a784f4a5dc05f3734177f08ed97663a04d20a978..19e85f4a736532b890fc55492=
721cf345c2b4083 100644
> --- a/documentation/tools/host_packages_scripts/opensuse_essential.sh
> +++ b/documentation/tools/host_packages_scripts/opensuse_essential.sh
> @@ -1,2 +1,2 @@
> -sudo zypper install bzip2 chrpath diffstat gcc gcc-c++ git gzip hostname=
 libacl1 lz4 make makeinfo patch python python-curses python-xml python3 py=
thon3-Jinja2 python3-curses python3-pexpect python3-pip rpcgen socat tar wg=
et which xz zstd
> +sudo zypper --non-interactive install bzip2 chrpath diffstat gcc gcc-c++=
 git gzip hostname libacl1 lz4 make makeinfo patch python python-curses pyt=
hon-xml python3 python3-Jinja2 python3-curses python3-pexpect python3-pip r=
pcgen socat tar wget which xz zstd
>  sudo pip3 install GitPython

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

