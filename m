Return-Path: <dwagenknecht@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D7EC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:26:33 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [136.243.223.33])
 by mx.groups.io with SMTP id smtpd.web11.11786.1639668391075692275
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 07:26:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: emlix.com, ip: 136.243.223.33, mailfrom: dwagenknecht@emlix.com)
Received: from mailer.emlix.com (unknown [81.20.119.6])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 4FC0D5F8E8;
	Thu, 16 Dec 2021 16:26:27 +0100 (CET)
From: Daniel Wagenknecht <dwagenknecht@emlix.com>
To: bitbake-devel@lists.openembedded.org
Cc: Daniel Wagenknecht <dwagenknecht@emlix.com>,
	docs@lists.yoctoproject.org,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH] doc: document override style operators not working for task
 dependencies
Date: Thu, 16 Dec 2021 16:25:56 +0100
Message-Id: <20211216152555.815291-1-dwagenknecht@emlix.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Dec 2021 15:26:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2288

Override style operators do not work for specifying task dependencies.
This is not obvious and should be highlighted in the documentation.

Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
---

I have experienced this problem with external layers "in the wild" leadin=
g to
dependencies being undeclared and builds sometimes failing. Additional
documentation will not necessarily fix the problem, but might make it eas=
ier to
find the problem. I'm not sure if there's also some mechanism in bitbake =
that
could detect such mistakes and provide a warning?

CC: qschulz, we talked about this on IRC:
  https://www.yoctoproject.org/irc/%23yocto.2021-11-30.log.html#t2021-11-=
30T14:18:08

Sincerely
Daniel Wagenknecht

 .../bitbake-user-manual-metadata.rst          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst b/d=
oc/bitbake-user-manual/bitbake-user-manual-metadata.rst
index d802a8d3..181c0997 100644
--- a/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
+++ b/doc/bitbake-user-manual/bitbake-user-manual-metadata.rst
@@ -1689,6 +1689,14 @@ This section describes several ways to declare dep=
endencies. Remember,
 even though dependencies are declared in different ways, they are all
 simply dependencies between tasks.
=20
+.. note::
+
+   Override style operators do not work for declaring task dependencies.
+   See
+   :ref:`bitbake-user-manual/bitbake-user-manual-metadata:Inter-Task Dep=
endencies`
+   for details.
+
+
 .. _dependencies-internal-to-the-bb-file:
=20
 Dependencies Internal to the ``.bb`` File
@@ -1813,6 +1821,17 @@ must have completed before the ``do_patch`` task c=
an execute.
 The ``[rdepends]`` flag works in a similar way but takes targets in the
 runtime namespace instead of the build-time dependency namespace.
=20
+Note that dependencies are specified via
+:ref:`bitbake-user-manual/bitbake-user-manual-metadata:Variable Flag Syn=
tax`
+and thus override style operators do not work for declaring task
+dependencies. You can add a task dependency for a specific override
+(e.g. a specific machine) by declaring an intermediary variable and usin=
g
+overrides for setting that variable::
+
+   # Does not work: do_compile:machine[depends] +=3D "another_target:do_=
task"
+   EXTRA_DO_COMPILE_DEPENDS:machine =3D "another_target:do_task"
+   do_compile[depends] +=3D "${EXTRA_DO_COMPILE_DEPENDS}"
+
 Functions You Can Call From Within Python
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
--=20
2.33.1


