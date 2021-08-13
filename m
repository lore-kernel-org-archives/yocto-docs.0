Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web12.37807.1628867513911495267
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 08:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=a7/BWZ8N;
 spf=pass (domain: pbarker.dev, ip: 66.111.4.29, mailfrom: paul@pbarker.dev)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id 1D6815C007F;
	Fri, 13 Aug 2021 11:11:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 13 Aug 2021 11:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=lNMmRGwKrQST2PM2dO+OVWgZHM
	9EsWD5enJ7dzcxYdk=; b=a7/BWZ8NJHSxpy1Rr2letrNGL/Ur18gf7sLnqCJfIo
	WXgfELEwVqHRPTgsbcRaXCMnmgrY5kL8uq+iN6OOMesvolAquXhsfs6Jn51B9xZw
	gn6Rb5WV/NOKD4BE0V1qAD0s+t71kbHGNCvamDL3BpL/vmIaxxtX9prN16T+7m0H
	Ko8FLGCnvTfIFqiONxSCV11+82Bg/gVZapTCL0mRjbB+c8TZZw7g/InXeg9mqY+v
	hBzZabf1M9BGEigMntD6oat0HM2ZAMFt38nZggjYQogigp/LHHDhDonE+KS0iGDR
	68hFObmamIdS5Ab4Yn887Hv6//DnokHxmne/3RcOXs7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=lNMmRGwKrQST2PM2d
	O+OVWgZHM9EsWD5enJ7dzcxYdk=; b=vxhe4JxTDoUH4a9mcpoJUbB50zC+Nmp7p
	pLW/yYZvg6jIM+nhWmTWnv+bzPpM/dmfrcjfJKst/hFzpwxizoLCU4ghjx966mlQ
	Uh7ae9rgUU5TqUU7uH87i4yqywppNI6sik9FXgGxJrI57PMg+5k63C0Bf5Xnyyzv
	d2vxJNO9vg9me/hP2iFVcTBLVQdHGTlM3sLxb2b9uH9u3FI0HDXDMjtMhkoNvYvk
	ArnJrXvcG7Ne2dFYwY75gAowd85C9utAYjojvfhMhom7nxwTJq3K/HQ45COiDgaW
	qocyGxBVUk8LrT30NGD41lF9ZHIs/pxoJ6bx6+2SiFEWrkipX3yGA==
X-ME-Sender: <xms:uIsWYbrs8RAUosxIRIFo-WRi4onI7ht7eSvGQzlERGN_m73enJBmJg>
    <xme:uIsWYVoDH2H_vW3e6hM7J_9cngt-IC_6eGk7EWGJyjbKPcj7usUOLGLLhk42PCc51
    QxHz15nF6jDbFKicEU>
X-ME-Received: <xmr:uIsWYYOhj1FR83dtDYbfWEDfLxz6yOFmZAYRS7Uzb3xal62ZmJKNeD5zXSW1zmmjzuJxIzPq-EXSu_5zHkt7G8x_sGTCd3YBCEBaOoAKgn0qua7sDHLDcgGhX6E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrkeehgdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdgu
    vghvqeenucggtffrrghtthgvrhhnpeetfeelleehueegjedugeeitddtvdffvdelfefgvd
    dugeekudelgeduiefhieejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:uIsWYe7i6ohe1UT1ZMOUjDPo3Pvh096h3xeMNVJvLErX7KNSQymobg>
    <xmx:uIsWYa43kCcc-T3LhJews77pixwO4I_dnWMcy7yGCzPgTjTOGi0Qbw>
    <xmx:uIsWYWilvCMq5hm0ngaUDVATOYu1yIfAvhhcj6R2V37Bng5jQLSUpw>
    <xmx:uYsWYfhLEJYJUr2P7nPBQJPtvUNcapW9zJEWinxWFbtJ442oA8cAiQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Aug 2021 11:11:52 -0400 (EDT)
From: "Paul Barker" <paul@pbarker.dev>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [PATCH] ref-manual: Document BB_GIT_SHALLOW and friends
Date: Fri, 13 Aug 2021 16:11:48 +0100
Message-Id: <20210813151148.19415-1-paul@pbarker.dev>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation is based on the commit message of bitbake rev 5ed7d85fda
and mailing list discussion.

[YOCTO #14493]

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 documentation/ref-manual/variables.rst | 55 ++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index f6d248a19..edab054f1 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -524,6 +524,61 @@ system and gives an overview of their function and contents.
       clean up your :term:`DL_DIR` directory by deleting any Git or other
       source control work directories.
 
+   :term:`BB_GENERATE_SHALLOW_TARBALLS`
+      Setting this variable to "1" when :term:`BB_GIT_SHALLOW` is also set to
+      "1" causes bitbake to generate shallow mirror tarballs when fetching git
+      repositories. The number of commits included in the shallow mirror
+      tarballs is controlled by :term:`BB_GIT_SHALLOW_DEPTH`.
+
+      If both :term:`BB_GIT_SHALLOW` and :term:`BB_GENERATE_MIRROR_TARBALLS` are
+      enabled, bitbake will generate shallow mirror tarballs by default for git
+      repositories. This separate variable exists so that shallow tarball
+      generation can be enabled without needing to also enable normal mirror
+      generation if it is not desired.
+
+      For example usage, see :term:`BB_GIT_SHALLOW`.
+
+   :term:`BB_GIT_SHALLOW`
+      Setting this variable to "1" enables the support for fetching, using and
+      generating mirror tarballs of shallow git repositories. The external
+      git-make-shallow script is used for shallow mirror tarball creation.
+
+      When BB_GIT_SHALLOW is enabled, bitbake will attempt to fetch a shallow
+      mirror tarball. If the shallow mirror tarball cannot be fetched, it will
+      try to fetch the full mirror tarball and use that.
+
+      When a mirror tarball is not available, a full git clone will be performed
+      regardless of whether this variable is set or not. Support for shallow
+      clones is not currently implemented as git does not directly support
+      shallow cloning a particular git commit hash (it only supports cloning
+      from a tag or branch reference).
+
+      See also :term:`BB_GIT_SHALLOW_DEPTH` and
+      :term:`BB_GENERATE_SHALLOW_TARBALLS`.
+
+      Example usage::
+
+         BB_GIT_SHALLOW ?= "1"
+
+         # Keep only the top commit
+         BB_GIT_SHALLOW_DEPTH ?= "1"
+
+         # This defaults to enabled if both BB_GIT_SHALLOW and
+         # BB_GENERATE_MIRROR_TARBALLS are enabled
+         BB_GENERATE_SHALLOW_TARBALLS ?= "1"
+
+   :term:`BB_GIT_SHALLOW_DEPTH`
+      When used with :term:`BB_GENERATE_SHALLOW_TARBALLS`, this variable sets
+      the number of commits to include in generated shallow mirror tarballs.
+      With a depth of 1, only the commit referenced in :term:`SRCREV` is
+      included in the shallow mirror tarball. Increasing the depth includes
+      additional parent commits, working back through the commit history.
+
+      If this variable is unset, bitbake will default to a depth of 1 when
+      generating shallow mirror tarballs.
+
+      For example usage, see :term:`BB_GIT_SHALLOW`.
+
    :term:`BB_NUMBER_THREADS`
       The maximum number of tasks BitBake should run in parallel at any one
       time. The OpenEmbedded build system automatically configures this
-- 
2.31.1

