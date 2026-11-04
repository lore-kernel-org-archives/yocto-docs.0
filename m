Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9965.1793801840115112300
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Nov 2026 06:17:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=D3l2UQjS;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DF0F9C8F475;
	Wed,  4 Nov 2026 14:18:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DF45E60770;
	Wed,  4 Nov 2026 14:17:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 656ED103291F6;
	Wed,  4 Nov 2026 15:17:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793801833; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CA5IpCi5xxUfaIoyA5p5zsXpclIBGxcPNa23uG/Hd+M=;
	b=D3l2UQjS542/dV6r+9tX9fMLgSz7lyI0IpUyAMLKW27dSLBFTDmz0O0HDkulL7GQkfZZqf
	37mfAdFmbl0bh7tfC+vdadQqsON8By7Btj5A5nVs7bj8bEqQ1zhFQ1Iwb+ml287/lIERZa
	mxSg1lH+PbH2tms8BydpZIDwhW/fF76mwQBYbA8BbcbpnOcQTTnMCg1UHRRYfgk0RAX8pi
	LSvHoFkOnXMTiBLvPzl+tXj5C3R7nxhsLaLYwl+WdqO+GLNQf+ytmBGZRx88uZFCL5tQAf
	acg9nCgeRITl7vi2hvKNnjVwhoeF/nLB5tZC/7n0i5cKFku9G5S9MkSl/Qxw0A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 15:17:10 +0100
Message-Id: <DMMHOGIG8FZ2.3EGLH78Y5XISP@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] contributor-guide: Adopt new AI-Assisted
 Contribution Policy
Cc: <yocto@lists.yoctoproject.org>,
 <openembedded-architecture@lists.openembedded.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20261102-ai-policy-v1-1-db2e89267a1e@pbarker.dev>
In-Reply-To: <20261102-ai-policy-v1-1-db2e89267a1e@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Wed, 04 Nov 2026 14:17:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10770

Hi,

Thanks, will merge to master-next with the following formatting fixes:

diff --git a/documentation/contributor-guide/ai-assisted-contribution-polic=
y.rst b/documentation/contributor-guide/ai-assisted-contribution-policy.rst
index 7b8ee8284..f35b58fdf 100644
--- a/documentation/contributor-guide/ai-assisted-contribution-policy.rst
+++ b/documentation/contributor-guide/ai-assisted-contribution-policy.rst
@@ -11,15 +11,15 @@ include non-trivial AI-generated content.
=20
 A *contribution* is anything you send to the project, including:
=20
-- Patches, commit messages and cover letters
+-  Patches, commit messages and cover letters
=20
-- Review comments, discussions and other mailing list submissions
+-  Review comments, discussions and other mailing list submissions
=20
-- Bug reports and comments in Bugzilla
+-  Bug reports and comments in Bugzilla
=20
-- Security reports sent to the Security Team
+-  Security reports sent to the Security Team
=20
-- Wiki content
+-  Wiki content
=20
 *AI-generated content* is anything produced by a Large Language Model
 (LLM) or other generative AI technology, including output from AI
@@ -49,17 +49,17 @@ General conditions
=20
     1. Contributors should ensure that the terms and conditions of the
        generative AI tool do not place any contractual restrictions on how
-       the tool=E2=80=99s output can be used that are inconsistent with th=
e
-       project=E2=80=99s open source software license, the project=E2=80=
=99s intellectual
+       the tool's output can be used that are inconsistent with the
+       project's open source software license, the project's intellectual
        property policies, or the Open Source Definition.
=20
     2. If any pre-existing copyrighted materials (including pre-existing
        open source code) authored or owned by third parties are included i=
n
-       the AI tool=E2=80=99s output, prior to contributing such output to =
the
+       the AI tool's output, prior to contributing such output to the
        project, the Contributor should confirm that they have have
-       permission from the third party owners=E2=80=93such as the form of =
an open
+       permission from the third party owners-such as the form of an open
        source license or public domain declaration that complies with the
-       project=E2=80=99s licensing policies=E2=80=93to use and modify such=
 pre-existing
+       project's licensing policies-to use and modify such pre-existing
        materials and contribute them to the project. Additionally, the
        contributor should provide notice and attribution of such third par=
ty
        rights, along with information about the applicable license terms,
@@ -77,7 +77,7 @@ The Yocto Project is a collaborative endeavour and our co=
mmunity is as
 valuable as our code base for the long-term health of the project. At a
 fundamental level, we each need to take responsibility for what we
 contribute to the project. For example, this includes ensuring that our
-contributions follow the project=E2=80=99s Code of Conduct. It also includ=
es
+contributions follow the project's Code of Conduct. It also includes
 being respectful of the finite bandwidth that we all have for reading,
 reviewing and responding to contributions.
=20
@@ -122,7 +122,7 @@ Transparency
 **Contributors need to disclose where they have used AI-generated output
 in their submissions to the project**. As stated above, incidental or
 trivial use of AI-generated output within an otherwise human authored
-submission doesn=E2=80=99t require disclosure - but if in doubt, err on th=
e side
+submission doesn't require disclosure - but if in doubt, err on the side
 of disclosing the use of AI tools.
=20
 The use of generative AI and LLMs in software development is a rapidly
@@ -139,7 +139,7 @@ In patches and commits
 ----------------------
=20
 **Where AI-generated code is contributed to the project, commit messages
-must include the ``AI-Generated`` tag identifying the AI tool or
+must include the** ``AI-Generated`` **tag identifying the AI tool or
 framework and the specific AI model used**. We encourage contributors to
 be as specific as they can be. For example::
=20
@@ -193,7 +193,7 @@ Enforcement
=20
 Violations of this policy may result in contributions being rejected or
 deleted as appropriate. Repeated violations will be dealt with through
-the project=E2=80=99s `Code of Conduct`_ policy.
+the project's `Code of Conduct`_ policy.
=20
 .. _Linux Foundation Generative AI Policy: https://www.linuxfoundation.org=
/legal/generative-ai
 .. _Code of Conduct: https://www.yoctoproject.org/code-of-conduct

Antonin
