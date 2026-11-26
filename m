Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13500.1795698806014533413
 for <docs@lists.yoctoproject.org>;
 Thu, 26 Nov 2026 05:13:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=LQmAzGTT;
 spf=pass (domain: geanix.com, ip: 79.135.106.113, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1795698803; x=1795958003;
	bh=SZ52dF0mJfAZTY7kfsoSuTfh78ohYkVG//r8v3HROBM=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=LQmAzGTTvGg8Y5UB/asjx/QJM/izfH5d6Dfu7+VU0T1QmslJTYxZY0Bd2446ZjEnX
	 48U2QTiVFUQ4BOeQRSfNyeWmydXMs2RGp2uRrS0yZnGsW83drBgMPaqUb67qdRnyVa
	 DGsjP+EA84nMpodktHbRyM+h3qnCwVjKjT+ydJknId8USxN7qASCstaByHmDxzcsLx
	 RMNN37qP5Ix7tP8XumdaSFCcUhrH0pfDL983IShrlyre3oMJQgdCJN1ZMI5ydrEBiH
	 pMr91WMki+hiPDCOlOuBeXU6Subg1Z9IiYUMrLh9MJtZ5FQGwdHQSvb4DBKS5IRu3+
	 7UT6VlWYFzNAw==
X-Pm-Submission-Id: 4jZxnF41Pqz1DF5G
From: Sean Nyekjaer <sean@geanix.com>
To: docs@lists.yoctoproject.org
Cc: alex.kanavin@gmail.com,
	joerg.vehlow@emlix.com,
	peter.kjellerstedt@axis.com,
	Sean Nyekjaer <sean@geanix.com>
Subject: [PATCH] ref-manual/variables.rst: INCOMPATIBLE_LICENSE: document SDK check opt-out
Date: Thu, 26 Nov 2026 14:13:09 +0100
Message-ID: <20261126131309.2581142-1-sean@geanix.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Thu, 26 Nov 2026 13:13:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10843

Since f757ae4dadab ("license_image: extend to SDK coverage"),
do_populate_sdk checks the SDK host and target sysroots against
INCOMPATIBLE_LICENSE. Document how to disable this when the restrictions
only apply to the image, as suggested on the list.

Suggested-by: J=C3=B6rg Vehlow <joerg.vehlow@emlix.com>
AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 documentation/ref-manual/variables.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 2e01d0422..72ac158a6 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4825,6 +4825,18 @@ system and gives an overview of their function and=
 contents.
       are no build time restrictions, but the license check is still
       performed when the image's filesystem is assembled from packages.
=20
+      The license check is also performed by the
+      :ref:`ref-tasks-populate_sdk` task, for both the host (e.g.
+      ``nativesdk-*`` and ``*-cross-canadian-*`` packages) and target
+      sysroots of the SDK. If the restrictions are only meant to apply t=
o the
+      image and not to its SDK, the check can be disabled for the
+      :ref:`ref-tasks-populate_sdk` task with::
+
+         INCOMPATIBLE_LICENSE:task-populate-sdk =3D ""
+
+      Alternatively, individual packages can be allowed in the SDK with
+      :term:`INCOMPATIBLE_LICENSE_EXCEPTIONS`.
+
       There is some support for wildcards in this variable's value,
       however it is restricted to specific licenses. Currently only
       these wildcards are allowed and expand as follows:
--=20
2.56.0

