Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7557CCD1AB
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:20:48 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.4948.1761294038888410901
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fO5rx7VR;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 98A18C0C41B
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 729A360703
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F5E9102F2489;
	Fri, 24 Oct 2025 10:20:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761294036; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=brJfjuULOxzwo+MVdt9TE/+ayfDxze1XFgRMUEnGV2Y=;
	b=fO5rx7VR9Bg+3QZNVAYT4REkHAezxiFijvlOgyEsWrnaul6aAaav/dfoaAXCZuhGUBR+IU
	J9ReRMbof9h+DDwrw12tKV5rYksSq0Yp1jT13XqGww2a1SdOvSVuzGK8G48W+FzVzqkmXB
	ZzrSDpb3KuEIZrpK//KzKs2Quh7T8ONwTRz6V2gB/ILqAzjWyE+SeQM1rijfoVVsI3GTCW
	+GmbYea0/z79Cl1xuBSTarvY3HMqz5YeYCCaP5gI9vuA4Dj8P3/8Lrj4t9zZU5pJw+S9Ia
	E/VDtgjnBqDSlPC3ZAoq0MYSS6EMid8JzPxKyoA13b9fKGz1zEL5cWMX9gbFMA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Oct 2025 10:20:00 +0200
Subject: [PATCH v2 11/16] ref-manual/classes.rst: gettext: extend the
 documentation of the class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-release-note-5-3-second-hunk-v2-11-d15dabc095d0@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=WssX9NDWKyCc7vjExCZnYzVSEGWsyL2vgRejzBO2X1o=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo+zbJ07yBiADtgutgOl8abCm1qWMSsCyLVsR6A
 oheD/yDaKOJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPs2yQAKCRDRgEFAKaOo
 NvmYD/9RnzanHpy3oEmlCI+Gvqo5w5nVCx9FMXVSM5sR9TkgyW+9Cwakn++5xc5kZ9Er3Kj7rGs
 U5w3gXm4s6MSFCB60pVwQLCjtRErV29tO44sICDYcdMunHOWgBaeJiTzRdV/ibVZS8oh3+FFbwV
 +ykdw0C1UOImaz97vjQwwBe9wMFhbC+47p98P0r0Fu1WOL+XpIdkyfnblCvhVcQM+1aOXICfnGD
 YoU/w4P5V+SCpOW0o4QhBacLsZCWKJJBBeyA7Ei2+3C4nArRER9zqYwVgk2RgPEopwlOm21Hefd
 XOvnFmR0qH68haPay5496/m+NjeysoYKrGe1zuIC7eMpxvPuGBs5CsHfMuHsEvWCOGo9tIhdwQl
 UP2ObO85W8+SW7Oi2XSkhQPNPTIy0Cf2PWfB28m9XUfXhiDOruEUrGAXOboq58eVApAa+MHp5lj
 eXxW0hLTe6iKfHpk9Zykx/vt8H5+DljwZbwT7zt1tdD5+FzWcfb9JxW4E+pA+w9z2MZb2qDhmTK
 Cw0SZ/+3p4yBXzOLfOlbj7DwDw6Rj6u0nIC5zKs0CUNRWdhJ4ACPpUWngkuk6Yzig3IKDTfBZLa
 lZol7Yrqv4CE+NdiXrEr6TwTEf5X3naNifsvPE6SfDrsux2smp9Q9E1wvYbH3wTiQuzgJy8oYO7
 p4fsp7f9Z2JvRdQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7800

Mention the use of USE_NLS, INHIBIT_DEFAULT_DEPS and the cross-canadian
class.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 34bc7fed8..cd447d2c2 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -968,6 +968,14 @@ software that uses the GNU ``gettext`` internationalization and localization
 system. All recipes building software that use ``gettext`` should inherit this
 class.
 
+This class will configure recipes to build translations *unless*:
+
+-  the :term:`USE_NLS` variable is set to ``no``, or
+
+-  the :term:`INHIBIT_DEFAULT_DEPS` variable is set, unless the recipe inheriting
+   the :ref:`ref-classes-gettext` class also inherits the
+   :ref:`ref-classes-cross-canadian` class.
+
 .. _ref-classes-github-releases:
 
 ``github-releases``

-- 
2.51.0


