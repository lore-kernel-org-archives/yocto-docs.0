Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1957FCFB45C
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 15:25:02 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.19557.1728487496514804715
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 08:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OK0NJkqZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5252240011;
	Wed,  9 Oct 2024 15:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728487495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=blsAKzTZp9ZsQrHFyTdOh6tpRSOO8K5LgHjWU4ZBSF8=;
	b=OK0NJkqZg459GHaLLZmInndNcAQZTcUF7eecjmP9RaqoPTG0jisKYqSGhOoiSJC0NkXnVa
	6a0wSwfVixSP5omiNijSC+FDajVHjpeb47GBq980azEqnAbHYcUK8ouOnnvMjDiyUwU2v7
	B9UtcHt+sT9+pb/bC898xeTO1loUR0KUM/j+p6p+byzaid+SyCUXd7nDQU1/vc5ESTpSn+
	xpBRzSBvAo20eI41kNxWT9z39nOJQ4cGKNzbp9pkp28cNAspq+AycFdg3UxgZ8KAgfsm/d
	qnocj4BkNrrc2vSZZwfmkl/2qc1TjMxbKMegQYlglF/UD+02RTndLelfZwp8Xg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Oct 2024 17:24:14 +0200
Subject: [PATCH v2 06/16] ref-manual: drop siteconfig class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-release-note-5-1-v2-6-7d484f7e7b6f@bootlin.com>
References: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
In-Reply-To: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=yjDrzUs+kiEwvVJH2kHDnWqbFA5ToOoc+EjCkYuQQFQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnBqBDq2oHrOYewFm7JycNw1XcsOPLH31M4SStd
 anoEE7Nf8KJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwagQwAKCRDRgEFAKaOo
 NlrbEACbfgyvTSxY+ce3646eCO/aAY7BqA97qRZztqyE263mWzCZ8Wct4gugCmhyH70nwbs9/EO
 qhLvKJaZcj+mtuAi1B4h0nhUId3XKpAHz8J7/JmjDV1rtx3b4T3I9KDV0C6CRg6yNf6Khx8CXdh
 oiRWx9jwWISnVeDYMcWEKqJaR6RDNXZdYFQz4jQBYdR8xfnZvrdiH0PkyzI6GJzCe2fnTsY5v7g
 sbP4YBQECs6num/JTM67XZtbs/Akg6iYrB4nWSk8mJEYr2+8CV2hrclMuQCxu3c0OY52BmOvbHm
 a87EddltgtiXSTo/50gwrhJIEequwDKFTI8cS9Zkfey94z9w/CxTrqY2t13rG6Wy5iIuyPkaZci
 cWOyX3k89n/pHw81eq3hlZ2Et3VUq7MuNkTs6wt/bSIOKbgsBAd8iQbLTGbeVCSXTTiwT0T9quQ
 KXHSNAMNxjY9/PkZWv/RtlCzed/Fby3aapzHU2U5KpyDv6qpban9v4XssC71o2m7pP81v0onQYc
 f4X1kKKHZHVs2MQgJA4oxrr0LFBbSAvi6TRlKaA1xveJ7I62GDWymaQK0bEY9kPmfe8sjdIL/U8
 HlAM85Abghn5gG46kGPx8yKvg8rS5egeD0VJTcn+Wl69IUXs8UmIoD0KhKLGEqH9sBkPTDOfCZM
 NS49Of2LQYfxcGw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 15:25:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5435

Removed as it was only used by ncurses and zlib and adding minimal
added-value for a considerable amount of added runtime.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 14aa0f3a3..121887d1f 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2940,15 +2940,6 @@ in the :ref:`ref-classes-setuptools3` class and inherit this class instead.
 
 The :ref:`ref-classes-sign_rpm` class supports generating signed RPM packages.
 
-.. _ref-classes-siteconfig:
-
-``siteconfig``
-==============
-
-The :ref:`ref-classes-siteconfig` class provides functionality for handling site
-configuration. The class is used by the :ref:`ref-classes-autotools` class to
-accelerate the :ref:`ref-tasks-configure` task.
-
 .. _ref-classes-siteinfo:
 
 ``siteinfo``

-- 
2.46.0


