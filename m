Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C9CC87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 13:04:20 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.61404.1753967052947940530
 for <docs@lists.yoctoproject.org>;
 Thu, 31 Jul 2025 06:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E0Qg49gA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED93F439EC;
	Thu, 31 Jul 2025 13:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753967050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ToDy5bIhUIbEqktO8nnML+xzs2cE1elsSH0CBMXi6WU=;
	b=E0Qg49gAoawHabl0yVO/AcjwfFMnekZKUODsP4lO8iTNk8OAsEQcpRims/xr2LLnmPjqnI
	MzgEp7zAnRMjozi8HgfnjFM6YBgkUxmElXSzTFDu71ZmNlqQuZcVFAA2CjPv8HPdeAcmF/
	tBsywVRsD5izm2AoxAS6QqjOX9WSaRMc50Yq+2YTnjDIyOZo3nzQgNFnh+J85mhlnxho4/
	YgA0ssNGFdOF6UgnbsIjEVP/8pwtD9MHl6K5j0KuIKU0j60TITBfLXQuH7Tt6ddfj3SFT6
	1FLJPridoNVZCU7k7quwQefn2yxIE7xb+1CpxmcfcUPoBMYqlzALH6E/VwG/Bg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 31 Jul 2025 15:03:56 +0200
Subject: [PATCH] dev-manual: add a hash equivalence server setup document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-hashserver-v1-1-90c541b643c5@bootlin.com>
X-B4-Tracking: v=1; b=H4sIALtpi2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc2ND3YzE4gygnrLUIt1kk5REk+TUpDSztDQloIaCotS0zAqwYdGxtbU
 AZWPiNFwAAAA=
X-Change-ID: 20250731-hashserver-c4da4cebf6ff
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8398;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=UHvTH5BlmKW8G9ylPzxohR+WNCGpzByLJ0769g5uLCE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoi2nJCk2V182PyRjfbJJ+Vrh22k+jbccZ51v0R
 DzlmoQJps6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaItpyQAKCRDRgEFAKaOo
 No0+D/9QnXAMikjzq7oX4P4BRezN/uyeVSPKFTQStB7qgVbiLH2NMGYXvgOQm+Ixmu1RzAGXzUl
 ScINnG2FxuBJGaWfBvYPPg9TQRWEQkNX1ePNs+skml3TX/1Nn7A3opC+OfPXWBTM7evcKWRnFEx
 GGZXXRJl2Fm6vvEau+3ZuiebA74YR3mRbCSHZZAwt/te4nPIIgTIiYx8EGStpp8vh/tDK7CY4qx
 I8kvQEdGn49iRMeagJ/0FNPai81wO+F6M8kvO7qFSJ+e9ysyleFbL9eEYoRzjNV+ba+2VhQrXah
 nL8Cep5NDc5SV+X3c7ecJ0UfzBsCNs9p5KBH+gdo+ZuKOp8UlhI262W/28ERMbQpAxJShYhAdnx
 4BdfVjL4G3RhWrqhke5RxeCxON/uZFKqlfpyHcoFojuXocgSBUHp5SIMs/5kPIMMR2q31jAIDBq
 umhiq/4RN8nXOxZTVrhmXVepAPOYcOsCJ9FCAuTnzP34c8PtY2q198LWD4GLd14ZR9oBMHeofN2
 9fXn6R3ETK1YvYunnWhLKhhdQEUq7Ayd8sCb6VDbpbDe2W5lY5i/bDDZ/pJdqBR7D8YzaxeC1D3
 tmKzB2gy5UfMOebwfZEn5eTDG5t8mQHDZbqMIykE2go2bXrlFYsCPtHr02I3Ch2I0rz1Ussh1t7
 0I5VOSr4VBxEsEA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutddtkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevledvgfdukeetudetgeejgefgtddufffhvdevuddukeethfduteefudehgefhteenucffohhmrghinhepshhotghkrdihohhupdihohgtthhophhrohhjvggtthdrohhrghdphihouhhtuhgsvgdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpv
 ghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 31 Jul 2025 13:04:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7419

Add a small document to describe how to start a Hash Equivalence server
with bitbake-hashserv, the reference server provided by BitBake.

Update reference to hash equivalence in other places in the
documentation to mention this document.

Move the note from the concepts document to the new document, as a
warning note.

[YOCTO #15921]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/hashequivserver.rst | 129 +++++++++++++++++++++++++++
 documentation/dev-manual/index.rst           |   1 +
 documentation/dev-manual/start.rst           |   4 +
 documentation/overview-manual/concepts.rst   |  16 +---
 4 files changed, 137 insertions(+), 13 deletions(-)

diff --git a/documentation/dev-manual/hashequivserver.rst b/documentation/dev-manual/hashequivserver.rst
new file mode 100644
index 000000000..c866f5001
--- /dev/null
+++ b/documentation/dev-manual/hashequivserver.rst
@@ -0,0 +1,129 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Setting up a Hash Equivalence Server
+************************************
+
+A :ref:`overview-manual/concepts:Hash Equivalence` server can help reduce build
+times by using the mechanism described in the :ref:`overview-manual/concepts:Hash Equivalence`
+section of the Yocto Project Overview and Concepts Manual.
+
+This document will guide you through the steps required to set up the reference
+Hash Equivalence server provided by the :oe_git:`bitbake-hashserv
+</bitbake/tree/bin/bitbake-hashserv>` script in :term:`BitBake`.
+
+This guide will explain how to setup a local Hash Equivalence server and does
+not explain how to setup the surrounding infrastructure to secure this server.
+
+Hash Equivalence Server Setup
+=============================
+
+From this point onwards, the commands displayed below are assumed to be run from
+the :term:`BitBake` repository, which can be found :oe_git:`here </bitbake>`.
+
+To start a basic Hash Equivalence server, one could simply run::
+
+   ./bin/bitbake-hashserv
+
+This will take all of the default options of the script, which are already
+sufficient to start a local server.
+
+Run ``./bin/bitbake-hashserv --help`` to see what options the script can take.
+Some of the important ones are:
+
+-  ``--database`` controls the location of the hash server database (default:
+   ``./hashserver.db``).
+
+-  ``--bind`` controls the bind address of the server (default:
+   ``unix://./hashserver.sock``).
+
+   You can specify three types of addresses:
+
+   -  ``unix://PATH``: will bind to a Unix socket at ``PATH``.
+
+   -  ``wss://ADDRESS:PORT``: will bind to a Websocket at ``ADDRESS:PORT``.
+
+   -  ``ADDRESS:PORT``: will bind to a raw TCP socket at ``ADDRESS:PORT``.
+
+-  ``--log`` can be used to control the logging level of the server (e.g.
+   ``INFO`` will print information about clients connection to the server).
+
+-  ``--upstream`` can be used to specify an upstream server to pull hashes from.
+   This has no default value, meaning no upstream server is used.
+
+-  ``--db-username`` and ``--db-password`` can be used to control the access to
+   the database.
+
+-  ``--read-only`` will disable hash reports from clients.
+
+These variables can also be set from the environment from where it is being run.
+Run ``./bin/bitbake-hashserv --help`` to get the variable names that you can
+export.
+
+.. warning::
+
+   The shared Hash Equivalence server needs to be maintained together with the
+   :ref:`Shared State <overview-manual/concepts:Shared State>` cache. Otherwise,
+   the server could report Shared State hashes that only exist on specific
+   clients.
+
+   We therefore recommend that one Hash Equivalence server be set up to
+   correspond with a given Shared State cache, and to start this server
+   in *read-only mode* (``--read-only`` option), so that it doesn't store
+   equivalences for Shared State caches that are local to clients.
+
+   If there is no pre-existing Shared State Cache, the server should allow
+   hashes to be reported (no ``--read-only`` option) to create the initial
+   Hash Equivalence database.
+
+Yocto Project Build Setup
+=========================
+
+To use the server started in the previous section, set the following variables
+in a :term:`configuration file`::
+
+   BB_HASHSERVE = "<bind address>"
+   BB_SIGNATURE_HANDLER = "OEEquivHash"
+
+The ``<bind address>`` value should be replaced to point to the server started
+in the previous section.
+
+See the documentation of :term:`BB_SIGNATURE_HANDLER` for more details on this
+variable.
+
+You can optionally specify an upstream server with :term:`BB_HASHSERVE_UPSTREAM`
+variable. For example::
+
+   BB_HASHSERVE_UPSTREAM = "wss://hashserv.yoctoproject.org/ws"
+
+This will make the local server pull hashes from the upstream server. The
+:term:`BB_HASHSERVE_UPSTREAM` only works when a server is running
+(:term:`BB_HASHSERVE` is set).
+
+To output debugging information on what is happening with Hash Equivalence when
+builds are started, you can configure :term:`BitBake` logging as follows from a
+:term:`configuration file`::
+
+   BB_LOGCONFIG = "hashequiv.json"
+
+With ``hashequiv.json`` containing the following content:
+
+.. code-block:: json
+
+   {
+      "version": 1,
+      "loggers": {
+         "BitBake.SigGen.HashEquiv": {
+            "level": "VERBOSE",
+            "handlers": ["BitBake.verbconsole"]
+         },
+         "BitBake.RunQueue.HashEquiv": {
+            "level": "VERBOSE",
+            "handlers": ["BitBake.verbconsole"]
+         }
+      }
+   }
+
+This will make Hash Equivalence related changes be printed on the console, such
+as::
+
+   NOTE: Task <recipe.bb>:do_<task> unihash changed to dc0da29c62a2d78d8d853fbb9c173778fe7d6fa4a68c67494b17afffe8ca1894
diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manual/index.rst
index 4abfa59e9..ea528855a 100644
--- a/documentation/dev-manual/index.rst
+++ b/documentation/dev-manual/index.rst
@@ -51,5 +51,6 @@ Yocto Project Development Tasks Manual
    wayland
    qemu
    bblock
+   hashequivserver
 
 .. include:: /boilerplate.rst
diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
index e10367752..6f797c003 100644
--- a/documentation/dev-manual/start.rst
+++ b/documentation/dev-manual/start.rst
@@ -239,6 +239,10 @@ particular working environment and set of practices.
        Yocto Project Overview and Concepts Manual for more details on the hash
        equivalence feature.
 
+       See the :doc:`/dev-manual/hashequivserver` section of the Yocto Project
+       Development Tasks Manual for details on how to setup a
+       :ref:`overview-manual/concepts:Hash Equivalence` server.
+
     -  Set up an Autobuilder and have it populate the sstate cache and
        source directories.
 
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index e8569e4f5..397a8b84d 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -2064,19 +2064,9 @@ on a Hash Equivalence server on a network, by setting::
 
    BB_HASHSERVE = "<HOSTNAME>:<PORT>"
 
-.. note::
-
-   The shared Hash Equivalence server needs to be maintained together with the
-   Shared State cache. Otherwise, the server could report Shared State hashes
-   that only exist on specific clients.
-
-   We therefore recommend that one Hash Equivalence server be set up to
-   correspond with a given Shared State cache, and to start this server
-   in *read-only mode*, so that it doesn't store equivalences for
-   Shared State caches that are local to clients.
-
-   See the :term:`BB_HASHSERVE` reference for details about starting
-   a Hash Equivalence server.
+Setting up a Hash Equivalence server is described in the
+:doc:`/dev-manual/hashequivserver` section of the Yocto Project Development
+Tasks Manual.
 
 See the `video <https://www.youtube.com/watch?v=zXEdqGS62Wc>`__
 of Joshua Watt's `Hash Equivalence and Reproducible Builds

---
base-commit: f9f1c87424d307d2df60024bc448bd6778605cf8
change-id: 20250731-hashserver-c4da4cebf6ff

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


