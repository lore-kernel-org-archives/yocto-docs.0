Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033E1D6B082
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:40 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17211.1769700273566995838
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QfjTLxCz;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E9DC2C22F47
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8D83606FD;
	Thu, 29 Jan 2026 15:24:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B787B119A887F;
	Thu, 29 Jan 2026 16:24:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700271; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2UBbJylCZ6AFW0/ZJ8jSUJjND+uIJ0s4TJURHjXZauQ=;
	b=QfjTLxCzsvifJgI5q56PHO2WJDm62C/4szNScN6Gq+WDCLPZfkbWBixqgLrUxACq/u0v/f
	Nc1nQ0dEkoA/3M3O92ya7eJVXd8Ea6sXpZ3Celyslg/roBjMO257VPSGfnMJZtJwvEDILA
	TrSJTv3IScQkuOyLkeBNvJQzVIXXGESdJ0t9VY3V6zboL0cCk06oE0bUzlZsIn5fpTev7g
	yusjPXRrySjFMjKV/xvpiSna8c0wl0Vjmyxv8jdRJ9PtueYQJKcmF9qXVYkIoRbMg7DxQq
	wZjfyAXQtCa8aAnaZYb4Q3oN4Me1CZg1KrRziO5ZHaRcHfcIsoWkboXr9rtfPw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:32 +0100
Subject: [PATCH v3 41/57] dev-manual/packages.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-41-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2270;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=sipZX5YaKlni2+uWAY++BWh/Et1byo3Re9ZNWo8ouoE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uPEOF93n1TLUSyhfONTd6KQFvJ8SdZlcT56
 k2pgaMg7qiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7jwAKCRDRgEFAKaOo
 No6+EACkkblNhiC9Xh+rb/mZZ6GuhWUL4wV8ijDh8KDhfj/ZSNx82EeA86DHI5mQYWidplBrolh
 /hUbSm+MQn7n1FTlBbjim5ffgKm95K/cGoals7SnCNuHYpKyzrlgg95mrjvGrrZNdlD5MhjqlRa
 e55K7idzBH2qngzNOJM9vANQm71Q8LiXyugtWJ2/2F0ix8kY/G372m8HY4Bl1+bySL1FrxzUEH9
 MvGbZFtPP+zBPstTAaPMkxHorvBIuWEKQmoM//2krqe3PUmBnC+/j7Z5e62Csol5J/i8xMVHoOp
 ANP3HjkgkEDNn4ApXxh1PgkY93TGxMyM9euICrqBzM78ohx+/NvHwefy8kqohGUtULZtoiItgYb
 C0AZNRi1N/HI3A5qZXxbMaW8ZVYn1mOqk4jo+El4NoNn8xafFQOoDTfeCEx8T2oNeAiSpOTjSxi
 I0YtcOqp9k0cL8QiOt9++Vtst796qSI/MmyiKPaN1cEQjwNwBt1570/VEzVH9sREzJDgWeSbABu
 VdbpuXqz2tvSu6vGsdhES2Ci10tHd3iDBdnuH1LnXw2AEXnbQlHmI2U0USUlQdVFN4koSjKKajU
 WM/gzylEOaJ3rRaHa2vwkHYEXAmOJde/eY+WnQxoliYyquWR3Kj/lmYIZISlfDbtd7n5iewCVsG
 xKcLUYso/Kf9+CQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8827

Refresh the document now that the Poky repository is obsolete.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/packages.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 8bd48c8e8..ebed8f076 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -361,8 +361,9 @@ package. It is also perfectly acceptable to call ``do_split_packages``
 multiple times if you have more than one set of modules to package.
 
 For more examples that show how to use ``do_split_packages``, see the
-``connman.inc`` file in the ``meta/recipes-connectivity/connman/``
-directory of the ``poky`` :ref:`source repository <overview-manual/development-environment:yocto project source repositories>`. You can
+``connman.inc`` file in the :oe_git:`meta/recipes-connectivity/connman/
+</openembedded-core/tree/meta/recipes-connectivity/connman/>`
+directory of :term:`OpenEmbedded-Core (OE-Core)`. You can
 also find examples in ``meta/classes-recipe/kernel.bbclass``.
 
 Here is a reference that shows ``do_split_packages`` mandatory and
@@ -543,7 +544,7 @@ to use. In your configuration, you use the
 variable to specify the format:
 
 #. Open the ``local.conf`` file inside your :term:`Build Directory` (e.g.
-   ``poky/build/conf/local.conf``).
+   ``bitbake-builds/build/conf/local.conf``).
 
 #. Select the desired package format as follows::
 
@@ -637,10 +638,10 @@ Lighttpd, or Nginx), take the appropriate steps to do so.
 
 From within the :term:`Build Directory` where you have built an image based on
 your packaging choice (i.e. the :term:`PACKAGE_CLASSES` setting), simply start
-the server. The following example assumes a :term:`Build Directory` of ``poky/build``
+the server. The following example assumes a :term:`Build Directory` of ``bitbake-builds/build``
 and a :term:`PACKAGE_CLASSES` setting of ":ref:`ref-classes-package_rpm`"::
 
-   $ cd poky/build/tmp/deploy/rpm
+   $ cd bitbake-builds/build/tmp/deploy/rpm
    $ python3 -m http.server
 
 Target Setup

-- 
2.52.0


