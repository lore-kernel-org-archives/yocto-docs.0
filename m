Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C33EC83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 09:33:43 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.11462.1752053622929427158
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jul 2025 02:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FYeEPJ2k;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2DD6A43ACE;
	Wed,  9 Jul 2025 09:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752053621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lg5DDbC3O2AGo3NDU1MHyb3UR4VOztORWxRzfUquHWA=;
	b=FYeEPJ2ka6n6irGd7w0NWUJPBimYscX9DoTAo2KcV5cDAW+uUdOdyxBD4dDyTY7io/5qGd
	SC3WRvvfV1YObj6/C1U10PEXj7rNVQHhGp0EeaKIW4kPId7TS+tixFVE/7m7fkfjUCY4xb
	MVUIQ9OB0R9zXfuWT2mj0G9XcSpWgp5J+PEhyXUh0Y2aQT0qWpoL7ZgpeIMOfRsCcC0CH0
	jq6IvfrpEQyV7BJhEE2YfpAWdSHHhxaEzNF5taeq+hQPYTNDd6jDN9DqGpAqnDfw/LOepI
	g8nEoyhMaeeEAYlvqSqm6UhSnpRIstyIxnZS09w7ANBqR61MragjvMYgrND+ig==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Jul 2025 11:33:31 +0200
Subject: [PATCH v4 1/2] Add a document on limiting host resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-resource-limiting-v4-1-c35cbc4c7d14@bootlin.com>
References: <20250709-resource-limiting-v4-0-c35cbc4c7d14@bootlin.com>
In-Reply-To: <20250709-resource-limiting-v4-0-c35cbc4c7d14@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7498;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ZMe+5CwDJWBjeTdVKhF2e0ku+3O9mjwAxKJ0Yql90Nc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBobjd01rJ+q0ByMUxWouHck1rMdgb3oUAoTGMwD
 Zv3R+eT7vGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaG43dAAKCRDRgEFAKaOo
 NsKIEACwALrl5hDEPRqGnaZP3OKiaGeNzIIPV7soHm/ocaWvTnDBEvMKH9u2rUj2TE88lrMFuDa
 nGwcUo8qQO/WqTWiIAW3n6+5y3x+aBJReUzvT/nEze2CtigsEceSf1+ksIgcESHm9cfJAfFb6a8
 AZi2F5KRIUVhnyYLXQhsz4J8O/Qq4mVzT3a6WrHQT5sNYdUpI3xpKqAwYJCdBO7fVFwXg9klhg0
 utZDnIFk/0AVLbxmb/SDqj4nGntcwNMdkz17gvqvsQpNFTOrk3cTMcXSqWU2ormdz0bWhAF50y3
 2P8ocC9yyoelEW+acBfFryqtXZjbsUFu5CS8VAdH2gk0Z29HxJ2G962BYjFfus6/JUrcOHsTy6h
 sjzgbNGKFKDkHLdkW6J37jZwk3duzue4Tu2lre3sof3oBlLGs4V/c1SXF3nqD8jL7mJvSL6LPev
 kEx0rSnt8oVryEvn1CnBWhI2B54rZyEW4T1Z2vavXbybLvUbeAP3FU+hzeYT1LAW1YQCaSytX/M
 vi9hqvwYaMK7OfqXHUrNa08Xpc4YUPFOooctqTAMWQ7ATfAHcYHHbFa/KSHPfHGSxPrnq5R4NY1
 Z8xABRi+juu8ZBuzfyNFgbhk39G2ExSRZhhqdsCOeNpgiQPia/NX98u4l3vEL9epReRq07TBnTz
 m+rpWVuBZDjWCVA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjedvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieegteelheekgeeghfeivdevteefteejvdelvdffleegheegleelhfeiuddtfedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguo
 hgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Jul 2025 09:33:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7289

Add a "Limiting the Host Resources Usage" document to share the
different techniques that can be used to limit the host resources usage.
We do have a document to document how to speed up a build, so this
document comes right after.

[YOCTO #15111]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/index.rst              |   1 +
 documentation/dev-manual/limiting-resources.rst | 138 ++++++++++++++++++++++++
 2 files changed, 139 insertions(+)

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
index 000000000..0a792689c
--- /dev/null
+++ b/documentation/dev-manual/limiting-resources.rst
@@ -0,0 +1,138 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+Limiting the Host Resources Usage
+*********************************
+
+While you sometimes need to :doc:`speed up a build
+</dev-manual/speeding-up-build>`, you may also need to limit the resources used
+by the :term:`OpenEmbedded Build System`, especially on shared infrastructures
+where multiple users start heavy-load builds, or when building on low-power
+machines.
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
+   Like :term:`BB_NUMBER_THREADS`, but this variable sets a limit on the number
+   of threads during the parsing of the environment (before executing tasks).
+
+-  :term:`PARALLEL_MAKE`:
+
+   This variable should be set in the form of ``-jN``, where ``N`` is a positive
+   integer. This integer controls the number of threads used when starting
+   ``make``. Note that this variable is not limited to the usage of ``make``,
+   but extends to the compilation (:ref:`ref-tasks-compile` task) commands
+   defined by the :ref:`ref-classes-meson`, :ref:`ref-classes-cmake` and such
+   classes.
+
+   If you want to have a different limit from the rest of the build for a
+   recipe, it is also possible to achieve with the following line added to your
+   ``local.conf`` :term:`configuration file`::
+
+      PARALLEL_MAKE:pn-linux-yocto = "-j4"
+
+   The above example will limit the number of threads used by ``make`` for the
+   ``linux-yocto`` recipe to 4.
+
+-  :term:`PARALLEL_MAKEINST`:
+
+   Like :term:`PARALLEL_MAKE`, but this variable controls the number of threads
+   used during the :ref:`ref-tasks-install` task.
+
+   The default value of :term:`PARALLEL_MAKEINST` is the value of
+   :term:`PARALLEL_MAKE`.
+
+.. note::
+
+   While most of the variables in this document help to limit the CPU load, it
+   is also possible that the host system runs out of physical RAM when running
+   builds. This can trigger the out-of-memory killer and stop the related
+   processes abruptly. This can create strange looking failures in the output
+   log of the tasks in question. The out-of-memory killer only logs in the
+   kernel dmesg logs, so it is advised to monitor it closely with the ``dmesg``
+   command when encountering unexpected failures during builds.
+
+   In these situations, lowering the value of :term:`PARALLEL_MAKE` and
+   :term:`BB_NUMBER_THREADS` is recommended.
+
+-  :term:`BB_PRESSURE_MAX_CPU`, :term:`BB_PRESSURE_MAX_IO` and
+   :term:`BB_PRESSURE_MAX_MEMORY`:
+
+   These variables control the limit of pressure (PSI as defined by
+   https://docs.kernel.org/accounting/psi.html) on the system, and will
+   limit the number of :term:`BitBake` threads dynamically depending on the
+   current pressure of the system. This also means that your host must support
+   the PSI kernel feature (otherwise see :term:`BB_LOADFACTOR_MAX` below).
+
+   These variables take a positive integer between 1 (extremely low limit) and
+   1000000 (value unlikely ever reached). Setting an extremely low value, such
+   as 2, is not desirable as it will result in :term:`BitBake` limiting the
+   number of threads to 1 most of the time.
+
+   To determine a reasonable value to set for your host, follow the steps below:
+
+   #. In a Bash shell, start the following script, which will provide an
+      estimate of the current pressure on your host:
+
+      .. code-block:: bash
+
+         pressure="0"
+         while true; do
+            prev_pressure="$pressure"
+            pressure=$(head -1 /proc/pressure/cpu  | cut -d' ' -f5 | cut -d'=' -f2)
+            echo $(( $pressure - $prev_pressure ))
+            sleep 1
+         done
+
+      .. note::
+
+         Change ``/proc/pressure/cpu`` to ``/proc/pressure/io`` or
+         ``/proc/pressure/memory`` to change the pressure type to monitor.
+
+      This script can be stopped by pressing Control + C.
+
+   #.  Then, start a heavy-load build, for example::
+
+          bitbake virtual/kernel -c compile -f
+
+       You can stop the build at anytime with Control + C.
+
+   #.  Monitor the values printed on the console. These should indicate how the
+       pressure evolves during the build. You can take a value below the maximum
+       printed value as a starting point.
+
+   After setting initial values, :term:`BitBake` will print messages on the
+   console in the following format each time the current pressure exceeds of the
+   limit set by the above variables::
+
+      Pressure status changed to CPU: True, IO: False, Mem: False (CPU: 1105.9/2.0, IO: 0.0/2.0, Mem: 0.0/2.0) - using 1/64 bitbake threads
+
+   Take a look at the value between parenthesis: ``CPU: 1105.9/2.0, IO: 0.0/2.0,
+   Mem: 0.0/2.0``. They correspond to the current pressure value for the CPU, IO
+   and memory respectively. If :term:`BitBake` prints these messages a lot, it
+   is likely that your pressure limit is too low, and thus can be raised to a
+   higher value.
+
+-  :term:`BB_LOADFACTOR_MAX`:
+
+   This variable will limit the number of threads :term:`BitBake` will start
+   by monitoring the current CPU load of the host system. :term:`BitBake` will
+   print the following when the limit set by :term:`BB_LOADFACTOR_MAX` is
+   reached::
+
+      Load average limiting set to True as load average: 0.7188262939453125 - using 37/64 bitbake threads
+
+   This variable has no effect when any of :term:`BB_PRESSURE_MAX_CPU`,
+   :term:`BB_PRESSURE_MAX_IO` or :term:`BB_PRESSURE_MAX_MEMORY` is set, as it
+   was designed for systems that do not have pressure information available.

-- 
2.50.0


