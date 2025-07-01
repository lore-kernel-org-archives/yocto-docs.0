Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 312C4C8302F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 11:40:33 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.8532.1751370027214475075
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 04:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XRKD4oKU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8801743B11;
	Tue,  1 Jul 2025 11:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751370025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zQH7R/WnTwxHfoRAy8uE3jG0e/zbzGmNIzdz0ncHyaY=;
	b=XRKD4oKUvF5S984dm/yGpnNLKhRPfgJPCCgITPUZu9uq3+pGDB8rbMRtRaLO0a1mMbfbGt
	9z1hhffW+XWuqGIERCfSTLslze4PbNnCzQX6LJb6RulDq9oARPEAQCmNc9lR/6POim6EXN
	YW/u1nY/10+Xrhjp21aHe/0szZjADBgbpO3nJO/+UsrdG1l2IX8jEGRV/4l2uqlRccn5nl
	8fT24J6YAVQceXX2/wkw3QxtSsPBRozf3jBJDDyIH9Qg3KZA1P02q+bSZRacCNHXMqYjsA
	tPshNYwT2BvSMrbIDYTR28CmtRdCe2OPyNi/Kgv9ywSh2XNGWJ7iDqqg1ErY0w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 01 Jul 2025 13:40:20 +0200
Subject: [PATCH v2 1/2] Add a document on limiting host resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-resource-limiting-v2-1-827077c4420d@bootlin.com>
References: <20250701-resource-limiting-v2-0-827077c4420d@bootlin.com>
In-Reply-To: <20250701-resource-limiting-v2-0-827077c4420d@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6758;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=TQ9Quzx/X5neaNwU4dUqD41LOcrQzbg5B4PSs6xfMRM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoY8koM0Jf8T+YA9oeICEnvigGXyjM1xeG4eTaC
 37one2zBvmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaGPJKAAKCRDRgEFAKaOo
 NiyzEACZZHU/wT8Qg5nwSQD7CDpnJ7W7Ij9G1b2HkY79TR4BCvl+7SQLjmA4G7IB6nsLxn4le9h
 CuU7Nr9irt46ELqPkheD5hZXB6PxF4mEXVQxRx0rIOPE+chEPxR2nRix41b3nLF+oD3/twExYXp
 IAuDVNrRj/wh13OghtzhA9Wi1azkQka8FhIx8qbgLhhYlFlB5+BmqEwhLLFvjii2iPI2ElRSIG4
 HZmCPZmbUtUmgtx0EZymOgjSoWp/E/WBuTTEusI+sk+MTx77IcAWnCLGC+vlp10WO+g7x/usyFM
 Wvy67iD7fMLYQhhvXKxEDLJVvsgT4a+c4MUtk+/JEjj35Ty1QHbt3iqpIiTjD5lHUl9fH7JOMbH
 HYqjjnLQ6DsdGQuD9alQNgizZ2xRyenAbAd37eLmcE7DBNHXpj9iqyBeyvSuvJ7s1QDawC2RpqW
 /ji4IcoUmoRBaq2MW9wB5Ja9rRzVxeBtlKeWHH7AWsu0Bye1fPLVuBbgpulj7qop9yL5YCGHuuz
 kqDn6D02+w93A1N0nxsy91R34FV6kwaUY5foI8pn598cKiv6Ck5pkCufvbPNxB6FvP/QhIWc3QL
 dWiJkq6G4ihV4vfRV62aSCg8Hjq+jm0Pse9uE+CVT8E+Zc2RKBk1/lfvmH9YiuZxaPVs1PAoHIE
 c1jIv/SsPssWYtQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieegteelheekgeeghfeivdevteefteejvdelvdffleegheegleelhfeiuddtfedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtohepthhho
 hhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Jul 2025 11:40:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7253

Add a "Limiting the Host Resources Usage" document to share the
different techniques that can be used to limit the host resources usage.
We do have a document to document how to speed up a build, so this
document comes right after.

[YOCTO #15111]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/index.rst              |   1 +
 documentation/dev-manual/limiting-resources.rst | 120 ++++++++++++++++++++++++
 2 files changed, 121 insertions(+)

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
index 000000000..9df27f313
--- /dev/null
+++ b/documentation/dev-manual/limiting-resources.rst
@@ -0,0 +1,120 @@
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
+   To determine a reasonable value to set for your host, follow these steps
+   below:
+
+   #.  Start by setting the maximum value for the CPU pressure::
+
+          BB_PRESSURE_MAX_CPU = "1000000"
+
+   #.  Then, start a heavy-load build and redirect the CPU pressure information
+       in a file::
+
+          bitbake -DDD core-image-minimal | grep "Current CPU pressure:" > cpu_pressure.txt
+
+       You can stop the build at anytime with Control + C.
+
+   #.  Next, sort the CPU pressure by highest from ``cpu_pressure.txt`` into
+       ``cpu_pressure_sorted.txt``::
+
+          sort -r -n -t ' ' -k 5 < cpu_pressure.txt > cpu_pressure_sorted.txt
+
+   #.  Finally, open the ``cpu_pressure_sorted.txt`` file and inspect the
+       highest values. These should indicate a value reached by your host
+       system. You can set a value below the highest number in that file.
+
+   The steps above are applicable for the I/O and Memory pressure
+   (:term:`BitBake` prints ``Current IO pressure:`` or ``Current Memory
+   pressure:`` messages).
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


