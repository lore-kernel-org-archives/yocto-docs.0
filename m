Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1877DC531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 13:29:45 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19233.1784899779091622497
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jul 2026 06:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nr6+Z65V;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5E69F4E40F24;
	Fri, 24 Jul 2026 13:29:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 323FF60395;
	Fri, 24 Jul 2026 13:29:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C37411C103CD;
	Fri, 24 Jul 2026 15:29:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784899776; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E/U7hJT+Kj6Ea0/fdX1HdshqU1mBfyxolAHTZbhKU3U=;
	b=nr6+Z65VCRKrgbjBo5rcANQ5AkHorqZRh3ainnfVqeQwUmNpRDyIUyKXmADLKbOwOgessO
	I7AxJTVZ+dzn215YL19SD6fb0AETTmb+jcThN69mdr0fCXVT6GOz4NexlMTrEia8ufkf92
	iXjo+B7vgqHWXY13aAyNDXand1IufvckGMnbKIKijMuFaLgEI7O80IhgoCbaoKULsm/u4P
	9wSEHiEehJVh9WFidJQYQV7ZF9QVh6ywsl4/1XEUWZmih+OACZdwp/OG9/UywcPQJT/1fU
	0WyHIx6tHxyjMI5mGHM+VUg+Tm1JeAvTcYM13FPDGvhp/QkyEBSlRfzftX8Ucw==
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 15:29:34 +0200
Message-Id: <DK6U5WRXC6D8.1K2H139ELD32@bootlin.com>
Subject: Re: [docs] [PATCH] governance: Add start of project history and
 leadership sections
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <richard.purdie@linuxfoundation.org>, <docs@lists.yoctoproject.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260715144404.753400-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20260715144404.753400-1-richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jul 2026 13:29:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10138

Hi Richard,

Thanks for contributing this, there's valuable information in there. Here a=
re my
general remarks:

- I don't think this should be part of the "Manuals" section of the
  documentation. I propose that we make it a separate section instead, as I
  don't see where it could fit anywhere in the sections we have.

  On that topic, I've just sent a series that re-organizes the section a bi=
t
  [1]. But I think the "Governance and History" should be on the same level=
 as
  the "Security Reference" one (i.e. separate from the rest).

- Adding more dates (at least years) throughout the document might help rea=
ders
  understand better the temporality of the project.

Otherwise the rest of my suggestions are link additions, Sphinx syntax fixe=
s and
formatting. Below is the pasted diff. Feel free to apply these suggestions =
or
comment on them!

[1]: https://lore.kernel.org/r/20260724-rework-welcome-page-v1-0-491772cc4b=
65@bootlin.com


diff --git a/documentation/governance/history.rst b/documentation/governanc=
e/history.rst
index 9b63fdbbf..af2cb3091 100644
--- a/documentation/governance/history.rst
+++ b/documentation/governance/history.rst
@@ -5,12 +5,11 @@ Project History
 ***************
=20
 This history represents the information people have felt able to submit to=
 the
-documentation and is inteneded to be factual. Input from others is welcome=
d to
+documentation and is intended to be factual. Input from others is welcomed=
 to
 help broaden the perspectives.
=20
-
 Why does it matter?
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 The Yocto Project has now been around long enough that not everyone rememb=
ers
 how and why it was created, what decisions were made at the time, who was
@@ -28,23 +27,23 @@ of what happened and benefit from those experiences.
 Prehistory
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-The Yocto Project is based on OpenEmbedded as it's build system. It is wor=
th
+The Yocto Project is based on OpenEmbedded as its build system. It is wort=
h
 a few lines to mention the background. Around 2003, there were new cutting
 edge devices, "PDA"s on the market, such as Compaq iPaqs and the Sharp
 Zaurus. They had high resolution displays, touchscreens and ran Linux.
=20
-Project such as Buildroot (a makefile based build system) could build
+Project such as `Buildroot <https://buildroot.org/>`__ (a makefile based b=
uild system) could build
 software for them but a group of people decided that it might be possible =
to
 improve on the makefile approach. 'oemake' was created as a prototype,
 quickly splitting into 'bitbake' and 'openembedded' with the concept of
 recipes and classes being established.
=20
-There were multiple reasons for moving from buildroot. It was felt that a
+There were multiple reasons for moving from Buildroot. It was felt that a
 dedicated tool and file format might allow more flexibility. A single synt=
ax
 issue could take out a whole makefile based system. There was a feeling th=
at
 there should be a way to share commonality between devices more easily.
-There was also interest in taking on board some of the ideas from Portage.
-There was also interest in supporting package management which buildroot a=
t
+There was also interest in taking on board some of the ideas from :wikiped=
ia:`Portage <Portage_(software)>`.
+There was also interest in supporting package management which Buildroot a=
t
 the time did not.
=20
 There were soon several distributions built using this new system, Angstro=
m,
@@ -62,9 +61,9 @@ disagreement and conflict. This applied to simple things =
like a patch and
 complex areas like overall project direction.
=20
 Amongst other things, "classic OE" contained multiple different versions o=
f
-each software component, supported ipkg as it's package manager, had
+each software component, supported `ipkg <https://web.archive.org/web/2010=
0823030002/https://handhelds.org/moin/moin.cgi/Ipkg>`__ as it's package man=
ager, had
 separate install steps for the target install and the staging area and had
-one monolithic staging area shared by all pieces of software. Bitbake was
+one monolithic staging area shared by all pieces of software. BitBake was
 single threaded and would decide what it would execute next after the
 current recipe finished executing.
=20
@@ -80,7 +79,7 @@ resourced to do, being composed of effectively volunteers=
. It has had to be
 clear about this and ensure people have realistic expectations of it.
=20
 Yocto Project Formation
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 OpenEmbedded Classic did many things well but there were challenges and it
 struggled for effective commercial usage. OpenEmbedded had several develop=
er
@@ -110,7 +109,7 @@ recognising this role.
=20
 At this time, the initiative didn't have a name but this was the genesis o=
f
 what became the Yocto Project, commonly thought of as the second
-collaborative project formed at the Linux Foundation after the kernel
+collaborative project formed at the Linux Foundation after the Linux kerne=
l
 itself.
=20
 Development initially happened quietly, taking the Poky project from
@@ -129,31 +128,37 @@ was a starting point, not a done deal.
=20
 Significant discussion then happened between the Yocto Project and
 OpenEmbedded, with the OE TSC being empowered to lead those discussions. O=
ne
-of the issues was the monolithic openembedded monotone repository which
+of the issues was the monolithic ``openembedded`` monotone repository whic=
h
 many different people made commits to, sometimes conflicting, with no real
 testing of anything other than the committer's own use case.
=20
 After much discussion it was agreed that:
=20
-- openembedded would adopt a layer model to help scaling
-- monotone would be replaced by git
-- poky as it was then became "openembedded-core" as it was close to what w=
as
-  needed in the new model
-- "poky" became a reference implementation, distro and test vehicle for
-  Yocto Project
-- multiple versions of recipes were dropped where possible to focus on the
-  latest versions and resolve any issues they might have, focusing
-  development after success of the approach in poky
-- the older monolithic openembedded became known as "openembedded classic"
-- a significant effort would be made to document Bitbake and OpenEmbedded =
to
-  help mitigate its reputation for complexity
+-  OpenEmbedded would adopt a layer model to help scaling.
+
+-  Monotone would be replaced by Git.
+
+-  Poky as it was then became "openembedded-core" as it was close to what =
was
+   needed in the new model.
+
+-  "Poky" became a reference implementation, distro and test vehicle for
+   Yocto Project.
+
+-  Multiple versions of recipes were dropped where possible to focus on th=
e
+   latest versions and resolve any issues they might have, focusing
+   development after success of the approach in Poky.
+
+-  The older monolithic OpenEmbedded became known as "openembedded classic=
".
+
+-  A significant effort would be made to document BitBake and OpenEmbedded=
 to
+   help mitigate its reputation for complexity.
=20
 These changes met the needs of more commercially focused development and
 these items were things it was possible for the member organisations to he=
lp
 resource.
=20
 Early Developments
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Once the dust settled from those changes, the Yocto Project development
 resources from Intel, Wind River and others contributed some key changes t=
o
@@ -161,18 +166,22 @@ OpenEmbedded. There were often changes talked about a=
t many of the OE
 developer meetings (OEDEMs) but where the developers had not been able to
 find time/resources to make them happen.
=20
-- fakeroot was swapped for pseudo, donated from Wind River
-- the concept of sstate was developed meaning incremental builds became
+- ``fakeroot`` was swapped for ``pseudo``, donated from Wind River
+
+- The concept of `sstate` was developed meaning incremental builds became
   possible and output could be removed from the build directory structures=
.
   Initial versions of this were known as "packaged staging" as initially
   package manager involvement was assumed but this was eventually
   discounted.
-- the separate staging and target installs were combined
-- automated testing was developed based on buildbot (python based to match
-  the core developers skillset) creating the project "autobuilder"
-- support for rpm packages were added
=20
-Most of the project's budget focused either around autobuilder /
+- The separate staging and target installs were combined.
+
+- Automated testing was developed based on buildbot (python based to match
+  the core developers skillset) creating the "Autobuilder" project.
+
+- Support for RPM packages were added.
+
+Most of the project's budget focused either around Autobuilder /
 infrastructure costs (including a full time sysadmin) or on advocacy and
 presence at events to promote the project and encourage adoption and usage=
.
 The project was built on the model of shared collaboration, everyone using
@@ -187,7 +196,7 @@ each member.
=20
 Whilst a great intent, over time several problems were realised with this
 approach. Those engineers often only worked on things with a direct compan=
y
-interest, such as the companies own metadata layers. They would often be
+interest, such as the company's own metadata layers. They would often be
 pulled off onto emergency company specific issues. It was also contractual=
ly
 near impossible to enforce the requirement, or even audit it. This only
 became clear much later.
@@ -197,10 +206,10 @@ fund engineering or engineers, it provided the suppor=
t for the project
 structures but that engineering came from the project members directly.
 Funding any engineering work therefore had significant push back.
=20
-Development progresses
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Development Progresses
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-After an ELC-E where many different build systems had presentations, the
+After an ELC-E (Embedded Linux Conference Europe) where many different bui=
ld systems had presentations, the
 concept of "task signatures" was added to OpenEmbedded allowing the sstate
 to be matched and reused.
=20
@@ -217,7 +226,7 @@ to raise funds, some of which were used to pay for tech=
nical writing
 services. Intel and Texas Instruments became the first platinum members.
=20
 Early Governance
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 The early governance of the project consisted of members meetings, which
 were setup and chaired by the project's community manager, someone Intel
@@ -228,9 +237,9 @@ work into the project generally ended up with more sign=
ificant influence on
 direction. Where specific initiatives were needed for advocacy, e.g. the
 project launch, member sponsorship was usually found. The project also
 benefited from hardware donations/sponsorship to help infrastructure for
-the 'autobuilder', the project's solution to automated testing.
+the 'Autobuilder', the project's solution to automated testing.
=20
-Specific workgroups were formed for specific topic areas. In particular, a=
n
+Specific work groups were formed for specific topic areas. In particular, =
an
 advocacy team was formed to handle the project's presence at events and
 other promotional activities. There were also groups for infrastructure an=
d
 member recruitment.
@@ -239,12 +248,12 @@ Technical development was handled by Richard Purdie o=
n behalf of Yocto
 Project working directly with the OE TSC and reporting to the members, as
 well as management at member companies.
=20
-Governance changes
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Governance Changes
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Intel ended up providing significant developer resources that made
 significant valuable feature changes to the codebases but were also keepin=
g
-the project going with things like recipe version updates, autobuilder
+the project going with things like recipe version updates, Autobuilder
 triage and bug fixing. Whilst there were community contributions from othe=
r
 companies and individuals, people were happy to let Intel do as much as
 they were willing to. In the end, there were different priorities for Inte=
l
@@ -262,17 +271,21 @@ formed, the Linux Foundation had worked on many more =
collaborative projects
 and there were things to learn from.
=20
 Several new platinum members therefore joined to support these changes and=
 a
-process of changing and updating the governance was undertaken. A workgrou=
p
+process of changing and updating the governance was undertaken. A work gro=
up
 to focus on this was formed with the aim of writing a new participation
 agreement for members. There were multiple things people wanted to achieve
 including:
=20
-- Officially recognise the special relationship with OpenEmbedded
-- Have oversight of Richard Purdie's decision making
-- Creation of a Yocto Project TSC to make technical YP decisions
-- Formalise the project member benefits
-- Align the project with known LF best practise governance and charter
-  documents
+- Officially recognise the special relationship with OpenEmbedded.
+
+- Have oversight of Richard Purdie's decision making.
+
+- Creation of a Yocto Project TSC to make technical Yocto Project decision=
s.
+
+- Formalise the project member benefits.
+
+- Align the project with known Linux Foundation best practise governance a=
nd
+  charter documents.
=20
 These changes included the formation of the Yocto Project TSC which first
 met in June 2019. The TSC became necessary since the project was now
@@ -309,7 +322,7 @@ under-resourced Yocto Project" on Linux.com.
 <https://www.linux.com/news/maintainer-confidential-opportunities-and-chal=
lenges-of-the-ubiquitous-but-under-resourced-yocto-project/>`
=20
 Unexpectedly after publishing it, the Sovereign Tech Fund (STF, now the
-Sovereign Tech Agency), a German government technology fund, reached out t=
o
+:wikipedia:`Sovereign Tech Agency <Sovereign_Tech_Agency>`), a German gove=
rnment technology fund, reached out to
 the project to see if they could help. They had recognised these challenge=
s
 in the FOSS world and wanted to help. The project showed them the 5 year
 plan, hoping to fund a few of the areas but after discussion, it was
@@ -324,4 +337,3 @@ maintenance burdens. The big downside to the work was o=
nly having Richard to
 oversee it, so in the short term, the burn out problem became much worse,
 the opposite hope of the work. Overall for the project, this work was a
 huge success though and moved the project forward in many different areas.
-
diff --git a/documentation/governance/leadership.rst b/documentation/govern=
ance/leadership.rst
index 2bf85f87f..d41924b97 100644
--- a/documentation/governance/leadership.rst
+++ b/documentation/governance/leadership.rst
@@ -4,7 +4,8 @@
 Project Leadership History
 **************************
=20
-This section records the people who held various project leadership roles =
over time, without them the project would not be what it is today.
+This section records the people who held various project leadership roles =
over
+time, without them the project would not be what it is today.
=20
 Yocto Project Chair
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
@@ -47,13 +48,13 @@ Training Lead
=20
 - David Reyna 2014/10 - Current
=20
-YP TSC Chair
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Yocto Project TSC Chair
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 - Richard Purdie 2019/03 - Current
=20
-YP TSC Members
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Yocto Project TSC Members
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
=20
 - Armin Kuster 2019/03 - 2023/04
 - Khem Raj 2019/03 - 2025/05


Thanks!
Antonin

