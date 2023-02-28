Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74688C64ED6
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 18:12:50 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.31493.1677607966106553003
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Feb 2023 10:12:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cJJ4e2Mo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 943D8240003;
	Tue, 28 Feb 2023 18:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677607964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MqBcsvVyB6xYXmrUhWJEopDh3X+HTT6FRz61WrZlZ1g=;
	b=cJJ4e2MoADb3T+hJ0o8c491Yv6sgLNm5fmbr/lv7NfpBKf593nDdFy9gRCnguxVTvuQ6aI
	EArGqd1boUb6tfxLUyJh2TSkMMuqLUxX+4BUB/GZh+Pbemhnmwqo0zW/foswF5d1UNNY/4
	ufL3gU92eCV/O7r7AgJ+efLZTsaYWDfZA/zH+J0Rsp15udxYm9r5QT3FFQ851Q2rB13p1Q
	UzrphIrJeSWE3axcQ+yi7Nd0HHcPVieSvIg8NogWIWsaUZIslSlrdLzwSgw8CnsvjdaiKC
	+Qu47hTr2tuO9pGAGrW7zeRUX9wSdRT3N3aq8AvnE43iTZeL5qYAr+9ZHy4BJg==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Tom Hochstein <tom.hochstein@nxp.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH RESEND] ref-manual: clarify explanations about feature backfilling
Date: Tue, 28 Feb 2023 19:12:38 +0100
Message-Id: <20230228181238.359651-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Feb 2023 18:12:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3758

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Joshua Watt <JPEWhacker@gmail.com>
CC: Martin Jansa <martin.jansa@gmail.com>
CC: Tom Hochstein <tom.hochstein@nxp.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
---

 Resend to CC the people who contributed to the discussion
 about the corresponding variables.

 documentation/ref-manual/classes.rst   |  5 +-
 documentation/ref-manual/features.rst  | 92 ++++++++++++--------------
 documentation/ref-manual/variables.rst | 50 +++++++++-----
 3 files changed, 78 insertions(+), 69 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 7ff0fcb335..e8dec31b00 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -858,8 +858,9 @@ introspection. This functionality is only enabled if the
 
 .. note::
 
-   This functionality is backfilled by default and, if not applicable,
-   should be disabled through :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED` or
+   This functionality is :ref:`backfilled <ref-features-backfill>` by default
+   and, if not applicable, should be disabled through
+   :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED` or
    :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED`, respectively.
 
 .. _ref-classes-grub-efi:
diff --git a/documentation/ref-manual/features.rst b/documentation/ref-manual/features.rst
index 051bf9320a..5a064329f1 100644
--- a/documentation/ref-manual/features.rst
+++ b/documentation/ref-manual/features.rst
@@ -6,7 +6,7 @@ Features
 
 This chapter provides a reference of shipped machine and distro features
 you can include as part of your image, a reference on image features you
-can select, and a reference on feature backfilling.
+can select, and a reference on :ref:`ref-features-backfill`.
 
 Features provide a mechanism for working out which packages should be
 included in the generated images. Distributions can select which
@@ -416,58 +416,50 @@ these valid features is as follows:
 Feature Backfilling
 ===================
 
-Sometimes it is necessary in the OpenEmbedded build system to extend
-:term:`MACHINE_FEATURES` or
-:term:`DISTRO_FEATURES` to control functionality
-that was previously enabled and not able to be disabled. For these
-cases, we need to add an additional feature item to appear in one of
-these variables, but we do not want to force developers who have
-existing values of the variables in their configuration to add the new
-feature in order to retain the same overall level of functionality.
-Thus, the OpenEmbedded build system has a mechanism to automatically
-"backfill" these added features into existing distro or machine
+Sometimes it is necessary in the OpenEmbedded build system to
+add new functionality to :term:`MACHINE_FEATURES` or
+:term:`DISTRO_FEATURES`, but at the same time, allow existing
+distributions or machine definitions to opt out of such new
+features, to retain the same overall level of functionality.
+
+To make this possible, the OpenEmbedded build system has a mechanism to
+automatically "backfill" features into existing distro or machine
 configurations. You can see the list of features for which this is done
-by finding the
-:term:`DISTRO_FEATURES_BACKFILL` and
-:term:`MACHINE_FEATURES_BACKFILL`
-variables in the ``meta/conf/bitbake.conf`` file.
-
-Because such features are backfilled by default into all configurations
-as described in the previous paragraph, developers who wish to disable
-the new features need to be able to selectively prevent the backfilling
-from occurring. They can do this by adding the undesired feature or
-features to the
+by checking the :term:`DISTRO_FEATURES_BACKFILL` and
+:term:`MACHINE_FEATURES_BACKFILL` variables in the
+``meta/conf/bitbake.conf`` file.
+
+These two variables are paired with the
 :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED`
-or
-:term:`MACHINE_FEATURES_BACKFILL_CONSIDERED`
-variables for distro features and machine features respectively.
-
-Here are two examples to help illustrate feature backfilling:
-
--  *The "pulseaudio" distro feature option*: Previously, PulseAudio
-   support was enabled within the Qt and GStreamer frameworks. Because
-   of this, the feature is backfilled and thus enabled for all distros
-   through the :term:`DISTRO_FEATURES_BACKFILL` variable in the
-   ``meta/conf/bitbake.conf`` file. However, your distro needs to
-   disable the feature. You can disable the feature without affecting
-   other existing distro configurations that need PulseAudio support by
-   adding "pulseaudio" to :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED` in
-   your distro's ``.conf`` file. Adding the feature to this variable
-   when it also exists in the :term:`DISTRO_FEATURES_BACKFILL` variable
-   prevents the build system from adding the feature to your
-   configuration's :term:`DISTRO_FEATURES`, effectively disabling the
-   feature for that particular distro.
+and :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED` variables
+which allow distro or machine configuration maintainers to `consider` any
+added feature, and decide when they wish to keep or exclude such feature,
+thus preventing the backfilling from happening.
+
+Here are two examples to illustrate feature backfilling:
+
+-  *The "pulseaudio" distro feature option*: Previously, PulseAudio support was
+   enabled within the Qt and GStreamer frameworks. Because of this, the feature
+   is now backfilled and thus enabled for all distros through the
+   :term:`DISTRO_FEATURES_BACKFILL` variable in the ``meta/conf/bitbake.conf``
+   file. However, if your distro needs to disable the feature, you can do so
+   without affecting other existing distro configurations that need PulseAudio
+   support. You do this by adding "pulseaudio" to
+   :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED` in your distro's ``.conf``
+   file. So, adding the feature to this variable when it also exists in the
+   :term:`DISTRO_FEATURES_BACKFILL` variable prevents the build system from
+   adding the feature to your configuration's :term:`DISTRO_FEATURES`,
+   effectively disabling the feature for that particular distro.
 
 -  *The "rtc" machine feature option*: Previously, real time clock (RTC)
    support was enabled for all target devices. Because of this, the
    feature is backfilled and thus enabled for all machines through the
-   :term:`MACHINE_FEATURES_BACKFILL` variable in the
-   ``meta/conf/bitbake.conf`` file. However, your target device does not
-   have this capability. You can disable RTC support for your device
-   without affecting other machines that need RTC support by adding the
-   feature to your machine's :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED`
-   list in the machine's ``.conf`` file. Adding the feature to this
-   variable when it also exists in the :term:`MACHINE_FEATURES_BACKFILL`
-   variable prevents the build system from adding the feature to your
-   configuration's :term:`MACHINE_FEATURES`, effectively disabling RTC
-   support for that particular machine.
+   :term:`MACHINE_FEATURES_BACKFILL` variable in the ``meta/conf/bitbake.conf``
+   file. However, if your target device does not have this capability, you can
+   disable RTC support for your device without affecting other machines
+   that need RTC support. You do this by adding the "rtc" feature to the
+   :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED` list in your machine's ``.conf``
+   file. So, adding the feature to this variable when it also exists in the
+   :term:`MACHINE_FEATURES_BACKFILL` variable prevents the build system from
+   adding the feature to your configuration's :term:`MACHINE_FEATURES`,
+   effectively disabling RTC support for that particular machine.
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 9b581599e3..2e32e264db 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -2111,19 +2111,27 @@ system and gives an overview of their function and contents.
       provide with this variable, see the ":ref:`ref-features-distro`" section.
 
    :term:`DISTRO_FEATURES_BACKFILL`
-      Features to be added to :term:`DISTRO_FEATURES` if not also present in
-      :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED`.
+      A space-separated list of features to be added to :term:`DISTRO_FEATURES`
+      if not also present in :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED`.
 
       This variable is set in the ``meta/conf/bitbake.conf`` file. It is
       not intended to be user-configurable. It is best to just reference
-      the variable to see which distro features are being backfilled for
-      all distro configurations. See the ":ref:`ref-features-backfill`" section
-      for more information.
+      the variable to see which distro features are being
+      :ref:`backfilled <ref-features-backfill>` for all distro configurations.
 
    :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED`
-      Features from :term:`DISTRO_FEATURES_BACKFILL` that should not be
-      backfilled (i.e. added to :term:`DISTRO_FEATURES`) during the build. See
-      the ":ref:`ref-features-backfill`" section for more information.
+      A space-separated list of features from :term:`DISTRO_FEATURES_BACKFILL`
+      that should not be :ref:`backfilled <ref-features-backfill>` (i.e. added
+      to :term:`DISTRO_FEATURES`) during the build.
+
+      This corresponds to an opt-out mechanism. When new default distro
+      features are introduced, distribution maintainers can review (`consider`)
+      them and decide to exclude them from the
+      :ref:`backfilled <ref-features-backfill>` features. Therefore, the
+      combination of :term:`DISTRO_FEATURES_BACKFILL` and
+      :term:`DISTRO_FEATURES_BACKFILL_CONSIDERED` makes it possible to
+      add new default features without breaking existing distributions.
+
 
    :term:`DISTRO_FEATURES_DEFAULT`
       A convenience variable that gives you the default list of distro
@@ -5129,19 +5137,27 @@ system and gives an overview of their function and contents.
       shipped, see the ":ref:`ref-features-machine`" section.
 
    :term:`MACHINE_FEATURES_BACKFILL`
-      Features to be added to :term:`MACHINE_FEATURES` if not also present in
+      A list of space-separated features to be added to
+      :term:`MACHINE_FEATURES` if not also present in
       :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED`.
 
-      This variable is set in the ``meta/conf/bitbake.conf`` file. It is
-      not intended to be user-configurable. It is best to just reference
-      the variable to see which machine features are being backfilled for
-      all machine configurations. See the ":ref:`ref-features-backfill`"
-      section for more information.
+      This variable is set in the ``meta/conf/bitbake.conf`` file. It is not
+      intended to be user-configurable. It is best to just reference the
+      variable to see which machine features are being
+      :ref:`backfilled <ref-features-backfill>` for all machine configurations.
 
    :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED`
-      Features from :term:`MACHINE_FEATURES_BACKFILL` that should not be
-      backfilled (i.e. added to :term:`MACHINE_FEATURES`) during the build. See
-      the ":ref:`ref-features-backfill`" section for more information.
+      A list of space-separated features from :term:`MACHINE_FEATURES_BACKFILL`
+      that should not be :ref:`backfilled <ref-features-backfill>` (i.e. added
+      to :term:`MACHINE_FEATURES`) during the build.
+
+      This corresponds to an opt-out mechanism. When new default machine
+      features are introduced, machine definition maintainers can review
+      (`consider`) them and decide to exclude them from the
+      :ref:`backfilled <ref-features-backfill>` features. Therefore, the
+      combination of :term:`MACHINE_FEATURES_BACKFILL` and
+      :term:`MACHINE_FEATURES_BACKFILL_CONSIDERED` makes it possible to
+      add new default features without breaking existing machine definitions.
 
    :term:`MACHINEOVERRIDES`
       A colon-separated list of overrides that apply to the current
-- 
2.37.2


