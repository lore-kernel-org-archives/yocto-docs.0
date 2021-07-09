Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web08.10582.1625835826796656700
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Jul 2021 06:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm2 header.b=IA0OT1Fk;
 spf=pass (domain: stwcx.xyz, ip: 66.111.4.26, mailfrom: patrick@stwcx.xyz)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id 0FF5F5C0112;
	Fri,  9 Jul 2021 09:03:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 09 Jul 2021 09:03:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=Q4ut0hSYG/Qi3IDmHd8TjGzkZo
	yQbSDKP0VHobC28BE=; b=IA0OT1FkBuDcqiSDI7ESAh7j1/8MJwYR4czzBJrK4I
	gjzGAFYqwokZ9Z8+0OOnAmeiZMoABhu9DjmNzPmVZwIpLyqaUewqO8Y2J8mJeA1m
	TjZkUlHJzBBLWWtLFTE5ddd9rX8SElRsby4SsU7DvTOTQ2bWZzqk1qxj6zJN0OVY
	3FDebEmda6SEPbwQ+gu3cAlsV8jOPgRt8mMTrGZxnQULUYz8Ke/qvAKy+TcxgUug
	AQWuLVr4/K+oBWRbWyyS2mFfSP5McRBcCbuUszIYGACNvm7CSkwgP2LvycsWEak7
	91AKdzGV98Gv7xi6tYoVGvcY8/LcqXl5zXlnIZ2o0wJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Q4ut0hSYG/Qi3IDmH
	d8TjGzkZoyQbSDKP0VHobC28BE=; b=fauDnxwNy2nk3YT1ldjtTBjoep0WRBAWL
	q7NOzNCg9GoRIngRw7luImKs7rXPQWsTiTAscDqloRF7J1zzSF1JYNv0+RlXYYHz
	u/f2eZ8NiMa9WEJ4rKpMqkddWtMHW6jYYypmgggU0xkLt5CZbBfRDbDy7JbA5h+L
	v3QmJngkuXve2kh0OgkHPDo//2S0/AsPCeFSpuFpr91tl6RQu01O+3yyTYe7R24j
	OqIy26knoR5Vs0j+mTfU9OU8WQ/6z6PnzPzOdW7+6Zt6SbHWRHfP9S3Hw6xBYIks
	4xbHfOiyphA8zbyxp/tVnmUA3aroCbcMnYUq9hC2BjTslKi8VO1xw==
X-ME-Sender: <xms:MEnoYK7RS7xxLaVlODBIq6H90wjM1q6AIQFszvcBVrZR9CrqMW5F9g>
    <xme:MEnoYD63CMMIHZ8DlStSRo1Q0RcakUefcnYEd9dGtBhHmqVJzLi_7PGnt6dlyDU8R
    ZLuHC-19caZkyPZETc>
X-ME-Received: <xmr:MEnoYJcR4Ic7P5xTr56CqhHHKHX59Zfl6qVuJwW8Rg97WiRDJ8wMrXl42reqHVqkKMNxTEM6bvstDAnTZl3WibaSVRXzfNG4Grj5WVleqX50fw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeigdehjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhephffvuf
    ffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghm
    shcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpedtle
    dugeehjeetleehuddugeekheelteefkeeitdefgfelieefleehgfevjefhffenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghkse
    hsthiftgigrdighiii
X-ME-Proxy: <xmx:MEnoYHKTTJiWmcGM5XffUlo8wqLEIiWctcVdSzcrLlCDfsQG2HvGOA>
    <xmx:MEnoYOL3bqpvwiRVvXk14Muxh9vPF7QrWbGIj5PjnkM4v_NX5TVhCQ>
    <xmx:MEnoYIwzM0WvV0WOY8qRargrDGc34_ky8IaOuRa0CcNwvSEugfJ-wA>
    <xmx:MUnoYIwq7yr6JOdipCrUYRul2V8RaEHTbJdX2lG9b6fgMrgRU3pCbg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jul 2021 09:03:44 -0400 (EDT)
From: "Patrick Williams" <patrick@stwcx.xyz>
To: docs@lists.yoctoproject.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH] docs: remove image-mklibs references
Date: Fri,  9 Jul 2021 08:03:31 -0500
Message-Id: <20210709130331.369607-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The image-mklibs bbclass was removed from OE-Core with
commit 908df863b419d1cad7317153101fc827e7e3a354 and
corresponding changes to local.conf.sample were made
in meta-yocto with c8c8f284eb2abe7e1352850a885454487cc01986.

Remove all references to image-mklibs from the documentation
as it is no longer supported.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 documentation/dev-manual/common-tasks.rst |  2 +-
 documentation/ref-manual/classes.rst      | 16 +---------------
 documentation/ref-manual/variables.rst    |  4 ++--
 3 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 762636a17..4eab12d83 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -8002,7 +8002,7 @@ Here is an example of ``image-info.txt``:
 
    DISTRO = poky
    DISTRO_VERSION = 1.7
-   USER_CLASSES = buildstats image-mklibs image-prelink
+   USER_CLASSES = buildstats image-prelink
    IMAGE_CLASSES = image_types
    IMAGE_FEATURES = debug-tweaks
    IMAGE_LINGUAS =
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 09878c480..9b93807b6 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -932,20 +932,6 @@ specified by :term:`EFI_PROVIDER` if
 Normally, you do not use this class directly. Instead, you add "live" to
 :term:`IMAGE_FSTYPES`.
 
-.. _ref-classes-image-mklibs:
-
-``image-mklibs.bbclass``
-========================
-
-The ``image-mklibs`` class enables the use of the ``mklibs`` utility
-during the :ref:`ref-tasks-rootfs` task, which optimizes
-the size of libraries contained in the image.
-
-By default, the class is enabled in the ``local.conf.template`` using
-the :term:`USER_CLASSES` variable as follows::
-
-   USER_CLASSES ?= "buildstats image-mklibs image-prelink"
-
 .. _ref-classes-image-prelink:
 
 ``image-prelink.bbclass``
@@ -959,7 +945,7 @@ time.
 By default, the class is enabled in the ``local.conf.template`` using
 the :term:`USER_CLASSES` variable as follows::
 
-   USER_CLASSES ?= "buildstats image-mklibs image-prelink"
+   USER_CLASSES ?= "buildstats image-prelink"
 
 .. _ref-classes-insane:
 
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 71c2e11d9..00d45a79f 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8502,11 +8502,11 @@ system and gives an overview of their function and contents.
    :term:`USER_CLASSES`
       A list of classes to globally inherit. These classes are used by the
       OpenEmbedded build system to enable extra features (e.g.
-      ``buildstats``, ``image-mklibs``, and so forth).
+      ``buildstats``, ``image-prelink``, and so forth).
 
       The default list is set in your ``local.conf`` file::
 
-         USER_CLASSES ?= "buildstats image-mklibs image-prelink"
+         USER_CLASSES ?= "buildstats image-prelink"
 
       For more information, see
       ``meta-poky/conf/local.conf.sample`` in the :term:`Source Directory`.
-- 
2.31.1

