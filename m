Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62823C07E9D
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 17:53:09 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.589.1663955585558332483
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 10:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=feL1PDST;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 77971200007;
	Fri, 23 Sep 2022 17:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663955584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kZDVw2H4UQM+7frqL23kb7Fq59RRZuGua5l/PJZ4tuY=;
	b=feL1PDSTUbhziyTPVJOzLvopeD1NF9pm/5LLpZdgvC4xxVRSAM8FRVUfs7oyTyFMQK3xHP
	3EKm4xv/go8jopH7oqoAJAr26wU4721R5g+zfGupVmyj5pjCkNLir1PfmMzShjiHxYxLg4
	fckYJDDiQcIBy/uIO65cRPQai2ZLL1aEGaUsc0Qdsv+qzxRt+I7+YQCuzHsCd/0eoCByRK
	uUq4zNHJ4n4qt5b2zf4luWDj90CVRi3uH9iefo3onXFDj3t48CEg+T9tPBu9zMkRZKfgsR
	9xQAbrOYD6+TYGTBoicWxtE3weubFzkrf+AMdF/bYHN/hA+cYJL6WQxc21QW0A==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <foss@0leil.net>
Subject: [PATCH 06/30] manuals: add references to the "do_deploy" task
Date: Fri, 23 Sep 2022 19:51:55 +0200
Message-Id: <20220923175219.6652-7-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
References: <20220923175219.6652-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Sep 2022 17:53:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3221

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

[YOCTO #14508]
Reported-by: Quentin Schulz <foss@0leil.net>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../migration-guides/migration-3.2.rst         |  4 ++--
 documentation/overview-manual/concepts.rst     | 18 +++++++++---------
 documentation/ref-manual/tasks.rst             |  8 ++++----
 documentation/ref-manual/variables.rst         |  2 +-
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/documentation/migration-guides/migration-3.2.rst b/documentation/migration-guides/migration-3.2.rst
index 8a8d19d605..4c0de7b0f6 100644
--- a/documentation/migration-guides/migration-3.2.rst
+++ b/documentation/migration-guides/migration-3.2.rst
@@ -207,9 +207,9 @@ files into a subdirectory and reference that instead.
 deploy class now cleans ``DEPLOYDIR`` before ``do_deploy``
 ----------------------------------------------------------
 
-``do_deploy`` as implemented in the :ref:`deploy <ref-classes-deploy>` class now cleans up ${:term:`DEPLOYDIR`} before running, just as :ref:`ref-tasks-install` cleans up ${:term:`D`} before running. This reduces the risk of :term:`DEPLOYDIR` being accidentally contaminated by files from previous runs, possibly even with different config, in case of incremental builds.
+:ref:`ref-tasks-deploy` as implemented in the :ref:`deploy <ref-classes-deploy>` class now cleans up ${:term:`DEPLOYDIR`} before running, just as :ref:`ref-tasks-install` cleans up ${:term:`D`} before running. This reduces the risk of :term:`DEPLOYDIR` being accidentally contaminated by files from previous runs, possibly even with different config, in case of incremental builds.
 
-Most recipes and classes that inherit the :ref:`deploy <ref-classes-deploy>` class or interact with ``do_deploy`` are unlikely to be affected by this unless they add ``prefuncs`` to ``do_deploy`` *which also* put files into ``${DEPLOYDIR}`` --- these should be refactored to use ``do_deploy_prepend`` instead.
+Most recipes and classes that inherit the :ref:`deploy <ref-classes-deploy>` class or interact with :ref:`ref-tasks-deploy` are unlikely to be affected by this unless they add ``prefuncs`` to :ref:`ref-tasks-deploy` *which also* put files into ``${DEPLOYDIR}`` --- these should be refactored to use ``do_deploy_prepend`` instead.
 
 
 .. _migration-3.2-nativesdk-sdk-provides-dummy:
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index 06220401bc..f3f8cbd95c 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -1801,14 +1801,14 @@ from the :ref:`deploy <ref-classes-deploy>` class::
 
 The following list explains the previous example:
 
--  Adding "do_deploy" to ``SSTATETASKS`` adds some required
+-  Adding ``do_deploy`` to ``SSTATETASKS`` adds some required
    sstate-related processing, which is implemented in the
    :ref:`sstate <ref-classes-sstate>` class, to
    before and after the
    :ref:`ref-tasks-deploy` task.
 
 -  The ``do_deploy[sstate-inputdirs] = "${DEPLOYDIR}"`` declares that
-   ``do_deploy`` places its output in ``${DEPLOYDIR}`` when run normally
+   :ref:`ref-tasks-deploy` places its output in ``${DEPLOYDIR}`` when run normally
    (i.e. when not using the sstate cache). This output becomes the input
    to the shared state cache.
 
@@ -1818,15 +1818,15 @@ The following list explains the previous example:
 
    .. note::
 
-      If ``do_deploy`` is not already in the shared state cache or if its input
+      If :ref:`ref-tasks-deploy` is not already in the shared state cache or if its input
       checksum (signature) has changed from when the output was cached, the task
       runs to populate the shared state cache, after which the contents of the
       shared state cache is copied to ${:term:`DEPLOY_DIR_IMAGE`}. If
-      ``do_deploy`` is in the shared state cache and its signature indicates
+      :ref:`ref-tasks-deploy` is in the shared state cache and its signature indicates
       that the cached output is still valid (i.e. if no relevant task inputs
       have changed), then the contents of the shared state cache copies
       directly to ${:term:`DEPLOY_DIR_IMAGE`} by the ``do_deploy_setscene`` task
-      instead, skipping the ``do_deploy`` task.
+      instead, skipping the :ref:`ref-tasks-deploy` task.
 
 -  The following task definition is glue logic needed to make the
    previous settings effective::
@@ -1836,16 +1836,16 @@ The following list explains the previous example:
       }
       addtask do_deploy_setscene
 
-  ``sstate_setscene()`` takes the flags above as input and accelerates the ``do_deploy`` task
+  ``sstate_setscene()`` takes the flags above as input and accelerates the :ref:`ref-tasks-deploy` task
   through the shared state cache if possible. If the task was
   accelerated, ``sstate_setscene()`` returns True. Otherwise, it
-  returns False, and the normal ``do_deploy`` task runs. For more
+  returns False, and the normal :ref:`ref-tasks-deploy` task runs. For more
   information, see the ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-execution:setscene`"
   section in the BitBake User Manual.
 
 -  The ``do_deploy[dirs] = "${DEPLOYDIR} ${B}"`` line creates
-   ``${DEPLOYDIR}`` and ``${B}`` before the ``do_deploy`` task runs, and
-   also sets the current working directory of ``do_deploy`` to ``${B}``.
+   ``${DEPLOYDIR}`` and ``${B}`` before the :ref:`ref-tasks-deploy` task runs, and
+   also sets the current working directory of :ref:`ref-tasks-deploy` to ``${B}``.
    For more information, see the ":ref:`bitbake:bitbake-user-manual/bitbake-user-manual-metadata:variable flags`"
    section in the BitBake
    User Manual.
diff --git a/documentation/ref-manual/tasks.rst b/documentation/ref-manual/tasks.rst
index e5938ee236..5efe64b35d 100644
--- a/documentation/ref-manual/tasks.rst
+++ b/documentation/ref-manual/tasks.rst
@@ -81,7 +81,7 @@ Recipes implementing this task should inherit the
 :ref:`deploy <ref-classes-deploy>` class and should write the output
 to ``${``\ :term:`DEPLOYDIR`\ ``}``, which is not to be
 confused with ``${DEPLOY_DIR}``. The :ref:`deploy <ref-classes-deploy>` class sets up
-``do_deploy`` as a shared state (sstate) task that can be accelerated
+:ref:`ref-tasks-deploy` as a shared state (sstate) task that can be accelerated
 through sstate use. The sstate mechanism takes care of copying the
 output from ``${DEPLOYDIR}`` to ``${DEPLOY_DIR_IMAGE}``.
 
@@ -90,14 +90,14 @@ output from ``${DEPLOYDIR}`` to ``${DEPLOY_DIR_IMAGE}``.
    Do not write the output directly to ``${DEPLOY_DIR_IMAGE}``, as this causes
    the sstate mechanism to malfunction.
 
-The ``do_deploy`` task is not added as a task by default and
+The :ref:`ref-tasks-deploy` task is not added as a task by default and
 consequently needs to be added manually. If you want the task to run
 after :ref:`ref-tasks-compile`, you can add it by doing
 the following::
 
       addtask deploy after do_compile
 
-Adding ``do_deploy`` after other tasks works the same way.
+Adding :ref:`ref-tasks-deploy` after other tasks works the same way.
 
 .. note::
 
@@ -110,7 +110,7 @@ Adding ``do_deploy`` after other tasks works the same way.
    See the ":ref:`bitbake-user-manual/bitbake-user-manual-execution:dependencies`"
    section in the BitBake User Manual for more information.
 
-If the ``do_deploy`` task re-executes, any previous output is removed
+If the :ref:`ref-tasks-deploy` task re-executes, any previous output is removed
 (i.e. "cleaned").
 
 .. _ref-tasks-fetch:
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 8055f044d0..8fac7f77ad 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6712,7 +6712,7 @@ system and gives an overview of their function and contents.
       - do_populate_lic
       - do_package_qa
       - do_populate_sysroot
-      - do_deploy
+      - :ref:`ref-tasks-deploy`
 
       Despite the default value of "" for the
       :term:`SDK_RECRDEP_TASKS` variable, the above four tasks are always added
-- 
2.34.1


