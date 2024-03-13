Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB390C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 09:43:00 +0000 (UTC)
Received: from smtp-8faf.mail.infomaniak.ch (smtp-8faf.mail.infomaniak.ch [83.166.143.175])
 by mx.groups.io with SMTP id smtpd.web10.12318.1710322973113466981
 for <docs@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 02:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.175, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4TvltM2K4lzR0v;
	Wed, 13 Mar 2024 10:42:51 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4TvltL2YZZzvxK;
	Wed, 13 Mar 2024 10:42:50 +0100 (CET)
Date: Wed, 13 Mar 2024 10:42:49 +0100
From: Quentin Schulz <foss+yocto@0leil.net>
To: michael.opdenacker@bootlin.com,
 "Michael Opdenacker via lists.yoctoproject.org" <michael.opdenacker=bootlin.com@lists.yoctoproject.org>,
 docs@lists.yoctoproject.org
CC: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [docs] [PATCH] manuals: add initial stylechecks with Vale
In-Reply-To: <20240312210345.8832-1-michael.opdenacker@bootlin.com>
References: <20240312210345.8832-1-michael.opdenacker@bootlin.com>
Message-ID: <CB05F1E2-1F4B-4D7F-8920-D8914CB93E3D@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Infomaniak-Routing: alpha
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 13 Mar 2024 09:43:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4948

Hi Michael,

On March 12, 2024 10:03:45 PM GMT+01:00, "Michael Opdenacker via lists=2Ey=
octoproject=2Eorg" <michael=2Eopdenacker=3Dbootlin=2Ecom@lists=2Eyoctoproje=
ct=2Eorg> wrote:
>From: Michael Opdenacker <michael=2Eopdenacker@bootlin=2Ecom>
>
>Use the "Vale" (https://vale=2Esh) tool to perform text style checks
>Run "make stylecheck" to run the checks=2E
>
>This just checks the text, not the Sphinx syntax style choices=2E
>
>Signed-off-by: Michael Opdenacker <michael=2Eopdenacker@bootlin=2Ecom>
>Suggested-by: Thomas Petazzoni <thomas=2Epetazzoni@bootlin=2Ecom>
>
>---
>
>See https://lwn=2Enet/Articles/964075/ for a recent introduction=2E

This is an article that requires subscription to LWN unfortunately=2E

>Don't hesitate to run the checks, propose fixes for the reported
>issues and improvements to the checking rules and accepted words!
>---
> documentation/=2Egitignore                          |  2 ++
> documentation/=2Evale=2Eini                           |  7 +++++++
> documentation/Makefile                            |  9 ++++++++-
> documentation/README                              | 14 ++++++++++++++
> documentation/standards=2Emd                        | 15 +++++++++++++++
> =2E=2E=2E/config/vocabularies/OpenSource/accept=2Etxt     |  4 ++++
> =2E=2E=2E/styles/config/vocabularies/Yocto/accept=2Etxt   |  4 ++++
> 7 files changed, 54 insertions(+), 1 deletion(-)
> create mode 100644 documentation/=2Evale=2Eini
> create mode 100644 documentation/styles/config/vocabularies/OpenSource/a=
ccept=2Etxt
> create mode 100644 documentation/styles/config/vocabularies/Yocto/accept=
=2Etxt
>
>diff --git a/documentation/=2Egitignore b/documentation/=2Egitignore
>index 494b4f4de5=2E=2Eb23d598054 100644
>--- a/documentation/=2Egitignore
>+++ b/documentation/=2Egitignore
>@@ -7,3 +7,5 @@ releases=2Erst
> =2Evscode/
> */svg/*=2Epng
> */svg/*=2Epdf
>+styles/*
>+!styles/config
>diff --git a/documentation/=2Evale=2Eini b/documentation/=2Evale=2Eini
>new file mode 100644
>index 0000000000=2E=2E02042bb632
>--- /dev/null
>+++ b/documentation/=2Evale=2Eini
>@@ -0,0 +1,7 @@
>+StylesPath =3D styles
>+MinAlertLevel =3D suggestion
>+Packages =3D RedHat, proselint, write-good, alex, Readability, Joblint
>+Vocab =3D Yocto, OpenSource
>+[*=2Erst]
>+BasedOnStyles =3D Vale, RedHat, proselint, write-good, alex, Readability=
, Joblint
>+
>diff --git a/documentation/Makefile b/documentation/Makefile
>index 9fb6814c8f=2E=2Ee1b61f17f1 100644
>--- a/documentation/Makefile
>+++ b/documentation/Makefile
>@@ -5,6 +5,9 @@
> # from the environment for the first two=2E
> SPHINXOPTS    ?=3D -W --keep-going -j auto
> SPHINXBUILD   ?=3D sphinx-build
>+# Release notes are excluded because they contain contributor names and =
commit messages which can't be modified
>+VALEOPTS      ?=3D --no-wrap --no-wrap --glob '!migration-guides/release=
-notes-*=2Erst'

Do we really need `--no-wrap` twice here?

[=2E=2E=2E]

>diff --git a/documentation/standards=2Emd b/documentation/standards=2Emd
>index 9f4771ebd9=2E=2Ea4f8be0dcf 100644
>--- a/documentation/standards=2Emd
>+++ b/documentation/standards=2Emd
>@@ -5,6 +5,21 @@ documentation is created=2E
>=20
> It is currently a work in progress=2E
>=20
>+## Automatic style validation
>+
>+There is an ongoing effort to automate style validation
>+through the [Vale](https://vale=2Esh/)=2E To try it, run:
>+
>+    $ make vale
>+

Isn't this supposed to be `make stylecheck` here?

>+Note that this just applies to text=2E Therefore, the syntax
>+conventions described below still apply=2E
>+
>+If you wish to add words to the "accept=2Etxt" files
>+(=2E/styles/config/vocabularies/<Vocab>/accept=2Etxt),
>+make sure the spelling and capitalization matches
>+what Wikipedia uses=2E Wikipedia is our reference!
>+
> ## Text standards
>=20
> ### Bulleted lists
>diff --git a/documentation/styles/config/vocabularies/OpenSource/accept=
=2Etxt b/documentation/styles/config/vocabularies/OpenSource/accept=2Etxt
>new file mode 100644
>index 0000000000=2E=2E98e76ae1f5
>--- /dev/null
>+++ b/documentation/styles/config/vocabularies/OpenSource/accept=2Etxt
>@@ -0,0 +1,4 @@
>+ftrace
>+toolchain
>+systemd
>+LTTng

Are those strings matched even when they are highlighted with simple/doubl=
e tick quotes? If not, that could be a way to not have to expand this list =
too often and also it's nice to highlight the name of pieces of SW (well, e=
xcluding toolchain from my remark obviously)=2E

Cheers,
Quentin

