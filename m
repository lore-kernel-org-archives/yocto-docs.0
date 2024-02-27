Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B37FC54E51
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 14:01:41 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.12831.1709042500358504890
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 06:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iA/7o7wa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E22B66000C;
	Tue, 27 Feb 2024 14:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709042499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=08fmOFOTkj2ThVbhpCA2HTZp/P+PXtLcKuwuWhu9g/8=;
	b=iA/7o7wavI970ljgEwOUB57tRhQJOcnV8jtTqg0z4kwvSH4jrZkllAvLaRn74WPATy29EC
	2SxX/xVQ8DKUioFNwTiSSa+IuxHtJ7wb3kcgYHHHbv7xSc0e8OvgLfNPJhmQfLrckFjafQ
	5YH5gWsytHbm/e0ObdCh/ygo3G/RLx+jKiJqt/43wQJm876bAmfy8YMl5bT7R09nYypjxL
	620Ou0NlOoLtZkoB7Hu8EtzLexPlkfkOv8C4AV0Wy2wCoBKaUW5hQlspqry9lkfwVTBFgM
	sFpdLSrz0Tc3FXxY/RqlWpztWwPoO5mtlTeF7ktxrxeGUAovti2dn4ZGwie8ow==
From: michael.opdenacker@bootlin.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Paul Eggleton <paul.eggleton@microsoft.com>
Subject: [kirkstone][PATCH 08/16] ref-manual: add info on buildtools-make-tarball
Date: Tue, 27 Feb 2024 15:01:20 +0100
Message-Id: <20240227140128.481522-9-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
References: <20240227140128.481522-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Feb 2024 14:01:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4899

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

PENDING ON THIS OE-CORE PATCH:
install-buildtools: support buildtools-make-tarball and update to 4.1
https://lists.openembedded.org/g/openembedded-core/message/171522

Cover the use case and the new provided tarball.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 .../ref-manual/system-requirements.rst        | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 92e2211629..e0b8400178 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -303,8 +303,13 @@ resolve this by installing a ``buildtools-extended`` tarball that
 contains additional tools, the equivalent of the Debian/Ubuntu ``build-essential``
 package.
 
+For systems with a broken make version (e.g. make 4.2.1 without patches) but
+where the rest of the host tools are usable, you can use the ``buildtools-make``
+tarball instead.
+
 In the sections that follow, three different methods will be described for
-installing the ``buildtools`` or ``buildtools-extended`` toolset.
+installing the ``buildtools``, ``buildtools-extended`` or ``buildtools-make``
+toolset.
 
 Installing a Pre-Built ``buildtools`` Tarball with ``install-buildtools`` script
 --------------------------------------------------------------------------------
@@ -339,6 +344,13 @@ installer and automatically installs the tools for you:
       $ cd poky
       $ scripts/install-buildtools
 
+   Alternatively if your host development system has a broken ``make``
+   version such that you only need a known good version of ``make``,
+   you can use the ``--make-only`` option:
+
+      $ cd poky
+      $ scripts/install-buildtools --make-only
+
 2. Source the tools environment setup script by using a command like the
    following::
 
@@ -373,6 +385,10 @@ steps:
 
       $ sh ~/Downloads/x86_64-buildtools-extended-nativesdk-standalone-&DISTRO;.sh
 
+   An example for the make-only installer::
+
+      $ sh ~/Downloads/x86_64-buildtools-make-nativesdk-standalone-&DISTRO;.sh
+
    During execution, a prompt appears that allows you to choose the
    installation directory. For example, you could choose the following:
    ``/home/your-username/buildtools``
@@ -418,6 +434,10 @@ installer:
 
       $ bitbake buildtools-extended-tarball
 
+   or to build the make-only tarball::
+
+      $ bitbake buildtools-make-tarball
+
    .. note::
 
       The :term:`SDKMACHINE` variable in your ``local.conf`` file determines
@@ -441,6 +461,10 @@ installer:
 
       $ sh ~/Downloads/x86_64-buildtools-extended-nativesdk-standalone-&DISTRO;.sh
 
+   or for the make-only installer::
+
+      $ sh ~/Downloads/x86_64-buildtools-make-nativesdk-standalone-&DISTRO;.sh
+
    During execution, a prompt appears that allows you to choose the
    installation directory. For example, you could choose the following:
    ``/home/your_username/buildtools``
-- 
2.34.1


