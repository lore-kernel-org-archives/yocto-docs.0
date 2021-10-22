Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E61C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 03:09:51 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.3426.1634872189964124158
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 20:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=DSSVlLeJ;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id DAFB320B71D3; Thu, 21 Oct 2021 20:09:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DAFB320B71D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1634872188;
	bh=5NFq1fq9Gx1UDvEpX03l+ZA70orxjnIbhpZpNg8PH94=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DSSVlLeJQtnQOgfi5zaQFx2ZUQwkJtMg22h3W4kU8EmjFC3vD1dm6IHkH9C878m07
	 wc7EhzLhwbHPgHN0qquiZdBQeSwWD3Okioa7W3liVKpcOkPf6Xx1w7rxN9hGg+Hujb
	 Z+3Y3OXYr0/vuCoI612/66V2dww0VJEdY0Msgilg=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/2] poky.yaml: fix lz4 package name for older Ubuntu versions
Date: Thu, 21 Oct 2021 20:09:28 -0700
Message-Id: 
 <a9acf608f4887336ac4d0d72b0ff39aedf713d1e.1634872024.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1634872024.git.paul.eggleton@linux.microsoft.com>
References: <cover.1634872024.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Oct 2021 03:09:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2033

From: Paul Eggleton <paul.eggleton@microsoft.com>

It turns out that for Ubunut, lz4 is the valid package name for newer
versions (e.g. 20.04 LTS) but not for older ones (e.g. 18.04 LTS, where
the correct package is liblz4-tool). In 20.04 the lz4 package includes
liblz4-tool in its "provides" so it's best to list that one for now.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/poky.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/poky.yaml b/documentation/poky.yaml
index 50d1f9c..a3aa40c 100644
--- a/documentation/poky.yaml
+++ b/documentation/poky.yaml
@@ -14,7 +14,7 @@ YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
 UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip texinfo gcc \
      build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
      xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
-     pylint3 xterm python3-subunit mesa-common-dev zstd lz4"
+     pylint3 xterm python3-subunit mesa-common-dev zstd liblz4-tool"
 FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip perl patch \
      diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
      ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
-- 
1.8.3.1


