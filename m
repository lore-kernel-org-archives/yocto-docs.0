Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2151EFB815
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 08:28:58 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15941.1771921731176661064
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 00:28:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uwYweqkV;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 513FEC143E3
	for <docs@lists.yoctoproject.org>; Tue, 24 Feb 2026 08:29:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC9FF5FD9D;
	Tue, 24 Feb 2026 08:28:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A222B10368B4A;
	Tue, 24 Feb 2026 09:28:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771921728; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9wTihPh5cyLZTQDCj99fjjTqB6Jno85HhATMteyjFTw=;
	b=uwYweqkVjfxQU2b4XkoVq/2eVvmR5kTrD8oO+xGgp6/DcAyQpGeAjWp+aZ3Bq4xfpdNr3t
	FGxKBqfI+8SsZMjV8jmcL0fiBrVh9YdjCMyGemPM5LruSd/E45gIVYSuHSuip9NnLtpuEo
	zqRKXwckIT+kLikpKRFpNFZ9iTIIupwL3sxt9jWeiF6kbsDqAl+E0pyfo0/fMBbTIsq9gw
	ouyig8yRKDmrgxhEft6e2o4fdxLA9hr7EPd6gSRVwV4xcR+dYhA9rTJLcojTAb6NMUuS3I
	nF6Zm9ug4N+TC5idIUs4Zmy4MrptH3mA8iK4kOowmy2WbStxT3hkXRwAIrzkIA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 09:28:47 +0100
Message-Id: <DGN1TVXRNHW7.2TYSX3YXZYQB5@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Quentin Schulz" <quentin.schulz@cherry.de>, <foss@0leil.net>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v4 1/3] use a venv for installing packages with
 pip
References: <20260216-fix-make-multi-target-v4-0-749e588cb7f5@cherry.de>
 <20260216-fix-make-multi-target-v4-1-749e588cb7f5@cherry.de>
 <DGHXUDE510VH.1JG9S6P90SNTG@bootlin.com>
 <e41bdc41-be0f-4c85-bcbd-e00b10433336@cherry.de>
In-Reply-To: <e41bdc41-be0f-4c85-bcbd-e00b10433336@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Feb 2026 08:28:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8964

Hi,

On Mon Feb 23, 2026 at 6:33 PM CET, Quentin Schulz wrote:
> Hi Antonin,
>
> On 2/18/26 9:18 AM, Antonin Godard wrote:
>> Hi,
>>=20
>> On Mon Feb 16, 2026 at 12:26 PM CET, Quentin Schulz via lists.yoctoproje=
ct.org wrote:
>> [...]
>>> diff --git a/documentation/tools/host_packages_scripts/pip3_docs.sh b/d=
ocumentation/tools/host_packages_scripts/pip3_docs.sh
>>> index 907ecec55..9aa7f16fb 100644
>>> --- a/documentation/tools/host_packages_scripts/pip3_docs.sh
>>> +++ b/documentation/tools/host_packages_scripts/pip3_docs.sh
>>> @@ -1 +1,3 @@
>>> -sudo pip3 install sphinx sphinx_rtd_theme pyyaml sphinx-copybutton
>>> +python3 -m venv --clear --system-site-packages /tmp/yocto-venv
>>=20
>> I find /tmp a bit odd for installing a virtual environment (at least, fr=
om a
>> user perspective, as I can understand why you did this for the container=
).
>>=20
>> Maybe you can add a comment above this line saying:
>>=20
>> # change "/tmp/yocto-venv" to "./yocto-venv" if you want a persistent vi=
rtual environment
>>=20
>> ?
>>=20
>
> I can do yet another sed in Containerfile to avoid telling the user to=20
> do that and just have the path different in the container (see what we=20
> do for zypper install commands). I tried mounting the volume=20
> (yocto-docs) as an overlay within the container (:O in podman) but that=
=20

You mean yocto-venv?

> didn't work, so we have to have the venv outside of the mounting point.

Sure, I guess it's best if we can show the user the proper way of setting t=
hings
up while doing it our way.

>> Also maybe, s/yocto-venv/yocto-docs-venv/?
>>=20
>
> I was about to interject that because we use --system-site-packages, we=
=20
> could still run bitbake from within the venv and thus renaming it is=20
> unnecessary, but then I tried building the docs locally on my f43 system=
=20
> and this series doesn't actually work.
>
> It complains about not being able to find sphinxcontrib.rsvgconverter=20
> plugin while it definitely is installed!
>
> Then I remembered having a somewhat similar issue in my Python=20
> pet-project when I had the same package installed twice, once=20
> system-wide and once in a venv... Turns out that a package which=20
> installs a command/script doesn't seem to work with venv (at least with=
=20
> my sample pool of... 2). It would always use the system's when using the=
=20
> command (and it'd be fine with python3 -m <package> as far as I remember)=
.
> sphinx-build actually is a script, c.f.=20
> https://github.com/sphinx-doc/sphinx/blob/master/pyproject.toml#L99. So=
=20
> when our Makefile calls sphinx-build, it may very well be calling the=20
> system package if there's one and not the command for the sphinx within=
=20
> the venv. This results in not being able to find the modules installed=20
> in the venv (that is, sphinxcontrib.rsvgconverter). But Quentin, you=20
> would say, simply replace sphinx-build with python3 -m sphinx and all=20
> shall be well! Now the sphinx Python module used is indeed the one from=
=20
> the venv, but it cannot find the system modules anymore. If anyone has=20
> any idea what's going on, let me know but I don't think I'll investigate=
=20
> this further.
>
> Instead, I'll NOT pass --system-site-packages to venv such that we only=
=20
> have packages from PyPI (which means, not being able to run BitBake from=
=20
> that venv). Now... this still doesn't resolve the issue of sphinx-build=
=20
> calling the module from the system if it exists...

I did some tests:

=E2=9E=9C  ~ mktemp -d
/tmp/tmp.M4eSbciQhZ
=E2=9E=9C  ~ cd /tmp/tmp.M4eSbciQhZ
=E2=9E=9C  which sphinx-build
/usr/bin/sphinx-build
=E2=9E=9C  python -m venv .venv
=E2=9E=9C  source .venv/bin/activate
=E2=9E=9C  pip install sphinx >/dev/null
=E2=9E=9C  which sphinx-build
/usr/bin/sphinx-build

Maybe you're also hitting this. Now after running:

=E2=9E=9C  rehash
=E2=9E=9C  which sphinx-build
/tmp/tmp.M4eSbciQhZ/.venv/bin/sphinx-build

Looks like it's working now. rehash seems specific to zsh in my case, bash =
does
not know this command. But bash does not need to rehash, it works out of th=
e box
for me with bash.

> So I plan to change sphinx-build to python3 -m sphinx in our Makefile to
> work-around that. Any objection? Did I miss something or get something wr=
ong
> maybe?

I thought of doing:

diff --git a/documentation/tools/containerfiles/Containerfile.apt b/documen=
tation/tools/containerfiles/Containerfile.apt
index a573786f0..0861354fb 100644
--- a/documentation/tools/containerfiles/Containerfile.apt
+++ b/documentation/tools/containerfiles/Containerfile.apt
@@ -17,9 +17,9 @@ COPY --chmod=3D777 ${DOCS_PDF} /temp/host_packages_docs_p=
df.sh
 RUN ln -fs "/usr/share/zoneinfo/$TZ" /etc/localtime \
  && apt-get update \
  && apt-get install -y sudo \
- && if [ "$INCLUDE_ESSENTIAL_PACKAGES" =3D "1" ]; then yes | /temp/host_pa=
ckages_essential.sh; fi \
- && yes | /temp/host_packages_docs.sh \
- && yes | /temp/host_packages_docs_pdf.sh \
+ && if [ "$INCLUDE_ESSENTIAL_PACKAGES" =3D "1" ]; then yes | bash /temp/ho=
st_packages_essential.sh; fi \
+ && yes | bash /temp/host_packages_docs.sh \
+ && yes | bash /temp/host_packages_docs_pdf.sh \
  && apt-get --yes autoremove \
  && apt-get clean \
  && rm -rf /temp

Or add a shebang to the snippets=E2=80=A6 but that makes them non "copy-pas=
teable".

So, yes, I vote for "python -m sphinx" too! Seems like a good solution to m=
e :)

Antonin

