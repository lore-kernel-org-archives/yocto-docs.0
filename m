Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F07CC83F05
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 08:01:56 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.7635.1751616108054953298
 for <docs@lists.yoctoproject.org>;
 Fri, 04 Jul 2025 01:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=N/4ePUMj;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BCE843143;
	Fri,  4 Jul 2025 08:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751616106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tb081/j1/NhjL/xAOgC/S8PoxbyEEnGobBCGZcADdsY=;
	b=N/4ePUMjP1tZdNwEMS66Kinr0mzIDq8vsu65i7ngZ1CJ22dD32dT9FFNps25Xa/lrKp+xC
	tP8d9Q70hy7OQPOqUA9hlCKsN/dMPM0zb1yCt54DCHbebu8lc15ElaRcU2nwr20t2QdIp3
	NK/pOpn45XGvd0izmF1+Ra69k0Mqo+tUQsSLB5BNqV28Zk8d7uOdRIP2swWvE2wJF4MHwm
	P7j+GeYzE9VvDZxik9r7UVBSYSI+Onzc7TFsXciceg8pprCxEtOGxk0k+T0vpjHkJ5Yn0+
	VDgt1XC+5iKZlVQiI8I3+UAO//28/vifQYJqLt5GRPHwMXKg0c5yItGlfnG3Kw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 04 Jul 2025 10:01:38 +0200
Subject: [PATCH v3 1/2] Add a document on limiting host resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-resource-limiting-v3-1-4feb5e673aa6@bootlin.com>
References: <20250704-resource-limiting-v3-0-4feb5e673aa6@bootlin.com>
In-Reply-To: <20250704-resource-limiting-v3-0-4feb5e673aa6@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7443;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=g4JQqYsy5DNJguRG4KxKCV9N+vdj8mo9r8w9ioreQVc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBoZ4pp5s++rW4S+uvzSKKy5kgRA+a2jpUOfm0pi
 Myf4Yailv6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaGeKaQAKCRDRgEFAKaOo
 NhZHEACdkSTxuqCdmoVcR3RTxLlTMBDDzfsHSfc3QyW5jmZ/qPjD41656C//lKVzcfU2cELl6js
 42b+FoMZg6p77zHQ7NSWrxApqaztY1My/wRH/zQxFgONd9pFB9WTAqunud2puDSZvM862wGqdZh
 5OVKvtZlaT1XFHcM1fQHj5Obe4sP3hKmYyMy+VXqwymtEyjoG0cYAYzBFRSl4UHOz9pKCh49Z5Q
 o0eabHJaDgfD8gRME5YoDT2YI0ehZjLKV+9qc7uAp4JZjPrKjS4JnFLJseHF4ATcNNZzBByh9MC
 EOPd1rjfKxrYsmx7x18efnV6qBycHfq2A8nuO2xnCFG/v7N/MzK12BsqP1TkWaLjsNspuZmb8Ev
 xHiC7cFnxg0BRutNBujpzGNHrPM3B9duvM5NfWfJyCVzmLCVZfoiDuypeKckoL3+XGPb3yvn42B
 mwRYLGhTG6UsKMze9ujZgRDhmtki48M2CCsUJNLnuWCUIkByisa/1ZeNh+u7XUCYp9CcDEghZbH
 IMy8uqZnBW1/2P5K1gx4EzGmel6zkgK8B5LwvY0GwXilNrpdw0TRqo7rEshdblgDGLzeCMFptLn
 l6qwLb8/ScWUNUe31yLYkFqSQJJp0g1k8TvEI2Tz24+qRTDHPUtVQgBwkEG9MQHJ8LefWN4KWvJ
 UhdqLFIeRbscTgw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvvdeifecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieegteelheekgeeghfeivdevteefteejvdelvdffleegheegleelhfeiuddtfedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguo
 hgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 04 Jul 2025 08:01:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7262

Add a "Limiting the Host Resources Usage" document to share the
different techniques that can be used to limit the host resources usage.
We do have a document to document how to speed up a build, so this
document comes right after.

[YOCTO #15111]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/index.rst              |   1 +
 documentation/dev-manual/limiting-resources.rst | 133 ++++++++++++++++++++++++
 2 files changed, 134 insertions(+)

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
index 000000000..58ee363e3
--- /dev/null
+++ b/documentation/dev-manual/limiting-resources.rst
@@ -0,0 +1,133 @@
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


