Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E220C36018
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 15:05:03 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.54559.1743433497259543744
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Mar 2025 08:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mK+OQEmr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EE0E4452D;
	Mon, 31 Mar 2025 15:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743433495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m4gVV9dh2hjG4/KCRFMzslxzD7/Ni2tTDZyQakfX/GI=;
	b=mK+OQEmr+fnr++DYH0jQrzAUcW8v2nK6ZuV8LESAL/Qk9AP2tCLgTkCi7zhpVlvJvLDL6S
	evlVYlT7iZzk9fFPKvcPaU5sfL5h6px8LThvOD48JKDz51YUQ97chCg+mSHx+VkLQbNpEQ
	3LJlu7Kj3Pf3EqRx4aEmgzOMbOKE1aJsqAfWPwdnHy7aDdSvSh9Wlk3Kvc69HpkZvJypJS
	uAwcR18xyPyfcvfncLuOFL4lcpspIULu3ejoQUkBDL0E4j5bc8FynlPpU8VuL9a43BLDuc
	QMSMYAVrZPEcyXGNSI40NPOoYvqxtBuWl9RiwgQabUlSbXN90GPjpK3eHovcwQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 31 Mar 2025 17:04:45 +0200
Subject: [PATCH v4 1/6] documentation/conf.py: define a manpage url
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-cc-vars-v4-1-2281f4c47652@bootlin.com>
References: <20250331-cc-vars-v4-0-2281f4c47652@bootlin.com>
In-Reply-To: <20250331-cc-vars-v4-0-2281f4c47652@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3343;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ne+QialOdtfnlahvHQ/OHnZTV9Ck64417p7P+E+WWOY=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn6q8W1xAeblKk0qQVtnl/dpt3RJZgv2S3qxcup
 aRJC+RpbRmJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+qvFgAKCRDRgEFAKaOo
 NrIID/9Tfa2tSvOhvjvDY3SMB4XlZUnrsZHiqQn0Le48LyE8FUrNRSxDvByed6YbV0n0foH+jsW
 xQD2nB0leZaY/PntfJMX9ejAMA4Asj5NzNXfKLBlPCxofoKl01PgQOON/TGugq63z2dF844akf/
 9tSjB7xrfxzS6qAETlwZzTmykJqs/9DGk87gmypF0YmYFgkDUaLiPsIecToQgsKqhPYpiCGU31P
 9RWkvctK34fZBIoSbjdLIPMrLpYOYTsoSv3wTChs8svKyVfvrofpbnm76/tbscPBBWL5roCQlng
 R0/vEVGjlKjE1Y4GAaXo0eQ1gomeHfgLEL0qpYblamrRqXF/x3CjuGmz5IP7jgsyWaBXGcmF3vP
 2aCfwz2AXKz6TlpaXNHM9rps43MR9/RrKTzR9w6gR7hGBEoCQaoxfoAzf+dUmyRdrm7Je3ARCuL
 6NGkw3bCnkeZewDLQfJiWuZnBhTZV3ByjIzrnqBH2YdCSiwPsIsSib4MZmOl3uM+RA3YjtEij4q
 8UyRGVtd50i2CiA2dsLk1xMnH+9XdujV6qYwDrDBvTvf8WrtgxTmzcp7R6OCPOYnYUxLDtLgDsj
 n9zHeSUuLIXhMrbT5P6Zpo8FhFCa1IYohPX2DIUZiI5yZzHWMeygSpTVSLueDobHu3LrycSLiFu
 3+7PzF2BmJw2+Rw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtteeuheejgfdtfeekteehueeugfejgedvleehieelteefkeegjeelueeugeelveenucffohhmrghinhepshhphhhinhigqdguohgtrdhorhhgpdifihhkihhpvgguihgrrdhorhhgpdguvggsihgrnhdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdhhvgdrnhgvthenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhni
 hessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvgdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Mar 2025 15:05:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6687

By defining the manpages_url we can use the :manpage: role in the
documentation for providing links to manpages. See:
https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-manpages_url

Replace existing manpages links to use this role.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/conf.py                      | 3 +++
 documentation/overview-manual/concepts.rst | 2 +-
 documentation/overview-manual/yp-intro.rst | 2 +-
 documentation/ref-manual/variables.rst     | 3 +--
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/documentation/conf.py b/documentation/conf.py
index 477e75112a..2aceeb8e79 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -111,6 +111,9 @@ extlinks = {
     'wikipedia': ('https://en.wikipedia.org/wiki/%s', None),
 }
 
+# To be able to use :manpage:`<something>` in the docs.
+manpages_url = 'https://manpages.debian.org/{path}'
+
 # Intersphinx config to use cross reference with BitBake user manual
 intersphinx_mapping = {
     'bitbake': ('https://docs.yoctoproject.org/bitbake/' + bitbake_version, None)
diff --git a/documentation/overview-manual/concepts.rst b/documentation/overview-manual/concepts.rst
index e4d806f98f..416c28f0d9 100644
--- a/documentation/overview-manual/concepts.rst
+++ b/documentation/overview-manual/concepts.rst
@@ -2204,7 +2204,7 @@ require root privileges, the fact that some earlier steps ran in a fake
 root environment does not cause problems.
 
 The capability to run tasks in a fake root environment is known as
-"`fakeroot <http://man.he.net/man1/fakeroot>`__", which is derived from
+":manpage:`fakeroot <fakeroot(1)>`", which is derived from
 the BitBake keyword/variable flag that requests a fake root environment
 for a task.
 
diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/overview-manual/yp-intro.rst
index 4a27e12e01..11e6d99e32 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -400,7 +400,7 @@ Yocto Project:
    Autobuilder :doc:`here </test-manual/understand-autobuilder>`.
 
 -  *Pseudo:* Pseudo is the Yocto Project implementation of
-   `fakeroot <http://man.he.net/man1/fakeroot>`__, which is used to run
+   :manpage:`fakeroot <fakeroot(1)>`, which is used to run
    commands in an environment that seemingly has root privileges.
 
    During a build, it can be necessary to perform operations that
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 62e339ed81..8e612d061a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4539,8 +4539,7 @@ system and gives an overview of their function and contents.
 
       The value in :term:`INITSCRIPT_PARAMS` is passed through to the
       ``update-rc.d`` command. For more information on valid parameters,
-      please see the ``update-rc.d`` manual page at
-      https://manpages.debian.org/buster/init-system-helpers/update-rc.d.8.en.html
+      please see the manual page: :manpage:`update-rc.d <update-rc.d(8)>`.
 
    :term:`INSANE_SKIP`
       Specifies the QA checks to skip for a specific package within a

-- 
2.47.0


