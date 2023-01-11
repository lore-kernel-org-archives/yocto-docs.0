Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E95C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 09:51:39 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.20099.1673430694004563357
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Jan 2023 01:51:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZQwAthjI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4278BFF80B;
	Wed, 11 Jan 2023 09:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673430691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lzBTbItV/+LJG+wZI6OdMLyoZz+hizcjXUehPOBvrGE=;
	b=ZQwAthjI0eO6etLTnL89PdWzfuvsaKab5Ws8orL/cdd0bm7gCv+WLa5nhq9FigRmXNOaL4
	hpbwep9LdR+nPKHHXHA6yQ2UPXzn3s0Cmm47xY+Veo+QvFgkpLSSTp1aYAXzOy06DfJmRh
	xEiKXpvcVm1EDwOaNDNg3JGSb/MjCDesSDEIaqpiVntUET5ylR5jBO1scR+ggUJCyMHxZE
	2kY2IU7GC6mTGcc1n/8s/mUyC2gyObOVWMA/C8+Y4b4qrOJRL4Fn/Wgbz0kAwS9J70CVuc
	G154SMm7k1Wy4K2wVthvmhFWnlJVO8a2ly0fLvRs58O8CTg5KSdIacTAygTlMQ==
From: michael.opdenacker@bootlin.com
To: otavio.salvador@gmail.com,
	pab@pabigot.com,
	Qi.Chen@windriver.com,
	alex.kanavin@gmail.com,
	Ahmed.Hossam@opensynergy.com,
	raj.khem@gmail.com,
	matt@madison.systems
Cc: docs@lists.yoctoproject.org,
	Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Jan Dorniak <jaskij@gmail.com>
Subject: [PATCH] ref-manual: initial documentation for go and go-mod classes
Date: Wed, 11 Jan 2023 10:51:09 +0100
Message-Id: <20230111095109.477423-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Jan 2023 09:51:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3603

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This addresses [YOCTO #14582]

---
 If you are familiar with the Go classes, please review and propose corrections
 or extensions to what I wrote. My understanding of Go is very limited,
 and I'm not even sure go-mod.bbclass is for building or just importing
 Go modules.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Reported-by: Jan Dorniak <jaskij@gmail.com>
---
 documentation/ref-manual/classes.rst   | 23 +++++++++
 documentation/ref-manual/variables.rst | 67 ++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 7dba617db5..0cb507b500 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -758,6 +758,29 @@ software from the GNOME stack. This class sets
 mirrors as well as extending :term:`FILES` with the typical
 GNOME installation paths.
 
+.. _ref-classes-go:
+
+``go``
+======
+
+The :ref:`ref-classes-go` class supports building Go programs. The behavior of
+this class is controlled by the mandatory :term:`GO_IMPORT` variable, and
+by the optional :term:`GO_INSTALL` and :term:`GO_INSTALL_FILTEROUT` ones.
+
+To build a Go program with the Yocto Project, you can use the
+:yocto_git:`go-helloworld_0.1.bb </poky/tree/meta/recipes-extended/go-examples/go-helloworld_0.1.bb>`
+recipe as an example.
+
+.. _ref-classes-go-mod:
+
+``go-mod``
+==========
+
+The :ref:`ref-classes-go-mod` class allows to use Go modules, and inherits the
+:ref:`ref-classes-go` class.
+
+See the associated :term:`GO_WORKDIR` variable.
+
 .. _ref-classes-gobject-introspection:
 
 ``gobject-introspection``
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index f2decd713b..8419c80d03 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3012,6 +3012,73 @@ system and gives an overview of their function and contents.
 
          GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 en_US.UTF-8"
 
+   :term:`GO_IMPORT`
+      When inheriting the :ref:`ref-classes-go` class, this mandatory variable
+      sets the import path for the Go package that will be created for the code
+      to build. If you have a ``go.mod`` file in the source directory, this
+      typically matches the path in the ``module`` line in this file.
+
+      Other Go programs importing this package will use this path.
+
+      Here is an example setting from the
+      :yocto_git:`go-helloworld_0.1.bb </poky/tree/meta/recipes-extended/go-examples/go-helloworld_0.1.bb>`
+      recipe::
+
+          GO_IMPORT = "golang.org/x/example"
+
+   :term:`GO_INSTALL`
+      When inheriting the :ref:`ref-classes-go` class, this optional variable
+      specifies which packages in the sources should be compiled and
+      installed in the Go build space by the
+      `go install <https://go.dev/ref/mod#go-install>`__ command.
+
+      Here is an example setting from the
+      :oe_git:`crucible </meta-openembedded/tree/meta-oe/recipes-support/crucible/>`
+      recipe::
+
+         GO_INSTALL = "\
+             ${GO_IMPORT}/cmd/crucible \
+             ${GO_IMPORT}/cmd/habtool \
+         "
+
+      By default, :term:`GO_INSTALL` is defined as::
+
+         GO_INSTALL ?= "${GO_IMPORT}/..."
+
+      The ``...`` wildcard means that it will catch all
+      packages found in the sources.
+
+      See the :term:`GO_INSTALL_FILTEROUT` variable for
+      filtering out unwanted packages from the ones
+      found from the :term:`GO_INSTALL` value.
+
+   :term:`GO_INSTALL_FILTEROUT`
+      When using the Go "vendor" mechanism to bring in dependencies for a Go
+      package, the default :term:`GO_INSTALL` setting, which uses the ``...``
+      wildcard, will include the vendored packages in the build, which produces
+      incorrect results.
+
+      There are also some Go packages that are structured poorly, so that the
+      ``...`` wildcard results in building example or test code that should not
+      be included in the build, or could fail to build.
+
+      This optional variable allows for filtering out a subset of the sources.
+      It defaults to excluding everything under the ``vendor`` subdirectory
+      under package's main directory. This is the normal location for vendored
+      packages, but it can be overridden by a recipe to filter out other
+      subdirectories if needed.
+
+   :term:`GO_WORKDIR`
+      When using Go Modules, the current working directory must be the directory
+      containing the ``go.mod`` file, or one of its subdirectories. When the
+      ``go`` tool is used, it will automatically look for the ``go.mod`` file
+      in the Go working directory or in any parent directory, but not in
+      subdirectories.
+
+      When using the :ref:`ref-classes-go-mod` class to use Go modules,
+      the optional :term:`GO_WORKDIR` variable, defaulting to the value
+      of :term:`GO_IMPORT`, allows to specify a different Go working directory.
+
    :term:`GROUPADD_PARAM`
       When inheriting the :ref:`ref-classes-useradd` class,
       this variable specifies for a package what parameters should be
-- 
2.37.2


