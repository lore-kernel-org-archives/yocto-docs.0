Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9073.1793799008274049849
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Nov 2026 05:30:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZFX/Afhp;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 155874E413FD
	for <docs@lists.yoctoproject.org>; Wed,  4 Nov 2026 13:30:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE55360770;
	Wed,  4 Nov 2026 13:30:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C5A0103291AD;
	Wed,  4 Nov 2026 14:30:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793799005; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HkhGY3bjOWK0V9N1BZZPcXsa1aanPvmOxlar7Iq+bXk=;
	b=ZFX/Afhprja27QCsfM/q6HK+9TcR59fWsXltmCI43exnEzlA6Q63Z8wL9pZoKIZk26Jko9
	+Aec35N3Tf4ThX8JFh+I2iQ8soTXkctLBCX2Jq5V6CtIcW4SMoZQogm6uM7KBBu5zhcHKe
	a25GthQ3KGuXMxggHi0Ulqw6bO+leHQ46Mi2AHJWvyYD3E+j3q/SZJlvUV1A9rpOp1w/46
	1ytbHLUcHzSSCkDJDy75xEZr7Pd4X+pVENevGs3CTel8bD/4VO5/LwRYZ8tpB5lxJs9rpV
	JaqnFE1YrAC5jmblXdtqNrh87JzbCpjOdLuClplqsoeIKMi7GhKHNUSbGYyxrg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 14:30:03 +0100
Message-Id: <DMMGODYYKIMC.3BQCIELWD0FVP@bootlin.com>
Subject: Re: [docs] [PATCH v2] governance: Add start of project history and
 leadership sections
Cc: "Richard Purdie via lists.yoctoproject.org"
 <richard.purdie=linuxfoundation.org@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <richard.purdie@linuxfoundation.org>, <docs@lists.yoctoproject.org>
References: <20261102141947.594561-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20261102141947.594561-1-richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 04 Nov 2026 13:30:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10769

Hi,

Thanks, the added dates do help realizing when things happen. I'll merge it=
 to
master-next with the following formatting changes:

diff --git a/documentation/governance/history.rst b/documentation/governanc=
e/history.rst
index fa26b9f8c..6c6096c1f 100644
--- a/documentation/governance/history.rst
+++ b/documentation/governance/history.rst
@@ -168,20 +168,20 @@ OpenEmbedded. There were often changes talked about a=
t many of the OE
 developer meetings (OEDEMs) but where the developers had not been able to
 find time/resources to make them happen.
=20
-- ``fakeroot`` was swapped for ``pseudo``, donated from Wind River
+-  ``fakeroot`` was swapped for ``pseudo``, donated from Wind River
=20
-- The concept of `sstate` was developed (August 2010) meaning incremental
-  builds became possible and output could be removed from the build direct=
ory
-  structures.Initial versions of this were known as "packaged staging" as
-  initially package manager involvement was assumed but this was eventuall=
y
-  discounted.
+-  The concept of `sstate` was developed (August 2010) meaning incremental
+   builds became possible and output could be removed from the build direc=
tory
+   structures. Initial versions of this were known as "packaged staging" a=
s
+   initially package manager involvement was assumed but this was eventual=
ly
+   discounted.
=20
-- The separate staging and target installs were combined.
+-  The separate staging and target installs were combined.
=20
-- Automated testing was developed based on buildbot (python based to match
-  the core developers skillset) creating the "Autobuilder" project.
+-  Automated testing was developed based on Buildbot (python based to matc=
h
+   the core developers skillset) creating the "Autobuilder" project.
=20
-- Support for RPM packages were added (2008-2010) with a switch to RPM v5.
+-  Support for RPM packages were added (2008-2010) with a switch to RPM v5=
.
=20
 Most of the project's budget focused either around Autobuilder /
 infrastructure costs (including a full time sysadmin) or on advocacy and
@@ -279,16 +279,16 @@ to focus on this was formed with the aim of writing a=
 new participation
 agreement for members. There were multiple things people wanted to achieve
 including:
=20
-- Officially recognise the special relationship with OpenEmbedded.
+-  Officially recognise the special relationship with OpenEmbedded.
=20
-- Have oversight of Richard Purdie's decision making.
+-  Have oversight of Richard Purdie's decision making.
=20
-- Creation of a Yocto Project TSC to make technical Yocto Project decision=
s.
+-  Creation of a Yocto Project TSC to make technical Yocto Project decisio=
ns.
=20
-- Formalise the project member benefits.
+-  Formalise the project member benefits.
=20
-- Align the project with known Linux Foundation best practise governance a=
nd
-  charter documents.
+-  Align the project with known Linux Foundation best practise governance =
and
+   charter documents.
=20
 These changes included the formation of the Yocto Project TSC which first
 met in June 2019. The TSC became necessary since the project was now

Antonin
