Return-Path: <paulg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64500C36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 19:27:17 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by mx.groups.io with SMTP id smtpd.web10.2019.1742585234115378432
 for <docs@lists.yoctoproject.org>;
 Fri, 21 Mar 2025 12:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@kernel.org header.s=k20201202 header.b=fANFSMrG;
 spf=pass (domain: kernel.org, ip: 147.75.193.91, mailfrom: paulg@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D5509A49555
	for <docs@lists.yoctoproject.org>; Fri, 21 Mar 2025 19:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E42C4CEE3
	for <docs@lists.yoctoproject.org>; Fri, 21 Mar 2025 19:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742585232;
	bh=806hy/sQre0pjqTz3o9svXY9tBj8kCemmNekzntMDoc=;
	h=From:To:Subject:Date:From;
	b=fANFSMrGoYvlZCqon00Q+h+BQQBIZgMZ/gtcTSjy1p7ocvMJrSwIi0dgfd+B/sjHz
	 ekcMTTZSF5ZNkFqswHGO4PtYazB3w7k6SSVJTXlXexyn+b5jZKTTPdZWzKYpWAS2/K
	 ms+BE2R7ZoZX7iBDj97VOIAZ0UADFPhCUya2W3/eIwhZFGp0g+fB+sVRbzpV0Q+87b
	 j0XV07YzMIiS9c0Emh59Nn5bvFa79amCLh5YGaYQyieGEDNXkoxSN/O/y2gh7DtvWL
	 Dx+2A50bEg+W9rngjTk6J9ukvQYF2vipW+m7GDVcXh+RCw34msYy93l2lh8O3rojtL
	 skMd/85hOB1Tg==
From: paulg@kernel.org
To: docs@lists.yoctoproject.org
Subject: [PATCH] requirements: move Ubuntu-20.04 into unsupported category due to python
Date: Fri, 21 Mar 2025 15:27:11 -0400
Message-Id: <20250321192711.3061486-1-paulg@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 21 Mar 2025 19:27:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6605

From: Paul Gortmaker <paul.gortmaker@kernel.org>

Bitbake commit 0d2e682d00df ("bitbake: lib/bb: Bump minimum python
version requirement to 3.9" -- poky commit 67566c7410e1) means that
Ubuntu 20.04 is no longer supported out-of-the-box as detailed further
in the respective commit log.

While it is true that it can still be used with buildtools, that can
also be said for nearly every other unsupported distro out there,
including Ubuntu 18.04 that we listed as unsupported some years ago.
Hence continuing to list it as supported with the new python requirement
in place does not make sense.

So we move it alongside of the 18.04 entry, into the "possibly tested,
but you get what you get" category.  And add an explicit mention of the
buildtools, so people have a thread to pull on.

Signed-off-by: Paul Gortmaker <paulg@kernel.org>

diff --git a/documentation/ref-manual/system-requirements.rst b/documenta=
tion/ref-manual/system-requirements.rst
index 93b95a7fb251..3d0d26e2f08b 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -58,8 +58,6 @@ Supported Linux Distributions
 Currently, the &DISTRO; release ("&DISTRO_NAME;") of the Yocto Project i=
s
 supported on the following distributions:
=20
--  Ubuntu 20.04 (LTS)
-
 -  Ubuntu 22.04 (LTS)
=20
 -  Ubuntu 24.04 (LTS)
@@ -93,11 +91,15 @@ organizations publishing them no longer make updates =
publicly available:
=20
 -  Ubuntu 18.04 (LTS)
=20
+-  Ubuntu 20.04 (LTS)
+
 -  Ubuntu 23.04
=20
 Note that the Yocto Project doesn't have access to private updates
 that some of these versions may have. Therefore, our testing has
-limited value if you have access to such updates.
+limited value if you have access to such updates.  Also, buildtools
+may have to be used on older releases in order to get current enough
+tools, such as python.
=20
 Finally, here are the distribution versions which were previously
 tested on former revisions of "&DISTRO_NAME;", but no longer are:
--=20
2.25.1


