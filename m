Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FCEC77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 14:42:27 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.90.1750776145012698217
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Jun 2025 07:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SXltR73O;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D9434395D;
	Tue, 24 Jun 2025 14:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750776143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NyFVn4G4vg/hmJzQyFsa319PkQ3JKkofCtUB0GTwX6o=;
	b=SXltR73OY2dEeDo3ky3fKhZAzSMEjCwQfSx9y4OEWzQaNLM0W9cZEdF8wKOhGtYey1FVEL
	b4DCzXLle3LAQqckeh9MWnGWgaMjCR55lpjTQYRQsIL68Uj6ElENfJ1wYcMXjXlrnANjyG
	zVRgluuxQzrUi1NgA5VdMLl1pMuCDHaDx9q9by5IC3brqIa8LmrXOJUXhsdGeRSpbDTMAn
	uSNbM7MJuIxdpbQFWTH5tSrtOchqb8nvJBWpgtIEfIoVPAEqF56UgvJkpRJGNVpWZ64gku
	DNuJLQqOZ0VrSX5JlCgwAxsCOrFTjXwPkRX6EpDJFH15aYwvvW3fUx8eGn8jzw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 24 Jun 2025 16:42:15 +0200
Subject: [PATCH] Add a document on limiting host resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-resource-limiting-v1-1-f8f5edbdaf03@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAEa5WmgC/x3MQQqAIBBA0avIrBNUDKmrRAupsQbKYqYiiO6et
 HyL/x8QZEKBVj3AeJHQlgtspWCYY55Q01gMzrjaeBs0o2wnD6gXWumgPGnrEobgYmqMh9LtjIn
 u/9n17/sBGlP9MWMAAAA=
X-Change-ID: 20250417-resource-limiting-12fe772af904
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5527;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=1S2St/+5WDqEQqr+JA15l631DAHFyj+KjQ69qsdGSNM=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoWrlONWBfh8fvuJLBimKPawBsHM4wkraeGc+Gv
 M/fojkVuo2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaFq5TgAKCRDRgEFAKaOo
 NlZ6D/9amD8DivRMmqjcchFjF6gR6/JomYVqMXlx942R9bteES+I10+kDxCH7SSZV62lAat+g3Y
 O38YzTTO4OCnucmNF04jX8t/zX42ClfVLX/eu+sWpvDtMG2+tPbS73z93IwKfQGqkSUpu+fhLHA
 KgU9spEyN2a+D9+TrdGWvovqsXOxfi7Tcdl/J9eQwuH3HeSuLbSQgy0N27oWgqvx0AayHol906j
 IrQqATAl/PObom7YVFdCxarehdlLpYs6Oj2hw6pqv+5fQieMms79ndnuXmRsbvRpg2KtxCBdu44
 o8BaeGj01jpcemYFIoa5f1t8N0KT2CkfMro9j2MUu7aWz5G4dNipMI4ILt4KCmPxwkG9qiMN+Tq
 QPdnN5O0KzIXGxXekkzEE02MPwu4PH4amMqSoUkV1e9Hhf2AEWQQontp8dhmH3HRxpnGIpnBtUZ
 h+g0oTQ5VoQ9/uNRlqmz2tFYd9ddYZ3lDyvwQi4LDzf2bzLQVRmwPCBKLPTR7o2H3+My0VU09tB
 B4rt/O76JdkmLZnSN5vn6w9Kchzxg/3U45nduw+6YPdHKi1JirkgCMuoQVYyx5VKqKXj15YIgEa
 4PuE3wxYMcqVlLM/RuUXS0DC8MKuBLAnEFqhu2owaUtgpX1gYHak/KxsIlLiVl7RAYX85Mh1KgY
 rszvpd8j+EH+sXA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvtdduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdegteehlefgheegvddufeevheehveeijedvfeduvdefvdekueduuedvjeelteehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepr
 ghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Jun 2025 14:42:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7215

Add a "Limiting the Host Resources Usage" document to share the
different techniques that can be used to limit the host resources usage.
We do have a document to document how to speed up a build, so this
document comes right after.

[YOCTO #15111]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/index.rst              |  1 +
 documentation/dev-manual/limiting-resources.rst | 85 +++++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/documentation/dev-manual/index.rst b/documentation/dev-manual/index.rst
index 63736e0ab..4abfa59e9 100644
--- a/documentation/dev-manual/index.rst
+++ b/documentation/dev-manual/index.rst
@@ -22,6 +22,7 @@ Yocto Project Development Tasks Manual
    building
    multiconfig
    speeding-up-build
+   limiting-resources
    libraries
    prebuilt-libraries
    devtool
diff --git a/documentation/dev-manual/limiting-resources.rst b/documentation/dev-manual/limiting-resources.rst
new file mode 100644
index 000000000..df8208bdc
--- /dev/null
+++ b/documentation/dev-manual/limiting-resources.rst
@@ -0,0 +1,85 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Limiting the Host Resources Usage
+*********************************
+
+While you sometimes need to :doc:`speed up a build
+</dev-manual/speeding-up-build>`, you may also need to limit the resources used
+by the :term:`OpenEmbedded Build System`, especially on shared infrastructures
+where multiple users start heavy-load builds.
+
+This document aims at giving the different configuration variables available to
+limit the resources used by the build system. These variables should be set from
+a :term:`configuration file` and thus take effect over the entire build environment.
+For each variable, also see the variable description in the glossary for more
+details.
+
+-  :term:`BB_NUMBER_THREADS`:
+
+   This sets a hard limit on the number of threads :term:`BitBake` can run at the
+   same time. Lowering this value will set a limit to the number of
+   :term:`BitBake` threads, but will not prevent a single task from starting more
+   compilation threads (see :term:`PARALLEL_MAKE`).
+
+-  :term:`BB_NUMBER_PARSE_THREADS`:
+
+   Like :term:`BB_NUMBER_THREADS`, but this variable sets a limit to the number
+   of threads using during parsing of the environment (before executing tasks).
+
+-  :term:`PARALLEL_MAKE`:
+
+   This variable should be set in the form of ``-jN``, where ``N`` is a positive
+   integer. This integer controls the number of threads used when starting
+   ``make``. Note that this variable is not limited to the usage of ``make``,
+   but extends to the compilation commands defined by the
+   :ref:`ref-classes-meson`, :ref:`ref-classes-cmake` and such classes.
+
+   If you have identified a recipe that you want to limit separately from the
+   rest, it is also possible to achieve with the following syntax::
+
+      PARALLEL_MAKE:pn-linux-yocto = "-j4"
+
+   The above example will limit the number of threads using by ``make`` for the
+   ``linux-yocto`` recipe to 4.
+
+-  :term:`PARALLEL_MAKEINST`:
+
+   Like :term:`PARALLEL_MAKE`, but this variable controls the number of threads
+   used during the :ref:`ref-tasks-install` task.
+
+-  :term:`BB_PRESSURE_MAX_CPU`, :term:`BB_PRESSURE_MAX_IO` and
+   :term:`BB_PRESSURE_MAX_MEMORY`:
+
+   This variable controls the limit of pressure (as defined by
+   https://docs.kernel.org/accounting/psi.html) on the system, and will
+   limit the number of :term:`BitBake` threads dynamically depending on the
+   current pressure of the system.
+
+   These variable take a positive integer between 1 (extremely low limit) and
+   1000000 (value unlikely ever reached). Setting an extremely low value, such
+   as 2, is not desirable as it will result in :term:`BitBake` limiting the
+   number of threads to 1 most of the time.
+
+   However, having a low value at the beginning makes sense to get a sense of a
+   reasonable value to set for your system. Indeed, :term:`BitBake` will print
+   message on the console in the following format each time the current pressure
+   exceeds of the limit set by the above variables::
+
+      Pressure status changed to CPU: True, IO: False, Mem: False (CPU: 1105.9/2.0, IO: 0.0/2.0, Mem: 0.0/2.0) - using 1/64 bitbake threads
+
+   Take a look at the value between parenthesis: ``CPU: 1105.9/2.0, IO: 0.0/2.0,
+   Mem: 0.0/2.0``. They correspond to the current pressure value for the CPU, IO
+   and memory respectively. Monitoring these values during a build should tell
+   you what a reasonable value for your host system is.
+
+-  :term:`BB_LOADFACTOR_MAX`:
+
+   This variable will limit the number of threads :term:`BitBake` will start
+   by monitoring the current load of the host system. :term:`BitBake` will print
+   the following when the limit set by :term:`BB_LOADFACTOR_MAX` is reached::
+
+      Load average limiting set to True as load average: 0.7188262939453125 - using 37/64 bitbake threads
+
+   This variable has no effect when any of :term:`BB_PRESSURE_MAX_CPU`,
+   :term:`BB_PRESSURE_MAX_IO` or :term:`BB_PRESSURE_MAX_MEMORY` is set, as it
+   was designed for system that do not have pressure information available.

---
base-commit: 85e58c4fc5d1be9a2ea9ed6b813d0168e3162dab
change-id: 20250417-resource-limiting-12fe772af904

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


